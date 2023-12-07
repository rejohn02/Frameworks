import React, { useState } from "react";
import axios from "axios";
import "../styles/LoginStyles.css"
import { useNavigate } from "react-router-dom";

function Login() {
    const [expediente, setExpediente] = useState('');
    const [contrasenia, setContrasenia] = useState('');
    const navigate = useNavigate();


    const handleLogin = async () => {
        try {
            const response = await axios.post('http://localhost:5000/Login', {
                expediente,
                contrasenia
            });

            const userData = response.data.userData;

            navigate(`/Home`, { state: { userData } });
            console.log(userData);
        } catch (error) {
            console.error('Error al iniciar sesión: ', error);
        }
    };

    return (
        <div id="mainContainer">
            <div id="login">
            <div id="textLogin">
                <h1>INICIA SESION</h1><br/>
            </div>
            <div id="formLogin">
                <div id="loginExpediente">
                    <p>Ingresa tu Expediente</p>
                    <input
                        type="text"
                        placeholder="Expediente"
                        value={expediente}
                        onChange={(e) => setExpediente(e.target.value)}
                        id="inputExpediente"
                    />
                </div>
                <div id="loginPassword">
                    <p>Contraseña</p>
                    <input
                        type="password"
                        placeholder="Contraseña"
                        value={contrasenia}
                        onChange={(e) => setContrasenia(e.target.value)}
                        id="inputContrasenia"
                    />
                </div>
                <div id="buttonLogin">
                    <button onClick={handleLogin} id="buttonIniciarSesion">Iniciar sesión</button>
                </div>
                <div id="buttonRecover">
                    <button id="buttonIniciarSesion">Recuperar contraseña</button>
                </div>
            </div>
        </div>
        </div>
    );
}

export default Login;
