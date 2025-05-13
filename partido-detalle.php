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

// Verificar si se proporcionó un ID de partido
if (isset($_GET['id']) && !empty($_GET['id'])) {
    $id_juego = $conn->real_escape_string($_GET['id']);
    
    // Consulta para obtener los detalles del partido
    $sql_partido = "SELECT 
                        j.id_del_juego, 
                        j.estadio_donde_se_jugara, 
                        j.fecha_del_juego, 
                        j.hora_inicio, 
                        j.pitcher_abridor, 
                        j.temporada, 
                        j.descripcion,
                        e.nombre_del_equipo AS nombre_equipo_local,
                        e.id_del_equipo AS id_equipo_local,
                        e.abreviacion_del_equipo AS abreviacion_equipo_local
                    FROM juegos j
                    JOIN equipos e ON j.id_del_equipo = e.id_del_equipo
                    WHERE j.id_del_juego = ?";
    
    $stmt_partido = $conn->prepare($sql_partido);
    if ($stmt_partido === false) {
        die("Error al preparar la consulta de partido: " . $conn->error);
    }
    
    $stmt_partido->bind_param("i", $id_juego);
    $stmt_partido->execute();
    $result_partido = $stmt_partido->get_result();
    
    if ($result_partido->num_rows > 0) {
        $partido = $result_partido->fetch_assoc();
        
        // Obtener estadísticas del equipo local
        $sql_estadisticas = "SELECT * FROM estadisticas_equipos WHERE id_del_equipo = ?";
        $stmt_estadisticas = $conn->prepare($sql_estadisticas);
        $stmt_estadisticas->bind_param("i", $partido['id_equipo_local']);
        $stmt_estadisticas->execute();
        $result_estadisticas = $stmt_estadisticas->get_result();
        $estadisticas_equipo = $result_estadisticas->fetch_assoc();
        
        // Obtener jugadores destacados del equipo
        $sql_jugadores = "SELECT j.id_del_jugador, j.nombre_del_jugador, j.posicion_del_jugador, 
                            ej.promedio_de_bateo, ej.home_runs, ej.carreas_impulsadas 
                        FROM jugadores j 
                        LEFT JOIN estadisticas_jugadores ej ON j.id_del_jugador = ej.id_del_jugador
                        WHERE j.id_del_equipo = ? 
                        ORDER BY ej.promedio_de_bateo DESC 
                        LIMIT 5";
        
        $stmt_jugadores = $conn->prepare($sql_jugadores);
        $stmt_jugadores->bind_param("i", $partido['id_equipo_local']);
        $stmt_jugadores->execute();
        $result_jugadores = $stmt_jugadores->get_result();
        
        $jugadores = [];
        while ($row = $result_jugadores->fetch_assoc()) {
            $jugadores[] = $row;
        }
        
        // Obtener otros partidos próximos del equipo local
        $sql_otros_partidos = "SELECT 
                                j.id_del_juego, 
                                j.estadio_donde_se_jugara, 
                                j.fecha_del_juego, 
                                j.hora_inicio, 
                                j.descripcion
                            FROM juegos j
                            WHERE j.id_del_equipo = ? AND j.id_del_juego != ?
                            ORDER BY j.fecha_del_juego ASC
                            LIMIT 3";
        
        $stmt_otros_partidos = $conn->prepare($sql_otros_partidos);
        $stmt_otros_partidos->bind_param("ii", $partido['id_equipo_local'], $id_juego);
        $stmt_otros_partidos->execute();
        $result_otros_partidos = $stmt_otros_partidos->get_result();
        
        $otros_partidos = [];
        while ($row = $result_otros_partidos->fetch_assoc()) {
            $otros_partidos[] = $row;
        }
    } else {
        // No se encontró el partido
        header("Location: partidos.php");
        exit();
    }
    
    // Cerrar statements
    $stmt_partido->close();
    if (isset($stmt_estadisticas)) $stmt_estadisticas->close();
    if (isset($stmt_jugadores)) $stmt_jugadores->close();
    if (isset($stmt_otros_partidos)) $stmt_otros_partidos->close();
} else {
    // No se proporcionó un ID válido
    header("Location: partidos.php");
    exit();
}

// Cerrar conexión
$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles del Partido - MLB Stats</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f4f8;
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
        .btn-back {
            background-color: #2d3748;
            color: white;
            transition: all 0.3s;
        }
        .btn-back:hover {
            background-color: #1a202c;
        }
        .stat-card {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .stat-label {
            color: #4a5568;
            font-size: 0.875rem;
        }
        .stat-value {
            color: #2d3748;
            font-size: 1.5rem;
            font-weight: bold;
        }
    </style>
</head>
<body>

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
                    <li><a href="trivia.php" class="boton">Trivia</a></li>
                </ul>
            </div>
        </div>
        <!-- END RIGHT Hand Side -->
    </nav>

    <main class="container mx-auto px-4 py-8">
        <div class="mb-4">
            <a href="partidos.php" class="btn-back px-4 py-2 rounded-md inline-flex items-center">
                <i class="fas fa-arrow-left mr-2"></i> Volver a la lista de partidos
            </a>
        </div>

        <div class="game-card p-6 mb-6">
            <div class="md:flex">
                <div class="md:w-1/3 mb-4 md:mb-0">
                    <div class="bg-gray-200 rounded-lg w-full aspect-square flex items-center justify-center">
                        <i class="fas fa-baseball-ball text-6xl text-gray-400"></i>
                    </div>
                </div>
                <div class="md:w-2/3 md:pl-6">
                    <h1 class="text-3xl font-bold text-gray-800 mb-2">
                        <?php echo htmlspecialchars($partido['nombre_equipo_local']); ?>
                    </h1>
                    <div class="text-xl text-gray-600 mb-4">
                        <?php echo htmlspecialchars($partido['descripcion']); ?>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                        <div>
                            <p class="text-gray-600 mb-1">
                                <i class="fas fa-calendar-alt mr-2 text-green-500"></i> 
                                <strong>Fecha:</strong> <?php echo htmlspecialchars(date("d/m/Y", strtotime($partido['fecha_del_juego']))); ?>
                            </p>
                            <p class="text-gray-600 mb-1">
                                <i class="fas fa-clock mr-2 text-purple-500"></i> 
                                <strong>Hora:</strong> <?php echo htmlspecialchars(date("h:i A", strtotime($partido['hora_inicio']))); ?>
                            </p>
                        </div>
                        <div>
                            <p class="text-gray-600 mb-1">
                                <i class="fas fa-map-marker-alt mr-2 text-red-500"></i> 
                                <strong>Estadio:</strong> <?php echo htmlspecialchars($partido['estadio_donde_se_jugara']); ?>
                            </p>
                            <?php if (!empty($partido['pitcher_abridor'])): ?>
                                <p class="text-gray-600 mb-1">
                                    <i class="fas fa-baseball-ball mr-2 text-yellow-500"></i> 
                                    <strong>Pitcher Abridor:</strong> <?php echo htmlspecialchars($partido['pitcher_abridor']); ?>
                                </p>
                            <?php endif; ?>
                        </div>
                    </div>
                    <div>
                        <p class="text-gray-600 mb-1">
                            <i class="fas fa-trophy mr-2 text-blue-500"></i> 
                            <strong>Temporada:</strong> <?php echo htmlspecialchars($partido['temporada']); ?>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Estadísticas del Equipo Local -->
        <?php if (isset($estadisticas_equipo) && $estadisticas_equipo): ?>
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Estadísticas del Equipo Local</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <div class="stat-card p-4">
                <p class="stat-label">Promedio de Bateo</p>
                <p class="stat-value"><?php echo number_format($estadisticas_equipo['promedios_al_bate'], 3); ?></p>
            </div>
            <div class="stat-card p-4">
                <p class="stat-label">Home Runs</p>
                <p class="stat-value"><?php echo $estadisticas_equipo['home_runs']; ?></p>
            </div>
            <div class="stat-card p-4">
                <p class="stat-label">Carreras Impulsadas</p>
                <p class="stat-value"><?php echo $estadisticas_equipo['carreras_impulsadas']; ?></p>
            </div>
        </div>
        <?php endif; ?>

        <!-- Jugadores Destacados -->
        <?php if (!empty($jugadores)): ?>
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Jugadores Destacados</h2>
        <div class="overflow-x-auto mb-6">
            <table class="min-w-full bg-white rounded-lg overflow-hidden">
                <thead class="bg-gray-100">
                    <tr>
                        <th class="py-3 px-4 text-left">Nombre</th>
                        <th class="py-3 px-4 text-left">Posición</th>
                        <th class="py-3 px-4 text-left">Promedio</th>
                        <th class="py-3 px-4 text-left">HR</th>
                        <th class="py-3 px-4 text-left">RBI</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($jugadores as $jugador): ?>
                    <tr class="border-t hover:bg-gray-50">
                        <td class="py-3 px-4">
                            <a href="jugador-detalle.php?id=<?php echo htmlspecialchars($jugador['id_del_jugador']); ?>" class="text-blue-600 hover:underline">
                                <?php echo htmlspecialchars($jugador['nombre_del_jugador']); ?>
                            </a>
                        </td>
                        <td class="py-3 px-4"><?php echo htmlspecialchars($jugador['posicion_del_jugador'] ?? 'N/A'); ?></td>
                        <td class="py-3 px-4"><?php echo isset($jugador['promedio_de_bateo']) ? number_format($jugador['promedio_de_bateo'], 3) : 'N/A'; ?></td>
                        <td class="py-3 px-4"><?php echo $jugador['home_runs'] ?? 'N/A'; ?></td>
                        <td class="py-3 px-4"><?php echo $jugador['carreas_impulsadas'] ?? 'N/A'; ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
        <?php endif; ?>

        <!-- Otros Partidos del Equipo -->
        <?php if (!empty($otros_partidos)): ?>
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Otros Partidos del Equipo</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <?php foreach ($otros_partidos as $otro_partido): ?>
            <div class="game-card p-4">
                <p class="font-semibold text-gray-800 mb-2"><?php echo htmlspecialchars($otro_partido['descripcion']); ?></p>
                <p class="text-gray-600 mb-1">
                    <i class="fas fa-calendar-alt mr-2 text-green-500"></i> 
                    <?php echo htmlspecialchars(date("d/m/Y", strtotime($otro_partido['fecha_del_juego']))); ?>
                </p>
                <p class="text-gray-600 mb-1">
                    <i class="fas fa-clock mr-2 text-purple-500"></i> 
                    <?php echo htmlspecialchars(date("h:i A", strtotime($otro_partido['hora_inicio']))); ?>
                </p>
                <p class="text-gray-600 mb-1">
                    <i class="fas fa-map-marker-alt mr-2 text-red-500"></i> 
                    <?php echo htmlspecialchars($otro_partido['estadio_donde_se_jugara']); ?>
                </p>
                <div class="mt-3">
                    <a href="partido-detalle.php?id=<?php echo htmlspecialchars($otro_partido['id_del_juego']); ?>" class="inline-block bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                        Detalles
                    </a>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
        <?php endif; ?>
    </main>

    <!-- Pie de Página -->
    <footer class="footer-bg text-white text-center p-4 mt-8">
        <p>&copy; <?php echo date("Y"); ?> MLB Stats. Todos los derechos reservados.</p>
    </footer>

</body>
</html>