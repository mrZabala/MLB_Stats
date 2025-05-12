<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Cal+Sans&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap');

    #heroSection {
        background: url('./assets/img/hero-section.png');
        background-size: cover;
        /* background: red; */
        background-position: center;
        height: 100vh;
    }

    .boton {

        transition: 0.5s;
    }

    .boton:hover {
        background-color: rgba(19, 21, 26, 0.3);
        color: white;
        transition: 0.5s;
        border-radius: 5px;
        padding: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);

    }

    .page-title,
    .hero-title,
    .best-of-the-best {
        font-family: "Cal Sans", sans-serif;
        font-weight: 400;
        font-style: normal;
    }

    .menu,
    .hero-paragraph {
        font-family: "Roboto", sans-serif;
        font-optical-sizing: auto;
        font-weight: 400;
        font-style: normal;
        font-variation-settings:
            "wdth" 100;
    }
</style>
<!-- Eddy Duran La Para -->

<body class="flex flex-col">
    <!-- START NAV -->
    <nav id="top" class="flex justify-between bg-gray-800 text-white p-4 items-center lg:p-8">
        <!-- LEFT Hand Side -->
        <div>
            <a href="index.php">
                <h1 class="page-title">MLB STATS</h1>
            </a>
        </div>
        <!-- END LEFT Hand Side -->

        <!-- RIGHT Hand Side -->
        <div>
            <!-- Mobile Menu -->
            <div>
                <img src="assets/img/bars-solid.png" alt="" class="max-w-[50px] h-auto lg:hidden">
            </div>
            <!-- Desktop Menu -->
            <div class="menu">
                <ul class="flex gap-6 hidden lg:flex">
                    <li><a href="index.php" class="boton">Inicio</a></li>
                    <li><a href="jugadores.php" class="boton">Jugadores</a></li>
                    <li><a href="equipos.php" class="boton">Equipos</a></li>
                    <li><a href="partidos.php" class="nav-link px-3 py-2 rounded hover:bg-gray-700">Partidos</a></li>
                    <li><a href="#" class="boton">Trivia</a></li>
                </ul>
            </div>

        </div>
        <!-- END RIGHT Hand Side -->
    </nav>
    <!-- END NAV -->

    <!-- Hero Section -->
    <section id="heroSection" class="max-h-[520px]">
        <div id="blackShadow" class="flex flex-col justify-center items-center h-full">
            <h1 class="text-4xl text-white font-bold text-left p-4 hero-title">Bienvenido a la Liga de MLB</h1>
            <p class="text-lg text-white mt-2 p-4 hero-paragraph lg:w-[850px] text-center">Tu centro para todo lo
                relacionado con el béisbol: desde estadísticas de jugadores y resultados de partidos hasta momentos
                históricos y noticias de última hora.</p>
            <!-- <button class="mt-4 px-6 py-2 bg-blue-500 text-white rounded p-4 hero-title">Comenzar</button> -->
        </div>
    </section>
    <!-- END Hero Section -->

    <!-- Cards Section -->
    <section id="info" class="flex flex-col gap-4 p-4 lg:m-8 lg:flex-row">
        <div class="bg-white rounded-xl shadow-md p-6 flex flex-col gap-2">
            <img src="assets/img/baseball-bat-ball-solid.svg" alt="" class="max-w-[50px] h-auto">
            <h3 class="text-xl font-semibold mb-2">El Pasatiempo de América, Evolucionado</h3>
            <p class="text-gray-600">Explora la rica historia y evolución moderna del béisbol. Desde los campos de
                tierra hasta los estadios, sigue el recorrido del deporte que marcó una nación.</p>
        </div>

        <div class="bg-white rounded-xl shadow-md p-6 flex flex-col gap-2">
            <img src="assets/img/baseball-solid.svg" alt="" class="max-w-[50px] h-auto">
            <h3 class="text-xl font-semibold mb-2">Más Allá de los Números</h3>
            <p class="text-gray-600">Sumérgete en los promedios de bateo, ERA y estadísticas avanzadas para entender el
                juego más allá del marcador.</p>
        </div>

        <div class="bg-white rounded-xl shadow-md p-6 flex flex-col gap-2">
            <img src="assets/img/chart-simple-solid.svg" alt="" class="max-w-[50px] h-auto">
            <h3 class="text-xl font-semibold mb-2">Tu Equipo, Tus Estadísticas</h3>
            <p class="text-gray-600">Selecciona tu equipo favorito y sigue cada jugada, estadística y posición en la
                tabla con nuestras herramientas personalizadas.</p>
        </div>
    </section>
    <!-- END Cards Section -->

    <!-- Player Spotlight Section -->
    <section id="players" class="py-12 bg-gray-100">
        <div class="max-w-6xl mx-auto px-4">
            <h2 class="text-3xl font-bold text-center mb-10 best-of-the-best">Lo Mejor de lo Mejor</h2>

            <div class="flex flex-col md:flex-row md:justify-between gap-8">

                <?php
                // Conexión a la base de datos correcta
                $conexion = new mysqli("localhost", "root", "", "baseball_db");
                if ($conexion->connect_error) {
                    die("Conexión fallida: " . $conexion->connect_error);
                }

                // Consulta a la tabla jugadores
                $sql = "SELECT * FROM jugadores";
                $cant = 3;
                $resultado = $conexion->query($sql);
                ?>
                <!-- HTML -->
                <div class="flex flex-wrap gap-4">
                    <?php while ($jugador = $resultado->fetch_assoc()): ?>
                        <div class="bg-white rounded-xl shadow-md overflow-hidden flex-1 max-w-xs">
                            <img src="<?= $jugador['imagen'] ?>" alt="<?= $jugador['nombre_del_jugador'] ?>"
                                class="w-full h-60 object-cover">
                            <div class="p-4">
                                <h3 class="text-xl font-semibold mb-1"><?= $jugador['nombre_del_jugador'] ?></h3>
                                <p class="text-gray-600 mb-2"><?= $jugador['posicion_del_jugador'] ?></p>
                                <p class="text-gray-500 text-sm mb-2">País de Origen: <?= $jugador['lugar_de_nacimiento'] ?></p>
                                <a href="jugador-detalle.php?id=<?= $jugador['id_del_jugador'] ?>"
                                    class="inline-block bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">
                                    Ver más
                                </a>

                            </div>
                        </div>
                    <?php endwhile; ?>
                </div>

                <?php $conexion->close(); ?>

            </div>
        </div>
    </section>
    <!-- END Player Spotlight Section -->

    <!-- FOOTER -->
    <footer class="bg-gray-900 text-white py-6 mt-12 px-4  text-lg">
        <div class="px-4 flex flex-col items-center gap-4">

            <!-- Enlaces -->
            <div class="w-full flex justify-between px-4 lg:justify-evenly">
                <a href="#top" class="hover:text-gray-400 transition">Inicio</a>
                <a href="#info" class="hover:text-gray-400 transition">Info</a>
                <a href="#players" class="hover:text-gray-400 transition">Jugadores</a>
            </div>

            <!-- Derechos -->
            <div class="flex items-center space-x-2">
                <span>&copy;</span>
                <span>2025 MLB STATS. Todos los derechos reservados.</span>
            </div>

        </div>
    </footer>
    <!-- FOOTER End -->
</body>

</html>