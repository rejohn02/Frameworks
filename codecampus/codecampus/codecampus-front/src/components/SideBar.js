import React from 'react';
import '../styles/SideBarStyle.css';

function SideBar(){
    return(
        <div id='sideBar'>
            <div id='inicio'>
                <h3>INICIO</h3>
            </div>
            <div id='market'>
                <h3>MARKET</h3>
            </div>
            <div id='raites'>
                <h3>RAITES</h3>
            </div>
            <div id='anuncios'>
                <h3>ANUNCIOS</h3>
            </div>
            <div id='opciones'>
                <h3>OPCIONES</h3>
            </div>
        </div>
        )
}
 
export default SideBar;