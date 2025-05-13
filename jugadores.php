<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MLB Stats - Jugadores</title>
    <script src="assets/tailwind.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <!-- jQuery (necesario para DataTables) -->
    

    <style>
            @import url('https://fonts.googleapis.com/css2?family=Cal+Sans&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap');
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f4f8;
        }

        /* Cambiar el cursor cuando se pasa por encima del nombre del jugador */
.player-name {
    cursor: grab;
}

.player-name:active {
    cursor: grabbing;
}


        .search-container {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .player-table {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .player-table th {
            background-color: #2d3748;
            color: white;
        }

        .player-table tr:nth-child(even) {
            background-color: #f8fafc;
        }

        .player-table tr:hover {
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

        .player-stats {
            color: #4a5568;
        }

        .player-name {
            color: #2d3748;
            font-weight: bold;
        }

        .team-name {
            color: #4a5568;
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
</head>

<body class="min-h-screen flex flex-col">
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
                <ul class="flex gap-6 hidden lg:flex hero-paragraph">
                    <li><a href="index.php" class="boton">Inicio</a></li>
                    <li><a href="jugadores.php" class="boton">Jugadores</a></li>
                    <li><a href="equipos.php" class="boton">Equipos</a></li>
                    <li><a href="partidos.php" class="boton">Partidos</a></li>
                    <li><a href="trivia.php" class="boton">Trivia</a></li>
                </ul>
            </div>

        </div>
        <!-- END RIGHT Hand Side -->
    </nav>
    <!-- END NAV -->

    <main class="container mx-auto px-4 pb-8 flex-grow">
        <h2 class="text-3xl font-bold mb-6 text-center text-gray-800 mt-4">Estadísticas de Jugadores</h2>

        <!-- este el formulario para buscar -->
        <div class="search-container p-4 mb-6">
            <form method="GET" action="" class="flex flex-col md:flex-row gap-4 items-end">
                <div class="flex-grow">
                    <label for="search" class="block text-sm font-medium text-gray-700 mb-1">Buscar Jugador:</label>
                    <input type="text" id="search" name="search" placeholder="Nombre del jugador..."
                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                        value="<?php echo isset($_GET['search']) ? htmlspecialchars($_GET['search']) : ''; ?>">
                </div>
                <div class="flex gap-2">
                    <button type="submit" class="btn-search px-4 py-2 rounded-md flex items-center justify-center">
                        <i class="fas fa-search mr-2"></i> Buscar
                    </button>
                    <?php if (isset($_GET['search']) && !empty($_GET['search'])): ?>
                        <a href="jugadores.php" class="btn-reset px-4 py-2 rounded-md flex items-center justify-center">
                            <i class="fas fa-times mr-2"></i> Limpiar
                        </a>
                    <?php endif; ?>
                </div>
            </form>
        </div>

        <?php
        function clearN($clearable){
            return substr($clearable, 1);
        }
        //aaqui se hace la conexion sicopatamente tu sabe
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "baseball_db";

        $conn = new mysqli($servername, $username, $password, $dbname);


        if ($conn->connect_error) {
            die("Conexión fallida: " . $conn->connect_error);
        }
        // Consulta a la tabla jugadores
        $sql_jugadoresData = "SELECT * FROM jugadores";
        $resultadoData = $conn->query($sql_jugadoresData);

        // esta es la consulta que filtra y trae los jugadores le llega?
        $sql = "SELECT j.*, e.nombre_del_equipo, l.nombre_de_la_liga,ej.* 
                    FROM jugadores j 
                    LEFT JOIN equipos e ON j.id_del_equipo = e.id_del_equipo 
                    LEFT JOIN ligas l ON j.id_de_la_liga = l.id_de_la_liga 
                    LEFT JOIN estadisticas_jugadores ej ON j.id_del_jugador = ej.id_del_jugador";

        // si hay una busqueda se filtra por el nombre mmñ
        if (isset($_GET['search']) && !empty($_GET['search'])) {
            $search = $conn->real_escape_string($_GET['search']);
            $sql .= " WHERE j.nombre_del_jugador LIKE '%$search%' OR j.apodo_del_jugador LIKE '%$search%'";
        }

        $result = $conn->query($sql);
        ?>

        <!-- esta es la tabla donde se muestran los jugadores  -->
        <div class="player-table overflow-x-auto">
            <?php if ($result && $result->num_rows > 0): ?>
                <table id="tabla-jugadores" class="min-w-full divide-y divide-gray-200">
                    <thead>
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Jugador</th>
                            <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Equipo</th>
                            <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Posición</th>
                            <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Edad</th>
                            <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">AVG</th>
                            <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">HR</th>
                            <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">RBI</th>
                            <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">OBP</th>
                            <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">SLG</th>
                            <th class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Acción</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <?php while ($row = $result->fetch_assoc()): ?>
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div>
                                            <div class="player-name text-sm">
                                                <?php echo htmlspecialchars($row['nombre_del_jugador']); ?></div>
                                            <div class="text-xs text-gray-500">
                                                #<?php echo htmlspecialchars($row['numero_del_jugador']); ?>
                                                <?php if (!empty($row['apodo_del_jugador'])): ?>
                                                    - "<?php echo htmlspecialchars($row['apodo_del_jugador']); ?>"
                                                <?php endif; ?>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="team-name text-sm"><?php echo htmlspecialchars($row['nombre_del_equipo']); ?>
                                    </div>
                                    <div class="text-xs text-gray-500">
                                        <?php echo htmlspecialchars($row['nombre_de_la_liga']); ?></div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    <?php echo htmlspecialchars($row['posicion_del_jugador']); ?>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                    <?php echo htmlspecialchars($row['edad_del_jugador']); ?>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap player-stats text-sm">
                                    <?php echo clearN($row['promedio_de_bateo']); ?>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap player-stats text-sm">
                                    <?php echo htmlspecialchars($row['home_runs']); ?>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap player-stats text-sm">
                                    <?php echo htmlspecialchars($row['carreas_impulsadas']); ?>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap player-stats text-sm">
                                    <?php echo clearN($row['promedio_de_enbasase']); ?>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap player-stats text-sm">
                                    <?php echo clearN($row['promedio_de_slugging']); ?>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <a href="jugador-detalle.php?id=<?= $row['id_del_jugador'] ?>"
                                        class="inline-flex items-center px-3 py-1.5 bg-blue-600 text-white text-xs font-medium rounded hover:bg-blue-700 transition-colors duration-300">
                                        <i class="fas fa-eye mr-1"></i> Ver más
                                    </a>
                                </td>

                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <div class="no-results my-4 text-center">
                    <p>No se encontraron
                        jugadores<?php echo isset($_GET['search']) ? ' con el nombre "' . htmlspecialchars($_GET['search']) . '"' : ''; ?>.
                    </p>
                </div>
            <?php endif; ?>
        </div>

        <?php

        $conn->close();
        ?>
    </main>


</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<!-- Incluir SortableJS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.15.0/Sortable.min.js"></script>

<script>
$(document).ready(function() {
    var table = $('#tabla-jugadores').DataTable({
        paging: true,
        pageLength: 10,
        lengthMenu: [10, 25, 50, 100],
        searching: false,
        ordering: true,
        info: true,
        order: [[0, 'asc']],
        language: {
            search: 'Buscar jugador:',
            lengthMenu: 'Mostrar _MENU_ jugadores',
            info: 'Mostrando _START_ a _END_ de _TOTAL_ jugadores'
        },
        // Inicializar SortableJS después de que DataTables haya terminado de renderizar
        drawCallback: function() {
            // Eliminar instancias previas de Sortable para evitar duplicados
            var tbody = document.querySelector('#tabla-jugadores tbody');
            if (tbody._sortable) {
                tbody._sortable.destroy();
            }
            
            // Crear nueva instancia de Sortable en el tbody generado por DataTables
            tbody._sortable = new Sortable(tbody, {
                animation: 150,
                ghostClass: 'bg-yellow-100',
                onEnd: function(evt) {
                    // Acción después de mover la fila
                    var order = Array.from(evt.to.children).map(function(row) {
                        return row.querySelector('.player-name').textContent.trim();
                    });
                    
                    console.log('Nuevo orden:', order);
                }
            });
        }
    });
});


</script>

    <!-- FOOTER -->
    <footer class="bg-gray-900 text-white py-6 px-4 text-lg">
        <div class="px-4 flex flex-col items-center gap-4">

            <!-- Enlaces -->
            <div class="w-full flex justify-between px-4 lg:justify-evenly">
                <a href="#top" class="hover:text-gray-400 transition text-xl">Inicio</a>
                <a href="#info" class="hover:text-gray-400 transition text-xl">Info</a>
                <a href="#players" class="hover:text-gray-400 transition text-xl">Jugadores</a>
            </div>

            <!-- Derechos -->
            <div class="flex items-center space-x-2 text-xl">
                <span>&copy;</span>
                <span>2025 MLB STATS. Todos los derechos reservados.</span>
            </div>

        </div>
    </footer>
    <!-- FOOTER End -->
</html>