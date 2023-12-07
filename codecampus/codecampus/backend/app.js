const express = require('express');
const path = require('path');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');
const { default: axios } = require('axios');

const app = express();

app.use(cors());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'codecampus'
});

db.connect((err) => {
    if(err){
        console.error("Error de conexion a la base de datos: ",err);
        return;
    }
    console.log("Conexion a la base de datos establecida");
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


app.post('/login', (req, res) => {
    const { expediente, contrasenia } = req.body;

    db.query('SELECT * FROM t_usuarios WHERE expediente = ? AND contrasenia = ?', [expediente, contrasenia], (err, results) => {
        if (err) {
            console.error('Error al consultar la base de datos: ', err);
            res.status(500).json({ error: 'Error interno del servidor' });
        } else {
            if (results.length > 0) {
                const userData = results[0];
                res.status(200).json({ message: 'Usuario autenticado', userData});
            } else {
                res.status(401).json({ error: 'Credenciales inválidas' });
            }
        }
    });
});


app.use(express.static(path.join(__dirname, '../codecampus-front/build')));

app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, '../codecampus-front/build', 'index.html'));
});


const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Servidor Express corriendo en el puerto ${PORT}`);
});


  
