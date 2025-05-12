<?php
// Configuración de la base de datos
$servername = "127.0.0.1";
$username = "root"; // Usuario por defecto de XAMPP
$password = ""; // Contraseña por defecto de XAMPP (vacía)
$dbname = "baseball_db";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Establecer el conjunto de caracteres a UTF-8
$conn->set_charset("utf8mb4");

// Obtener la fecha actual
$fecha_actual = date('Y-m-d');

// Consulta para obtener los próximos partidos
$sql_partidos = "SELECT 
                    j.id_del_juego, 
                    e.nombre_del_equipo AS nombre_equipo_local, 
                    j.estadio_donde_se_jugara, 
                    j.fecha_del_juego, 
                    j.hora_inicio, 
                    j.pitcher_abridor, 
                    j.temporada, 
                    j.descripcion
                FROM juegos j
                JOIN equipos e ON j.id_del_equipo = e.id_del_equipo
                WHERE j.fecha_del_juego >= ?
                ORDER BY j.fecha_del_juego ASC, j.hora_inicio ASC";

$stmt_partidos = $conn->prepare($sql_partidos);
if ($stmt_partidos === false) {
    die("Error al preparar la consulta de partidos: " . $conn->error);
}
$stmt_partidos->bind_param("s", $fecha_actual);
$stmt_partidos->execute();
$result_partidos = $stmt_partidos->get_result();

$proximos_partidos = [];
if ($result_partidos->num_rows > 0) {
    while ($row = $result_partidos->fetch_assoc()) {
        $proximos_partidos[] = $row;
    }
}

$stmt_partidos->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Próximos Partidos de la MLB</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f4f8; /* Un gris más claro para el fondo */
        }
        .header-bg {
            background-color: #002D72; /* Azul oscuro MLB */
        }
        .nav-link {
            transition: color 0.3s ease;
        }
        .nav-link:hover, .nav-link.active {
            color: #D50032; /* Rojo MLB */
        }
        .game-card {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .game-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }
        .footer-bg {
            background-color: #333;
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
    </style>
</head>
<body class="bg-gray-100 text-gray-800">

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

    <!-- Contenido Principal -->
    <main class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold text-center mb-8 text-gray-700">Próximos Partidos</h1>

        <?php if (!empty($proximos_partidos)): ?>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <?php foreach ($proximos_partidos as $partido): ?>
                    <div class="game-card p-6">
                        <h2 class="text-xl font-semibold text-blue-700 mb-2"><?php echo htmlspecialchars($partido['nombre_equipo_local']); ?></h2>
                        <p class="text-gray-600 mb-1"><i class="fas fa-info-circle mr-2 text-blue-500"></i><?php echo htmlspecialchars($partido['descripcion']); ?></p>
                        <p class="text-gray-600 mb-1"><i class="fas fa-calendar-alt mr-2 text-green-500"></i> <?php echo htmlspecialchars(date("d/m/Y", strtotime($partido['fecha_del_juego']))); ?></p>
                        <p class="text-gray-600 mb-1"><i class="fas fa-clock mr-2 text-purple-500"></i> <?php echo htmlspecialchars(date("h:i A", strtotime($partido['hora_inicio']))); ?></p>
                        <p class="text-gray-600 mb-1"><i class="fas fa-map-marker-alt mr-2 text-red-500"></i> <?php echo htmlspecialchars($partido['estadio_donde_se_jugara']); ?></p>
                        <?php if (!empty($partido['pitcher_abridor'])): ?>
                            <p class="text-gray-600"><i class="fas fa-baseball-ball mr-2 text-yellow-500"></i> P. Abridor: <?php echo htmlspecialchars($partido['pitcher_abridor']); ?></p>
                        <?php endif; ?>
                        <div class="mt-4">
                            <a href="partido-detalle.php?id=<?php echo htmlspecialchars($partido['id_del_juego']); ?>" class="inline-block bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                                Detalles
                            </a>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <p class="text-center text-gray-600 text-xl">No hay próximos partidos programados.</p>
        <?php endif; ?>
    </main>

    <!-- Pie de Página -->
    <footer class="footer-bg text-white text-center p-4 mt-8">
        <p>&copy; <?php echo date("Y"); ?> MLB Stats. Todos los derechos reservados.</p>
    </footer>

</body>
</html>