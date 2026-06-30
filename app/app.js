const express = require("express");
const client = require("prom-client");

const app = express();

const PORT = process.env.PORT || 3000;

// Collect default Node.js metrics
client.collectDefaultMetrics();

// Counter for HTTP requests
const httpRequestCounter = new client.Counter({
  name: "http_requests_total",
  help: "Total number of HTTP requests",
  labelNames: ["method", "route", "status_code"],
});

// Middleware to count every request
app.use((req, res, next) => {
  res.on("finish", () => {
    httpRequestCounter.inc({
      method: req.method,
      route: req.path,
      status_code: res.statusCode,
    });
  });

  next();
});

// Home Route
app.get("/", (req, res) => {
  res.send("Version 2 deployed!");
});

// Health Check
app.get("/health", (req, res) => {
  res.status(200).send("OK");
});

// Prometheus Metrics
app.get("/metrics", async (req, res) => {
  res.set("Content-Type", client.register.contentType);
  res.end(await client.register.metrics());
});

app.listen(PORT, () => {
  console.log(`Application running on port ${PORT}`);
});
