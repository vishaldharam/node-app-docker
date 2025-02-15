const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello, Cloud Run with Docker Buildx!");
});

app.get("/docker", (req, res) => {
  res.send({
    msg: "Hello! you have successfully configure the github action workflow and GCP cloud run",
    response: "Thanks for getting it done!",
  });
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

// listening
