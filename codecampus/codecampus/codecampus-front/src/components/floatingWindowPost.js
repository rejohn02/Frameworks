import React from "react";
import "../styles/floatingWindowPost.css";

function PostFloatingWindow({ handleClosePostWindow, userData}) {
    return (
        <div id="bluredBackground">
            <div id="floatingWindowPost">
                <div id="textNewPostTop">
                    <div id="topText">
                        <h2>Crear publicación</h2>
                    </div>
                    <div id="closeFloatingWindow" onClick={handleClosePostWindow}>
                        <p>X</p>
                    </div>
                </div>
                <div id="infoNewPost">
                    <img src={"../images/userImages/"+ userData.url_foto} id="infoUser" alt="foto de perfil" />
                    <span>{userData.nombre}</span>
                </div>
                <div id="textInputNewPost">
                    <textarea placeholder="¿Qué compartirás hoy con la comunidad de FIF?" id="textNewPost"></textarea>
                </div>
                <div id="uploadImages">
                    <input type="file"></input>
                </div>
                <div id="buttonNewPost">
                    <button>PUBLICAR</button>
                </div>
            </div>
        </div>
    );
}

export default PostFloatingWindow;
