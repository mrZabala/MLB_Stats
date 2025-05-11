<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MLB Stats - Detalle de Jugador</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f4f8;
        }

        .player-card {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .stats-card {
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

        .performance-indicator {
            height: 4px;
            border-radius: 2px;
        }

        .excellent {
            background-color: #48bb78;
        }

        .good {
            background-color: #4299e1;
        }

        .average {
            background-color: #ecc94b;
        }

        .below-average {
            background-color: #ed8936;
        }

        .poor {
            background-color: #e53e3e;
        }
    </style>
</head>

<body class="min-h-screen">
    <!-- Navegación -->
    <nav id="navShadow" class="flex justify-between bg-gray-800 text-white p-4">
        <!-- LEFT Hand Side -->
        <div>
            <h1>MLB STATS</h1>
        </div>
        <!-- RIGHT Hand Side -->
        <div>
            <ul class="flex gap-6">
                <li><a href="index.php" class="boton">Inicio</a></li>
                <li><a href="jugadores.php" class="boton">Jugadores</a></li>
                <li><a href="#" class="boton">Equipos</a></li>
                <li><a href="#" class="boton">Partidos</a></li>
                <li><a href="#" class="boton">Trivia</a></li>
            </ul>
        </div>
    </nav>

    <?php
        // Conexión a la base de datos
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "baseball_db";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Conexión fallida: " . $conn->connect_error);
        }

        if (isset($_GET['id']) && !empty($_GET['id'])) {
            $id_jugador = $conn->real_escape_string($_GET['id']);

            // Consulta para obtener datos del jugador
            $sql = "SELECT j.*, e.nombre_del_equipo, e.ciudad_del_equipo, l.nombre_de_la_liga, ej.* 
                    FROM jugadores j 
                    LEFT JOIN equipos e ON j.id_del_equipo = e.id_del_equipo 
                    LEFT JOIN ligas l ON j.id_de_la_liga = l.id_de_la_liga 
                    LEFT JOIN estadisticas_jugadores ej ON j.id_del_jugador = ej.id_del_jugador
                    WHERE j.id_del_jugador = '$id_jugador'";

            $result = $conn->query($sql);

            if ($result && $result->num_rows > 0) {
                $jugador = $result->fetch_assoc();

                // Consulta para obtener historial reciente (últimos 5 juegos)
                $sql_historial = "SELECT fecha_del_juego, hits, carreras, home_runs, ponches 
                                FROM historial_juegos 
                                WHERE id_del_jugador = '$id_jugador' 
                                ORDER BY fecha_del_juego DESC LIMIT 5";

                $result_historial = $conn->query($sql_historial);
                ?>

                <main class="container mx-auto px-4 py-8">
                    <div class="mb-4">
                        <a href="jugadores.php" class="btn-back px-4 py-2 rounded-md inline-flex items-center">
                            <i class="fas fa-arrow-left mr-2"></i> Volver a la lista de jugadores
                        </a>
                    </div>

                    <!-- Información principal del jugador -->
                    <div class="player-card p-6 mb-6">
                        <div class="md:flex">
                            <div class="md:w-1/3 mb-4 md:mb-0">
                                <!-- Imagen del jugador (placeholder) -->
                                <div class="bg-gray-200 rounded-lg w-full aspect-square flex items-center justify-center">
                                    <i class="fas fa-user-alt text-6xl text-gray-400"></i>
                                </div>
                            </div>
                            <div class="md:w-2/3 md:pl-6">
                                <h1 class="text-3xl font-bold text-gray-800">
                                    <?php echo htmlspecialchars($jugador['nombre_del_jugador']); ?>
                                    <?php if (!empty($jugador['apodo_del_jugador'])): ?>
                                        <span
                                            class="text-xl text-gray-600">"<?php echo htmlspecialchars($jugador['apodo_del_jugador']); ?>"</span>
                                    <?php endif; ?>
                                </h1>
                                <div class="text-xl text-gray-600 mb-4">
                                    #<?php echo htmlspecialchars($jugador['numero_del_jugador']); ?> |
                                    <?php echo htmlspecialchars($jugador['posicion_del_jugador']); ?></div>

                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                                    <div>
                                        <div class="text-gray-600">Equipo</div>
                                        <div class="text-lg font-semibold">
                                            <?php echo htmlspecialchars($jugador['nombre_del_equipo']); ?></div>
                                    </div>
                                    <div>
                                        <div class="text-gray-600">Liga</div>
                                        <div class="text-lg font-semibold">
                                            <?php echo htmlspecialchars($jugador['nombre_de_la_liga']); ?></div>
                                    </div>
                                    <div>
                                        <div class="text-gray-600">Edad</div>
                                        <div class="text-lg font-semibold">
                                            <?php echo htmlspecialchars($jugador['edad_del_jugador']); ?> años</div>
                                    </div>
                                    <div>
                                        <div class="text-gray-600">Lugar de nacimiento</div>
                                        <div class="text-lg font-semibold">
                                            <?php echo htmlspecialchars($jugador['lugar_de_nacimiento']); ?></div>
                                    </div>
                                </div>

                                <?php if (!empty($jugador['biografia_del_jugador'])): ?>
                                    <div class="mb-4">
                                        <h3 class="text-xl font-semibold mb-2">Biografía</h3>
                                        <p class="text-gray-700">
                                            <?php echo nl2br(htmlspecialchars($jugador['biografia_del_jugador'])); ?></p>
                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>

                    <!-- Estadísticas principales -->
                    <h2 class="text-2xl font-bold mb-4 text-gray-800">Estadísticas de la temporada</h2>
                    <div class="grid grid-cols-2 md:grid-cols-5 gap-4 mb-8">
                        <!-- AVG -->
                        <div class="stats-card p-4 text-center">
                            <div class="stat-label">Promedio de bateo</div>
                            <div class="stat-value"><?php echo number_format($jugador['promedio_de_bateo'], 3); ?></div>
                            <?php
                            // Indicador de rendimiento para AVG
                            $avg_class = 'poor';
                            if ($jugador['promedio_de_bateo'] >= 0.300)
                                $avg_class = 'excellent';
                            else if ($jugador['promedio_de_bateo'] >= 0.270)
                                $avg_class = 'good';
                            else if ($jugador['promedio_de_bateo'] >= 0.250)
                                $avg_class = 'average';
                            else if ($jugador['promedio_de_bateo'] >= 0.230)
                                $avg_class = 'below-average';
                            ?>
                            <div class="mt-2 w-full bg-gray-200 rounded">
                                <div class="performance-indicator <?php echo $avg_class; ?> w-full"></div>
                            </div>
                        </div>

                        <!-- HR -->
                        <div class="stats-card p-4 text-center">
                            <div class="stat-label">Home Runs</div>
                            <div class="stat-value"><?php echo htmlspecialchars($jugador['home_runs']); ?></div>
                            <?php
                            // Indicador de rendimiento para HR
                            $hr_class = 'poor';
                            if ($jugador['home_runs'] >= 30)
                                $hr_class = 'excellent';
                            else if ($jugador['home_runs'] >= 20)
                                $hr_class = 'good';
                            else if ($jugador['home_runs'] >= 15)
                                $hr_class = 'average';
                            else if ($jugador['home_runs'] >= 10)
                                $hr_class = 'below-average';
                            ?>
                            <div class="mt-2 w-full bg-gray-200 rounded">
                                <div class="performance-indicator <?php echo $hr_class; ?> w-full"></div>
                            </div>
                        </div>

                        <!-- RBI -->
                        <div class="stats-card p-4 text-center">
                            <div class="stat-label">Carreras impulsadas</div>
                            <div class="stat-value"><?php echo htmlspecialchars($jugador['carreras_impulsadas']); ?></div>
                            <?php
                            // Indicador de rendimiento para RBI
                            $rbi_class = 'poor';
                            if ($jugador['carreras_impulsadas'] >= 100)
                                $rbi_class = 'excellent';
                            else if ($jugador['carreras_impulsadas'] >= 80)
                                $rbi_class = 'good';
                            else if ($jugador['carreras_impulsadas'] >= 60)
                                $rbi_class = 'average';
                            else if ($jugador['carreras_impulsadas'] >= 40)
                                $rbi_class = 'below-average';
                            ?>
                            <div class="mt-2 w-full bg-gray-200 rounded">
                                <div class="performance-indicator <?php echo $rbi_class; ?> w-full"></div>
                            </div>
                        </div>

                        <!-- OBP -->
                        <div class="stats-card p-4 text-center">
                            <div class="stat-label">OBP</div>
                            <div class="stat-value"><?php echo number_format($jugador['promedio_de_enbasase'], 3); ?></div>
                            <?php
                            // Indicador de rendimiento para OBP
                            $obp_class = 'poor';
                            if ($jugador['promedio_de_enbasase'] >= 0.380)
                                $obp_class = 'excellent';
                            else if ($jugador['promedio_de_enbasase'] >= 0.350)
                                $obp_class = 'good';
                            else if ($jugador['promedio_de_enbasase'] >= 0.320)
                                $obp_class = 'average';
                            else if ($jugador['promedio_de_enbasase'] >= 0.300)
                                $obp_class = 'below-average';
                            ?>
                            <div class="mt-2 w-full bg-gray-200 rounded">
                                <div class="performance-indicator <?php echo $obp_class; ?> w-full"></div>
                            </div>
                        </div>

                        <!-- SLG -->
                        <div class="stats-card p-4 text-center">
                            <div class="stat-label">SLG</div>
                            <div class="stat-value"><?php echo number_format($jugador['promedio_de_slugging'], 3); ?></div>
                            <?php
                            // Indicador de rendimiento para SLG
                            $slg_class = 'poor';
                            if ($jugador['promedio_de_slugging'] >= 0.500)
                                $slg_class = 'excellent';
                            else if ($jugador['promedio_de_slugging'] >= 0.450)
                                $slg_class = 'good';
                            else if ($jugador['promedio_de_slugging'] >= 0.400)
                                $slg_class = 'average';
                            else if ($jugador['promedio_de_slugging'] >= 0.350)
                                $slg_class = 'below-average';
                            ?>
                            <div class="mt-2 w-full bg-gray-200 rounded">
                                <div class="performance-indicator <?php echo $slg_class; ?> w-full"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Estadísticas adicionales -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                        <!-- Estadísticas completas -->
                        <div class="stats-card p-6">
                            <h3 class="text-xl font-semibold mb-4">Estadísticas completas</h3>
                            <div class="grid grid-cols-2 gap-y-3">
                                <div>
                                    <div class="text-sm text-gray-600">Juegos jugados</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($jugador['juegos_jugados']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Veces al bate</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($jugador['veces_al_bate']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Hits</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($jugador['hits']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Dobles</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($jugador['dobles']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Triples</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($jugador['triples']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Carreras anotadas</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($jugador['carreras']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Bases robadas</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($jugador['bases_robadas']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Atrapado robando</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($jugador['atrapado_robando_base']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Bases por bolas</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($jugador['bases_por_bola']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Ponches</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($jugador['ponches']); ?></div>
                                </div>
                            </div>
                        </div>

                        <!-- Historial de juegos recientes -->
                        <div class="stats-card p-6">
                            <h3 class="text-xl font-semibold mb-4">Últimos 5 juegos</h3>
                            <?php if ($result_historial && $result_historial->num_rows > 0): ?>
                                <div class="overflow-x-auto">
                                    <table class="min-w-full">
                                        <thead>
                                            <tr class="border-b border-gray-200">
                                                <th class="text-left py-2 text-sm font-medium text-gray-600">Fecha</th>
                                                <th class="text-center py-2 text-sm font-medium text-gray-600">H</th>
                                                <th class="text-center py-2 text-sm font-medium text-gray-600">R</th>
                                                <th class="text-center py-2 text-sm font-medium text-gray-600">HR</th>
                                                <th class="text-center py-2 text-sm font-medium text-gray-600">K</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php while ($juego = $result_historial->fetch_assoc()): ?>
                                                <tr class="border-b border-gray-100">
                                                    <td class="py-3 text-sm">
                                                        <?php echo date('d/m/Y', strtotime($juego['fecha_del_juego'])); ?></td>
                                                    <td class="py-3 text-sm text-center"><?php echo htmlspecialchars($juego['hits']); ?>
                                                    </td>
                                                    <td class="py-3 text-sm text-center"><?php echo htmlspecialchars($juego['carreras']); ?>
                                                    </td>
                                                    <td class="py-3 text-sm text-center">
                                                        <?php echo htmlspecialchars($juego['home_runs']); ?></td>
                                                    <td class="py-3 text-sm text-center"><?php echo htmlspecialchars($juego['ponches']); ?>
                                                    </td>
                                                </tr>
                                            <?php endwhile; ?>
                                        </tbody>
                                    </table>
                                </div>
                            <?php else: ?>
                                <p class="text-gray-600">No hay datos de juegos recientes disponibles.</p>
                            <?php endif; ?>
                        </div>
                    </div>

                    <!-- Indicadores de rendimiento comparativos -->
                    <h2 class="text-2xl font-bold mb-4 text-gray-800">Comparativa con la liga</h2>
                    <div class="stats-card p-6 mb-8">
                        <div class="space-y-6">
                            <!-- AVG Comparación -->
                            <div>
                                <div class="flex justify-between mb-1">
                                    <span class="text-sm font-medium text-gray-700">Promedio de bateo</span>
                                    <span
                                        class="text-sm font-medium text-gray-700"><?php echo number_format($jugador['promedio_de_bateo'], 3); ?>
                                        vs Liga: 0.252</span>
                                </div>
                                <div class="w-full bg-gray-200 rounded-full h-2.5">
                                    <?php
                                    $avg_percent = min(100, ($jugador['promedio_de_bateo'] / 0.350) * 100);
                                    $avg_color = 'bg-red-500';
                                    if ($jugador['promedio_de_bateo'] >= 0.300)
                                        $avg_color = 'bg-green-500';
                                    else if ($jugador['promedio_de_bateo'] >= 0.270)
                                        $avg_color = 'bg-blue-500';
                                    else if ($jugador['promedio_de_bateo'] >= 0.250)
                                        $avg_color = 'bg-yellow-500';
                                    ?>
                                    <div class="<?php echo $avg_color; ?> h-2.5 rounded-full"
                                        style="width: <?php echo $avg_percent; ?>%"></div>
                                </div>
                            </div>

                            <!-- OBP Comparación -->
                            <div>
                                <div class="flex justify-between mb-1">
                                    <span class="text-sm font-medium text-gray-700">OBP</span>
                                    <span
                                        class="text-sm font-medium text-gray-700"><?php echo number_format($jugador['promedio_de_enbasase'], 3); ?>
                                        vs Liga: 0.320</span>
                                </div>
                                <div class="w-full bg-gray-200 rounded-full h-2.5">
                                    <?php
                                    $obp_percent = min(100, ($jugador['promedio_de_enbasase'] / 0.420) * 100);
                                    $obp_color = 'bg-red-500';
                                    if ($jugador['promedio_de_enbasase'] >= 0.380)
                                        $obp_color = 'bg-green-500';
                                    else if ($jugador['promedio_de_enbasase'] >= 0.350)
                                        $obp_color = 'bg-blue-500';
                                    else if ($jugador['promedio_de_enbasase'] >= 0.320)
                                        $obp_color = 'bg-yellow-500';
                                    ?>
                                    <div class="<?php echo $obp_color; ?> h-2.5 rounded-full"
                                        style="width: <?php echo $obp_percent; ?>%"></div>
                                </div>
                            </div>

                            <!-- SLG Comparación -->
                            <div>
                                <div class="flex justify-between mb-1">
                                    <span class="text-sm font-medium text-gray-700">SLG</span>
                                    <span
                                        class="text-sm font-medium text-gray-700"><?php echo number_format($jugador['promedio_de_slugging'], 3); ?>
                                        vs Liga: 0.412</span>
                                </div>
                                <div class="w-full bg-gray-200 rounded-full h-2.5">
                                    <?php
                                    $slg_percent = min(100, ($jugador['promedio_de_slugging'] / 0.580) * 100);
                                    $slg_color = 'bg-red-500';
                                    if ($jugador['promedio_de_slugging'] >= 0.500)
                                        $slg_color = 'bg-green-500';
                                    else if ($jugador['promedio_de_slugging'] >= 0.450)
                                        $slg_color = 'bg-blue-500';
                                    else if ($jugador['promedio_de_slugging'] >= 0.400)
                                        $slg_color = 'bg-yellow-500';
                                    ?>
                                    <div class="<?php echo $slg_color; ?> h-2.5 rounded-full"
                                        style="width: <?php echo $slg_percent; ?>%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>

                <?php
            } else {
                // Si no se encuentra el jugador
                ?>
                <main class="container mx-auto px-4 py-8">
                    <div class="mb-4">
                        <a href="jugadores.php" class="btn-back px-4 py-2 rounded-md inline-flex items-center">
                            <i class="fas fa-arrow-left mr-2"></i> Volver a la lista de jugadores
                        </a>
                    </div>

                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                        <strong class="font-bold">Error:</strong>
                        <span class="block sm:inline">No se encontró información del jugador solicitado.</span>
                    </div>
                </main>
                <?php
            }
        } else {
            // Si no se proporcionó un ID
            ?>
            <main class="container mx-auto px-4 py-8">
                <div class="mb-4">
                    <a href="jugadores.php" class="btn-back px-4 py-2 rounded-md inline-flex items-center">
                        <i class="fas fa-arrow-left mr-2"></i> Volver a la lista de jugadores
                    </a>
                </div>

                <div class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative" role="alert">
                    <strong class="font-bold">Aviso:</strong>
                    <span class="block sm:inline">No se proporcionó un ID de jugador válido.</span>
                </div>
            </main>
            <?php
        }

        $conn->close();
    ?>

    <!-- Footer -->
    <footer class="bg-gray-900 text-white py-6 mt-12 px-4">
        <div class="container mx-auto flex flex-col items-center gap-4">
            <!-- Enlaces -->
            <div class="w-full flex justify-between px-4 lg:justify-evenly">
                <a href="index.php" class="hover:text-gray-400 transition">Inicio</a>
                <a href="jugadores.php" class="hover:text-gray-400 transition">Jugadores</a>
                <a href="#" class="hover:text-gray-400 transition">Equipos</a>
            </div>

            <!-- Derechos -->
            <div class="flex items-center space-x-2">
                <span>&copy;</span>
                <span>2025 MLB STATS. Todos los derechos reservados.</span>
            </div>
        </div>
    </footer>
</body>

</html>