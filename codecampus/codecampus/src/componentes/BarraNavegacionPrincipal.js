import React from 'react';
import { Link } from 'react-router-dom';

const BarraNavegacionInferior = () => {
  return (
    <div id='barraInferiorNavegacion'>
      <Link to="/inicio">
        <img src="../imagenes/iconoInicio.png" alt="Inicio" className='imagenNavInferior'/>
      </Link>
      <Link to="/market">
        <img src="/images/market-icon.png" alt="Market" className='imagenNavInferior'/>
      </Link>
      <Link to="/rates">
        <img src="/images/rates-icon.png" alt="Rates" className='imagenNavInferior'/>
      </Link>
      <Link to="/messages">
        <img src="/images/messages-icon.png" alt="Mensajes" className='imagenNavInferior'/>
      </Link>
      <Link to="/options">
        <img src="/images/options-icon.png" alt="Opciones" className='imagenNavInferior'/>
      </Link>
    </div>
  );
};

export default BarraNavegacionInferior;
