<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MLB Stats - Equipos</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Cal+Sans&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap');

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f4f8;
        }

        .page-title,
        .section-title {
            font-family: "Cal Sans", sans-serif;
            font-weight: 400;
            font-style: normal;
        }

        .menu {
            font-family: "Roboto", sans-serif;
            font-optical-sizing: auto;
            font-weight: 400;
            font-style: normal;
            font-variation-settings: "wdth" 100;
        }

        .search-container {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .team-card {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .team-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        .team-logo {
            height: 120px;
            width: 120px;
            object-fit: contain;
            margin: 0 auto;
        }

        .team-name {
            color: #2d3748;
            font-weight: bold;
        }

        .team-stats {
            color: #4a5568;
        }

        .team-table {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .team-table th {
            background-color: #2d3748;
            color: white;
        }

        .team-table tr:nth-child(even) {
            background-color: #f8fafc;
        }

        .team-table tr:hover {
            background-color: #e2e8f0;
        }

        .btn-search {
            background-color: #2d3748;
            color: white;
            transition: all 0.3s;
        }

        .btn-search:hover {
            background-color: #1a202c;
        }

        .btn-reset {
            background-color: #e53e3e;
            color: white;
            transition: all 0.3s;
        }

        .btn-reset:hover {
            background-color: #c53030;
        }

        .no-results {
            background-color: #fed7d7;
            color: #c53030;
            border-radius: 0.25rem;
            padding: 1rem;
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

        .win-loss-record {
            font-size: 0.875rem;
            color: #4b5563;
        }

        .championships {
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .trophy-icon {
            color: #eab308;
        }
    </style>
</head>

<body class="min-h-screen">
    <!-- Navegación -->
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
                    <li><a href="#" class="boton">Partidos</a></li>
                    <li><a href="#" class="boton">Trivia</a></li>
                </ul>
            </div>
        </div>
        <!-- END RIGHT Hand Side -->
    </nav>

    <main class="container mx-auto px-4 py-8">
        <h2 class="text-3xl font-bold mb-6 text-center text-gray-800 section-title">Equipos de la MLB</h2>
        <div class="search-container p-4 mb-6">
            <form method="GET" action="" class="flex flex-col md:flex-row gap-4 items-end">
                <div class="flex-grow">
                    <label for="search" class="block text-sm font-medium text-gray-700 mb-1">Buscar Equipo:</label>
                    <input type="text" id="search" name="search" placeholder="Nombre del equipo..."
                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                        value="<?php echo isset($_GET['search']) ? htmlspecialchars($_GET['search']) : ''; ?>">
                </div>
                <div class="flex gap-2">
                    <button type="submit" class="btn-search px-4 py-2 rounded-md flex items-center justify-center">
                        <i class="fas fa-search mr-2"></i> Buscar
                    </button>
                    <?php if (isset($_GET['search']) && !empty($_GET['search'])): ?>
                        <a href="equipos.php" class="btn-reset px-4 py-2 rounded-md flex items-center justify-center">
                            <i class="fas fa-times mr-2"></i> Limpiar
                        </a>
                    <?php endif; ?>
                </div>
            </form>
        </div>

        <?php
       
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "baseball_db";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Conexión fallida: " . $conn->connect_error);
        }

 
        $sql = "SELECT e.*, l.nombre_de_la_liga, ee.* 
                FROM equipos e 
                LEFT JOIN ligas l ON e.id_de_la_liga = l.id_de_la_liga 
                LEFT JOIN estadisticas_equipos ee ON e.id_del_equipo = ee.id_del_equipo";

       
        if (isset($_GET['search']) && !empty($_GET['search'])) {
            $search = $conn->real_escape_string($_GET['search']);
            $sql .= " WHERE e.nombre_del_equipo LIKE '%$search%' OR e.ciudad_del_equipo LIKE '%$search%'";
        }

        $sql .= " ORDER BY e.nombre_del_equipo ASC";

        $result = $conn->query($sql);
        ?>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 mb-8">
            <!-- Static Team Card Example 1: New York Yankees -->
            <div class="team-card overflow-hidden">
                <div class="p-6 flex flex-col items-center">
                    <div class="bg-gray-100 rounded-full p-4 mb-4">
                        <img src="assets/img/logos/yankees.svg" 
                             alt="New York Yankees" 
                             class="team-logo">
                    </div>
                    <div class="text-center mb-4">
                        <h3 class="text-xl font-bold mb-1">New York Yankees</h3>
                        <p class="text-gray-600 mb-2">New York</p>
                        <span class="league-badge american-league">American League</span>
                    </div>
                    <div class="w-full grid grid-cols-2 gap-2 mb-4">
                        <div class="text-center">
                            <p class="text-sm text-gray-500">Récord</p>
                            <p class="win-loss-record">99-63 (.611)</p>
                        </div>
                        <div class="text-center">
                            <p class="text-sm text-gray-500">Campeonatos</p>
                            <div class="championships justify-center">
                                <i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i> +22
                            </div>
                        </div>
                    </div>
                    <a href="equipo-detalle.php?id=1" 
                       class="w-full text-center bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">
                        <i class="fas fa-eye mr-2"></i>Ver detalles
                    </a>
                </div>
            </div>

       
            <div class="team-card overflow-hidden">
                <div class="p-6 flex flex-col items-center">
                    <div class="bg-gray-100 rounded-full p-4 mb-4">
                        <img src="assets/img/logos/chicago.svg" 
                             alt="Los Angeles Dodgers" 
                             class="team-logo">
                    </div>
                    <div class="text-center mb-4">
                        <h3 class="text-xl font-bold mb-1">Chicago Cubs</h3>
                        <p class="text-gray-600 mb-2">Chicago</p>
                        <span class="league-badge national-league">National League</span>
                    </div>
                    <div class="w-full grid grid-cols-2 gap-2 mb-4">
                        <div class="text-center">
                            <p class="text-sm text-gray-500">Récord</p>
                            <p class="win-loss-record">100-62 (.617)</p>
                        </div>
                        <div class="text-center">
                            <p class="text-sm text-gray-500">Campeonatos</p>
                            <div class="championships justify-center">
                                <i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i> +8
                            </div>
                        </div>
                    </div>
                    <a href="equipo-detalle.php?id=2" 
                       class="w-full text-center bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">
                        <i class="fas fa-eye mr-2"></i>Ver detalles
                    </a>
                </div>
            </div>

            <div class="team-card overflow-hidden">
                <div class="p-6 flex flex-col items-center">
                    <div class="bg-gray-100 rounded-full p-4 mb-4">
                        <img src="assets/img/logos/angeles.svg" 
                             alt="Los Angeles Dodgers" 
                             class="team-logo">
                    </div>
                    <div class="text-center mb-4">
                        <h3 class="text-xl font-bold mb-1">Los Angeles Dodgers</h3>
                        <p class="text-gray-600 mb-2">Los Angeles</p>
                        <span class="league-badge national-league">National League</span>
                    </div>
                    <div class="w-full grid grid-cols-2 gap-2 mb-4">
                        <div class="text-center">
                            <p class="text-sm text-gray-500">Récord</p>
                            <p class="win-loss-record">100-62 (.617)</p>
                        </div>
                        <div class="text-center">
                            <p class="text-sm text-gray-500">Campeonatos</p>
                            <div class="championships justify-center">
                                <i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i> +2
                            </div>
                        </div>
                    </div>
                    <a href="equipo-detalle.php?id=2" 
                       class="w-full text-center bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">
                        <i class="fas fa-eye mr-2"></i>Ver detalles
                    </a>
                </div>
            </div>

            <!-- Static Team Card Example 3: Boston Red Sox -->
            <div class="team-card overflow-hidden">
                <div class="p-6 flex flex-col items-center">
                    <div class="bg-gray-100 rounded-full p-4 mb-4">
                        <img src="assets/img/logos/boston.svg" 
                             alt="Boston Red Sox" 
                             class="team-logo">
                    </div>
                    <div class="text-center mb-4">
                        <h3 class="text-xl font-bold mb-1">Boston Red Sox</h3>
                        <p class="text-gray-600 mb-2">Boston</p>
                        <span class="league-badge american-league">American League</span>
                    </div>
                    <div class="w-full grid grid-cols-2 gap-2 mb-4">
                        <div class="text-center">
                            <p class="text-sm text-gray-500">Récord</p>
                            <p class="win-loss-record">78-84 (.481)</p>
                        </div>
                        <div class="text-center">
                            <p class="text-sm text-gray-500">Campeonatos</p>
                            <div class="championships justify-center">
                                <i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i><i class="fas fa-trophy trophy-icon"></i> +4
                            </div>
                        </div>
                    </div>
                    <a href="equipo-detalle.php?id=3" 
                       class="w-full text-center bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">
                        <i class="fas fa-eye mr-2"></i>Ver detalles
                    </a>
                </div>
            </div>
        </div>

     
        <h3 class="text-2xl font-bold mb-4 text-gray-800 section-title">Estadísticas de Equipos</h3>
        <div class="team-table overflow-x-auto mb-8">
            <?php
           
            $result = $conn->query($sql);
            if ($result && $result->num_rows > 0):
            ?>
                <table id="tabla-equipos" class="min-w-full divide-y divide-gray-200">
                    <thead>
                        <tr>
                            <th class="px-4 py-3 text-left text-xs font-medium uppercase tracking-wider">Equipo</th>
                            <th class="px-4 py-3 text-left text-xs font-medium uppercase tracking-wider">Liga</th>
                            <th class="px-4 py-3 text-left text-xs font-medium uppercase tracking-wider">G</th>
                            <th class="px-4 py-3 text-left text-xs font-medium uppercase tracking-wider">P</th>
                            <th class="px-4 py-3 text-left text-xs font-medium uppercase tracking-wider">PCT</th>
                            <th class="px-4 py-3 text-left text-xs font-medium uppercase tracking-wider">Campeonatos</th>
                            <th class="px-4 py-3 text-left text-xs font-medium uppercase tracking-wider">Acción</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <?php while ($equipo = $result->fetch_assoc()): 
                          
                            $total_juegos = $equipo['juegos_ganados'] + $equipo['juegos_perdidos'];
                            $porcentaje_victorias = ($total_juegos > 0) ? round(($equipo['juegos_ganados'] / $total_juegos), 3) : 0;
                        ?>
                            <tr>
                                <td class="px-4 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                    
                                        <div>
                                            <div class="text-sm font-medium text-gray-900">
                                                <?= htmlspecialchars($equipo['nombre_del_equipo']) ?>
                                            </div>
                                            <div class="text-sm text-gray-500">
                                                <?= htmlspecialchars($equipo['ciudad_del_equipo'] ?? $equipo['ubicacion_de_origen_del_equipo']) ?>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-4 py-4 whitespace-nowrap">
                                    <span class="league-badge <?= ($equipo['id_de_la_liga'] == 1) ? 'american-league' : 'national-league' ?>">
                                        <?= htmlspecialchars($equipo['nombre_de_la_liga'] ?? 'N/A') ?>
                                    </span>
                                </td>
                                <td class="px-4 py-4 whitespace-nowrap text-sm text-gray-500">
                                    <?= $equipo['juegos_ganados'] ?>
                                </td>
                                <td class="px-4 py-4 whitespace-nowrap text-sm text-gray-500">
                                    <?= $equipo['juegos_perdidos'] ?>
                                </td>
                                <td class="px-4 py-4 whitespace-nowrap text-sm text-gray-500">
                                    .<?= str_pad(substr(number_format($porcentaje_victorias, 3), 2, 3), 3, '0', STR_PAD_LEFT) ?>
                                </td>
                                <td class="px-4 py-4 whitespace-nowrap text-sm text-gray-500">
                                    <?= $equipo['campeonato_ganados'] ?>
                                </td>
                                <td class="px-4 py-4 whitespace-nowrap text-sm font-medium">
                                    <a href="equipo-detalles.php?id=<?= $equipo['id_del_equipo'] ?>" 
                                       class="text-blue-600 hover:text-blue-900">
                                        <i class="fas fa-eye mr-1"></i> Ver detalles
                                    </a>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <div class="no-results my-4 text-center">
                    <p>No se encontraron equipos<?= isset($_GET['search']) ? ' con el nombre "' . htmlspecialchars($_GET['search']) . '"' : '' ?>.</p>
                </div>
            <?php endif; ?>
        </div>

        <?php $conn->close(); ?>
    </main>

  
    <footer class="bg-gray-900 text-white py-6 mt-12 px-4 text-lg">
        <div class="px-4 flex flex-col items-center gap-4">
            <!-- Enlaces -->
            <div class="w-full flex justify-between px-4 lg:justify-evenly">
                <a href="index.php" class="hover:text-gray-400 transition">Inicio</a>
                <a href="jugadores.php" class="hover:text-gray-400 transition">Jugadores</a>
                <a href="equipos.php" class="hover:text-gray-400 transition">Equipos</a>
            </div>

           
            <div class="flex items-center space-x-2">
                <span>&copy;</span>
                <span>2025 MLB STATS. Todos los derechos reservados.</span>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#tabla-equipos').DataTable({
                paging: true,
                pageLength: 10,
                lengthMenu: [10, 25, 50, 100],
                searching: false,
                ordering: true,
                info: true,
                order: [[0, 'asc']],
                language: {
                    search: 'Buscar equipo:',
                    lengthMenu: 'Mostrar _MENU_ equipos',
                    info: 'Mostrando _START_ a _END_ de _TOTAL_ equipos',
                    paginate: {
                        first: 'Primero',
                        last: 'Último',
                        next: 'Siguiente',
                        previous: 'Anterior'
                    }
                }
            });
        });
    </script>
</body>

</html>