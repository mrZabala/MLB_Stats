<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MLB Stats - Detalle de Equipo</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f4f8;
        }

        .team-card {
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

        .league-badge {
            display: inline-block;
            padding: 0.25rem 0.5rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
        }

        .american-league {
            background-color: #1e40af;
            color: white;
        }

        .national-league {
            background-color: #b91c1c;
            color: white;
        }

        .player-row:hover {
            background-color: #f3f4f6;
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
                <li><a href="equipos.php" class="boton">Equipos</a></li>
                <li><a href="partidos.php" class="boton">Partidos</a></li>
                <li><a href="trivia.php" class="boton">Trivia</a></li>
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
            $id_equipo = $conn->real_escape_string($_GET['id']);

            // Consulta para obtener datos del equipo
            $sql = "SELECT e.*, l.nombre_de_la_liga, ee.* 
                    FROM equipos e 
                    LEFT JOIN ligas l ON e.id_de_la_liga = l.id_de_la_liga 
                    LEFT JOIN estadisticas_equipos ee ON e.id_del_equipo = ee.id_del_equipo
                    WHERE e.id_del_equipo = '$id_equipo'";

            $result = $conn->query($sql);

            if ($result && $result->num_rows > 0) {
                $equipo = $result->fetch_assoc();

                // Consulta para obtener jugadores del equipo
                $sql_jugadores = "SELECT j.id_del_jugador, j.nombre_del_jugador, j.numero_del_jugador, j.posicion_del_jugador, 
                                    ej.promedio_de_bateo, ej.home_runs, ej.carreas_impulsadas 
                                FROM jugadores j 
                                LEFT JOIN estadisticas_jugadores ej ON j.id_del_jugador = ej.id_del_jugador
                                WHERE j.id_del_equipo = '$id_equipo' 
                                ORDER BY j.nombre_del_jugador ASC";

                $result_jugadores = $conn->query($sql_jugadores);

                // Consulta para obtener partidos recientes del equipo
                $sql_partidos = "SELECT j.fecha_del_juego, j.estadio_donde_se_jugara, j.hora_inicio, j.descripcion 
                                FROM juegos j 
                                WHERE j.id_del_equipo = '$id_equipo' 
                                ORDER BY j.fecha_del_juego DESC LIMIT 5";

                $result_partidos = $conn->query($sql_partidos);
                ?>

                <main class="container mx-auto px-4 py-8">
                    <div class="mb-4">
                        <a href="equipos.php" class="btn-back px-4 py-2 rounded-md inline-flex items-center">
                            <i class="fas fa-arrow-left mr-2"></i> Volver a la lista de equipos
                        </a>
                    </div>

                    
                    <div class="team-card p-6 mb-6">
                        <div class="md:flex">
                            <div class="md:w-1/3 mb-4 md:mb-0">
                              
                                <div class="bg-gray-200 rounded-lg w-full aspect-square flex items-center justify-center">
                                    <i class="fas fa-baseball-ball text-6xl text-gray-400"></i>
                                </div>
                            </div>
                            <div class="md:w-2/3 md:pl-6">
                                <h1 class="text-3xl font-bold text-gray-800">
                                    <?php echo htmlspecialchars($equipo['nombre_del_equipo']); ?>
                                </h1>
                                <div class="text-xl text-gray-600 mb-4">
                                    <?php echo htmlspecialchars($equipo['ciudad_del_equipo'] ?? $equipo['ubicacion_de_origen_del_equipo']); ?>
                                </div>

                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                                    <div>
                                        <div class="text-gray-600">Liga</div>
                                        <div class="text-lg font-semibold">
                                            <span class="league-badge <?php echo ($equipo['id_de_la_liga'] == 1) ? 'american-league' : 'national-league'; ?>">
                                                <?php echo htmlspecialchars($equipo['nombre_de_la_liga']); ?>
                                            </span>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="text-gray-600">Récord</div>
                                        <div class="text-lg font-semibold">
                                            <?php echo htmlspecialchars($equipo['juegos_ganados']); ?>-<?php echo htmlspecialchars($equipo['juegos_perdidos']); ?>
                                            <?php 
                                                $total_juegos = $equipo['juegos_ganados'] + $equipo['juegos_perdidos'];
                                                $porcentaje = ($total_juegos > 0) ? round(($equipo['juegos_ganados'] / $total_juegos), 3) : 0;
                                                echo '(' . number_format($porcentaje, 3) . ')'; 
                                            ?>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="text-gray-600">Campeonatos</div>
                                        <div class="text-lg font-semibold">
                                            <?php echo htmlspecialchars($equipo['campeonato_ganados']); ?>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="text-gray-600">Fundación</div>
                                        <div class="text-lg font-semibold">
                                            <?php echo date('Y', strtotime($equipo['fecha_del_primer_juego_del_equipo'])); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                   
                    <h2 class="text-2xl font-bold mb-4 text-gray-800">Estadísticas de la temporada</h2>
                    <div class="grid grid-cols-2 md:grid-cols-5 gap-4 mb-8">
                        
                        <div class="stats-card p-4 text-center">
                            <div class="stat-label">Promedio de bateo</div>
                            <div class="stat-value"><?php echo number_format($equipo['promedios_al_bate'], 3); ?></div>
                            <?php
                            
                            $avg_class = 'poor';
                            if ($equipo['promedios_al_bate'] >= 0.270)
                                $avg_class = 'excellent';
                            else if ($equipo['promedios_al_bate'] >= 0.250)
                                $avg_class = 'good';
                            else if ($equipo['promedios_al_bate'] >= 0.240)
                                $avg_class = 'average';
                            else if ($equipo['promedios_al_bate'] >= 0.230)
                                $avg_class = 'below-average';
                            ?>
                            <div class="mt-2 w-full bg-gray-200 rounded">
                                <div class="performance-indicator <?php echo $avg_class; ?> w-full"></div>
                            </div>
                        </div>

                       
                        <div class="stats-card p-4 text-center">
                            <div class="stat-label">Home Runs</div>
                            <div class="stat-value"><?php echo htmlspecialchars($equipo['home_runs']); ?></div>
                            <?php
                            
                            $hr_class = 'poor';
                            if ($equipo['home_runs'] >= 60)
                                $hr_class = 'excellent';
                            else if ($equipo['home_runs'] >= 50)
                                $hr_class = 'good';
                            else if ($equipo['home_runs'] >= 40)
                                $hr_class = 'average';
                            else if ($equipo['home_runs'] >= 30)
                                $hr_class = 'below-average';
                            ?>
                            <div class="mt-2 w-full bg-gray-200 rounded">
                                <div class="performance-indicator <?php echo $hr_class; ?> w-full"></div>
                            </div>
                        </div>

                     
                        <div class="stats-card p-4 text-center">
                            <div class="stat-label">Carreras impulsadas</div>
                            <div class="stat-value"><?php echo htmlspecialchars($equipo['carreras_impulsadas']); ?></div>
                            <?php
                            // Indicador de rendimiento para RBI
                            $rbi_class = 'poor';
                            if ($equipo['carreras_impulsadas'] >= 200)
                                $rbi_class = 'excellent';
                            else if ($equipo['carreras_impulsadas'] >= 180)
                                $rbi_class = 'good';
                            else if ($equipo['carreras_impulsadas'] >= 160)
                                $rbi_class = 'average';
                            else if ($equipo['carreras_impulsadas'] >= 140)
                                $rbi_class = 'below-average';
                            ?>
                            <div class="mt-2 w-full bg-gray-200 rounded">
                                <div class="performance-indicator <?php echo $rbi_class; ?> w-full"></div>
                            </div>
                        </div>

                        <!-- OBP -->
                        <div class="stats-card p-4 text-center">
                            <div class="stat-label">OBP</div>
                            <div class="stat-value"><?php echo number_format($equipo['Promedio_de_alcanzar_base'], 3); ?></div>
                            <?php
                            // Indicador de rendimiento para OBP
                            $obp_class = 'poor';
                            if ($equipo['Promedio_de_alcanzar_base'] >= 0.340)
                                $obp_class = 'excellent';
                            else if ($equipo['Promedio_de_alcanzar_base'] >= 0.320)
                                $obp_class = 'good';
                            else if ($equipo['Promedio_de_alcanzar_base'] >= 0.310)
                                $obp_class = 'average';
                            else if ($equipo['Promedio_de_alcanzar_base'] >= 0.300)
                                $obp_class = 'below-average';
                            ?>
                            <div class="mt-2 w-full bg-gray-200 rounded">
                                <div class="performance-indicator <?php echo $obp_class; ?> w-full"></div>
                            </div>
                        </div>

                        <!-- SLG -->
                        <div class="stats-card p-4 text-center">
                            <div class="stat-label">SLG</div>
                            <div class="stat-value"><?php echo number_format($equipo['promedio_de_slugging'], 3); ?></div>
                            <?php
                            // Indicador de rendimiento para SLG
                            $slg_class = 'poor';
                            if ($equipo['promedio_de_slugging'] >= 0.450)
                                $slg_class = 'excellent';
                            else if ($equipo['promedio_de_slugging'] >= 0.420)
                                $slg_class = 'good';
                            else if ($equipo['promedio_de_slugging'] >= 0.400)
                                $slg_class = 'average';
                            else if ($equipo['promedio_de_slugging'] >= 0.380)
                                $slg_class = 'below-average';
                            ?>
                            <div class="mt-2 w-full bg-gray-200 rounded">
                                <div class="performance-indicator <?php echo $slg_class; ?> w-full"></div>
                            </div>
                        </div>
                    </div>

                 
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                        <!-- Estadísticas completas -->
                        <div class="stats-card p-6">
                            <h3 class="text-xl font-semibold mb-4">Estadísticas completas</h3>
                            <div class="grid grid-cols-2 gap-y-3">
                                <div>
                                    <div class="text-sm text-gray-600">Juegos jugados</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($equipo['juegos_jugados']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Turnos al bate</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($equipo['turnos_al_bate']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Hits</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($equipo['hits']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Dobles</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($equipo['dobles']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Triples</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($equipo['triples']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Carreras anotadas</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($equipo['carreras']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Bases robadas</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($equipo['bases_robadas']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Atrapado robando</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($equipo['atrapado_robando']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Bases por bolas</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($equipo['bases_por_bola']); ?></div>
                                </div>
                                <div>
                                    <div class="text-sm text-gray-600">Ponches</div>
                                    <div class="font-semibold"><?php echo htmlspecialchars($equipo['ponches']); ?></div>
                                </div>
                            </div>
                        </div>

                        <!-- Próximos partidos -->
                        <div class="stats-card p-6">
                            <h3 class="text-xl font-semibold mb-4">Próximos partidos</h3>
                            <?php if ($result_partidos && $result_partidos->num_rows > 0): ?>
                                <div class="overflow-x-auto">
                                    <table class="min-w-full">
                                        <thead>
                                            <tr class="border-b border-gray-200">
                                                <th class="text-left py-2 text-sm font-medium text-gray-600">Fecha</th>
                                                <th class="text-left py-2 text-sm font-medium text-gray-600">Estadio</th>
                                                <th class="text-left py-2 text-sm font-medium text-gray-600">Hora</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php while ($partido = $result_partidos->fetch_assoc()): ?>
                                                <tr class="border-b border-gray-100">
                                                    <td class="py-3 text-sm">
                                                        <?php echo date('d/m/Y', strtotime($partido['fecha_del_juego'])); ?></td>
                                                    <td class="py-3 text-sm"><?php echo htmlspecialchars($partido['estadio_donde_se_jugara']); ?>
                                                    </td>
                                                    <td class="py-3 text-sm">
                                                        <?php echo date('H:i', strtotime($partido['hora_inicio'])); ?></td>
                                                </tr>
                                            <?php endwhile; ?>
                                        </tbody>
                                    </table>
                                </div>
                            <?php else: ?>
                                <p class="text-gray-600">No hay partidos programados próximamente.</p>
                            <?php endif; ?>
                        </div>
                    </div>

                    <!-- Roster del equipo -->
                    <h2 class="text-2xl font-bold mb-4 text-gray-800">Roster del equipo</h2>
                    <div class="stats-card p-6 mb-8">
                        <?php if ($result_jugadores && $result_jugadores->num_rows > 0): ?>
                            <div class="overflow-x-auto">
                                <table class="min-w-full divide-y divide-gray-200">
                                    <thead>
                                        <tr>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nombre</th>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Número</th>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Posición</th>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">AVG</th>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">HR</th>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">RBI</th>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody class="bg-white divide-y divide-gray-200">
                                        <?php while ($jugador = $result_jugadores->fetch_assoc()): ?>
                                            <tr class="player-row">
                                                <td class="px-4 py-4 whitespace-nowrap">
                                                    <div class="text-sm font-medium text-gray-900">
                                                        <?php echo htmlspecialchars($jugador['nombre_del_jugador']); ?>
                                                    </div>
                                                </td>
                                                <td class="px-4 py-4 whitespace-nowrap">
                                                    <div class="text-sm text-gray-500">
                                                        #<?php echo htmlspecialchars($jugador['numero_del_jugador']); ?>
                                                    </div>
                                                </td>
                                                <td class="px-4 py-4 whitespace-nowrap">
                                                    <div class="text-sm text-gray-500">
                                                        <?php echo htmlspecialchars($jugador['posicion_del_jugador']); ?>
                                                    </div>
                                                </td>
                                                <td class="px-4 py-4 whitespace-nowrap">
                                                    <div class="text-sm text-gray-500">
                                                        <?php echo number_format($jugador['promedio_de_bateo'], 3); ?>
                                                    </div>
                                                </td>
                                                <td class="px-4 py-4 whitespace-nowrap">
                                                    <div class="text-sm text-gray-500">
                                                        <?php echo htmlspecialchars($jugador['home_runs']); ?>
                                                    </div>
                                                </td>
                                                <td class="px-4 py-4 whitespace-nowrap">
                                                    <div class="text-sm text-gray-500">
                                                        <?php echo htmlspecialchars($jugador['carreas_impulsadas']); ?>
                                                    </div>
                                                </td>
                                                <td class="px-4 py-4 whitespace-nowrap text-sm font-medium">
                                                    <a href="jugador-detalle.php?id=<?php echo $jugador['id_del_jugador']; ?>" class="text-blue-600 hover:text-blue-900">
                                                        <i class="fas fa-eye mr-1"></i> Ver
                                                    </a>
                                                </td>
                                            </tr>
                                        <?php endwhile; ?>
                                    </tbody>
                                </table>
                            </div>
                        <?php else: ?>
                            <p class="text-gray-600">No hay jugadores registrados para este equipo.</p>
                        <?php endif; ?>
                    </div>
                </main>
            <?php
            } else {
                echo '<div class="container mx-auto px-4 py-8">';
                echo '<div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">';
                echo '<strong class="font-bold">Error:</strong>';
                echo '<span class="block sm:inline"> No se encontró información para el equipo solicitado.</span>';
                echo '</div>';
                echo '<div class="mt-4"><a href="equipos.php" class="btn-back px-4 py-2 rounded-md inline-flex items-center"><i class="fas fa-arrow-left mr-2"></i> Volver a la lista de equipos</a></div>';
                echo '</div>';
            }
        } else {
            echo '<div class="container mx-auto px-4 py-8">';
            echo '<div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">';
            echo '<strong class="font-bold">Error:</strong>';
            echo '<span class="block sm:inline"> No se especificó un ID de equipo válido.</span>';
            echo '</div>';
            echo '<div class="mt-4"><a href="equipos.php" class="btn-back px-4 py-2 rounded-md inline-flex items-center"><i class="fas fa-arrow-left mr-2"></i> Volver a la lista de equipos</a></div>';
            echo '</div>';
        }

        $conn->close();
    ?>

    <!-- jQuery y DataTables JS -->
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            // Inicializar DataTables si hay una tabla con jugadores
            if ($('#tabla-jugadores').length) {
                $('#tabla-jugadores').DataTable({
                    language: {
                        url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
                    },
                    pageLength: 10,
                    lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "Todos"]]
                });
            }
        });
    </script>
</body>

</html>