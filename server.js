const express = require('express');
const app = express();

const PORT = process.env.PORT || 3000;
const ENV = process.env.NODE_ENV || 'development';

app.get('/', (req, res) => {
  res.send(`
    <html>
      <body style="font-family: sans-serif; padding: 40px; 
                   background: #0f0f0f; color: #fff;">
        <h1>🚀 Progree DevOps Internship</h1>
        <p><strong>Built by:</strong> Fahad Ali</p>
        <p><strong>Environment:</strong> ${ENV}</p>
        <p><strong>Port:</strong> ${PORT}</p>
        <p style="color: #4ade80;">✅ Container running successfully</p>
      </body>
    </html>
  `);
});

app.get('/health', (req, res) => {
  res.json({ status: 'healthy', environment: ENV, port: PORT });
});

app.listen(PORT, () => {
  console.log(`[SERVER] Running on port ${PORT} in ${ENV} mode`);
});