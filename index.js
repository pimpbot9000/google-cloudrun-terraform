const express = require('express');
const app = express();

app.get('/', (req, res) => {
  const name = process.env.NAME || 'World';
  res.send(`Hello ${name}!!! I've been pushed to cloud with github actions`);
});

app.get('/health', (req, res) => {
    res.send(`i'm healthy!`);
  });

const port = process.env.PORT || 8080;
app.listen(port, () => {
  console.log(`helloworld: listening on port ${port}`);
});