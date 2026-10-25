const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// Probar que el servidor está vivo
app.get('/api/v1/health', (req, res) => {
  res.json({ status: 'ok', mensaje: 'Servidor XicoLab listo y funcionando' });
});

app.listen(PORT, () => {
  console.log(`¡Servidor listo en el puerto ${PORT}!`);
});