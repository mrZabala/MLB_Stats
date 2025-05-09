<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>

<style>
#heroSection {
    background: url('./assets/img/hero-section.jpeg');
    background-size: cover;
    /* background: red; */
    background-position: center;
    height: 100vh;
}

#blackShadow {
    opacity: 0.80; 
}

.boton{
  
    transition: 0.5s;
}
.boton:hover{
    background-color:rgba(19, 21, 26, 0.3);
    color: white;
    transition: 0.5s;
    border-radius: 5px;
    padding: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);

}
.cont1{
    
}       
</style>

<body class="flex flex-col">
    <!-- START NAV -->
    <nav id="navShadow" class="flex justify-between bg-gray-800 text-white p-4">
        <!-- LEFT Hand Side -->
        <div>
            <h1>Lorem, ipsum.</h1>
        </div>
        <!-- END LEFT Hand Side -->
        
        <!-- RIGHT Hand Side -->
        <div>
            <ul class="flex gap-6">
                <li><a href="#" class="boton">Inicio</a></li>
                <li><a href="#" class="boton">Jugadores</a></li>
                <li><a href="#" class="boton">Equipos</a></li>
                <li><a href="#" class="boton">Partidos</a></li>
                <li><a href="#" class="boton">Trivia</a></li>
            </ul>
        </div>
        <!-- END RIGHT Hand Side -->
    </nav>
    <!-- END NAV -->

    <!-- Hero Section -->
    <section id="heroSection" class="max-h-[520px] ">
        <div id="blackShadow" class="flex flex-col justify-center items-center h-full bg-black bg-opacity-25 text-left  cont1" >
            <h1 class="text-4xl text-white font-bold text-left">Bienvenido a la Liga de MLB</h1>
            <p class="text-lg text-white mt-2 " >Donde la pasión y el deporte se encuentran</p>
            <button class="mt-4 px-6 py-2 bg-blue-500 text-white rounded ">Comenzar</button>
        </div>
    </section>
    <!-- END Hero Section -->

    <section id="footer-section" class="max-h-[150px] ">
        <div id="blackShadow" class="flex flex-col justify-center items-center h-full bg-black bg-opacity-25 text-left  cont1" >
            <h1 class="text-4xl text-white font-bold text-left">Bienvenido a la Liga de MLB</h1>
            <p class="text-lg text-white mt-2 " >Donde la pasión y el deporte se encuentran</p>
        </div>
    </section>

    </body>
</html>