const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.json({ message: 'Hello World!' });
});

app.get('/health', (req, res) => {
  res.send('ok');
});

app.listen(port, () => {
  console.log(`API Hello World en écoute sur http://localhost:${port}`);
});
