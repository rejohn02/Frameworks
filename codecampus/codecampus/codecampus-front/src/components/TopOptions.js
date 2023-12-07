import React, { useState, useEffect } from "react";
import "../styles/TopOptionStyle.css";
import PostFloatingWindow from "./floatingWindowPost";

function TopOptions(props) {
    const [showPostWindow, setShowPostWindow] = useState(false);
    const userData = props.datos;

    const handleOpenPostWindow = () => {
        setShowPostWindow(true);
    };

    const handleClosePostWindow = () => {
        setShowPostWindow(false);
    };

    return (
        <div id="topOptions">
            <div id="codeCampusLogo">
                <img src="../images/General/logo.png" id="imgLogo" alt="logo de Code Campus" />
            </div>
            <div id="topOptionsSearchBar" onClick={handleOpenPostWindow}>
                <div id="newPost">
                    <span> ¿Qué compartirás con la comunidad? </span>
                </div>
            </div>
            <div id="topOptionsUserInfo">
            <img src={"../images/userImages/"+ userData.url_foto} id="infoUser" alt="foto de perfil" />
                    <span>{userData.nombre}</span>
            </div>
            {showPostWindow && <PostFloatingWindow handleClosePostWindow={handleClosePostWindow} userData={userData}/>}
        </div>
    );
}

export default TopOptions;
