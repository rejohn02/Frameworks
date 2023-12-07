import React from "react";
import { useLocation } from "react-router-dom";
import TopOptions from "./TopOptions";
import SideBar from "./SideBar";
import MainContent from "./MainContent";
import SideBarCompanieros from "./SideBarCompanieros";



function Home(){
    const location = useLocation();
    const userData  = location.state?.userData;

    return(
        <div>
            <TopOptions datos={userData}></TopOptions>
            <SideBar></SideBar>
            <MainContent></MainContent>
            <SideBarCompanieros></SideBarCompanieros>
        </div>
    );
}

export default Home;