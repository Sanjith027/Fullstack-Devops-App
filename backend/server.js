const express = require('express');
const app = express();
const PORT = 5000;

app.get('/', (req, res) => res.send("Welcome to the backend!"));
app.get('/api', (req, res) => res.json({ message: "Hello from Node backend!" }));

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
