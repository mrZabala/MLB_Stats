# MLB Stats

## Descripción del Proyecto

MLB Stats es una aplicación web completa diseñada para proporcionar estadísticas detalladas sobre la Major League Baseball (MLB). Esta plataforma ofrece a los aficionados del béisbol acceso a información actualizada sobre equipos, jugadores, partidos y más, todo en una interfaz intuitiva y atractiva.

## Funcionalidades Principales

- **Página de Inicio**: Presentación general del sitio con información destacada y navegación intuitiva.
- **Estadísticas de Jugadores**: Consulta detallada de estadísticas individuales de jugadores de la MLB.
- **Perfiles de Equipos**: Información completa sobre cada equipo, incluyendo récords, jugadores y estadísticas.
- **Calendario de Partidos**: Visualización de partidos programados y resultados anteriores.
- **Detalles de Partidos**: Información detallada sobre partidos específicos, incluyendo alineaciones y estadísticas.
- **Trivia de Béisbol**: Sección interactiva con preguntas para poner a prueba los conocimientos sobre béisbol.

## Tecnologías Utilizadas

### Frontend
- **HTML5**: Estructura básica de las páginas web.
- **CSS3**: Estilos personalizados para mejorar la apariencia visual.
- **Tailwind CSS**: Framework de utilidades CSS para un diseño rápido y responsivo.
- **JavaScript**: Interactividad del lado del cliente y manipulación del DOM.
- **jQuery**: Biblioteca de JavaScript para simplificar la programación del lado del cliente.
- **DataTables**: Plugin de jQuery para crear tablas interactivas con funcionalidades avanzadas.
- **Font Awesome**: Biblioteca de iconos vectoriales para mejorar la interfaz de usuario.

### Backend
- **PHP**: Lenguaje de programación del lado del servidor para la lógica de negocio.
- **MySQL**: Sistema de gestión de bases de datos relacional para almacenar toda la información.

### Base de Datos
- Esquema relacional con tablas para equipos, jugadores, estadísticas, partidos y más.
- Consultas SQL optimizadas para recuperar datos eficientemente.

## Requisitos del Sistema

- Servidor web (Apache recomendado)
- PHP 7.4 o superior
- MySQL 5.7 o superior
- Navegador web moderno con JavaScript habilitado

## Instalación

1. Clonar o descargar el repositorio en el directorio de su servidor web (ej. htdocs para XAMPP)
2. Importar el archivo `baseball_db.sql` a su servidor MySQL para crear la base de datos
3. Configurar los parámetros de conexión a la base de datos en los archivos PHP si es necesario
4. Acceder al sitio web a través de su navegador (ej. http://localhost/MLB_Stats)

## Estructura del Proyecto

- **index.php**: Página principal del sitio
- **jugadores.php**: Página de estadísticas de jugadores
- **equipos.php**: Página de información de equipos
- **partidos.php**: Calendario y resultados de partidos
- **partido-detalle.php**: Información detallada de un partido específico
- **trivia.php**: Juego de trivia sobre béisbol
- **assets/**: Directorio con recursos estáticos (imágenes, CSS, JavaScript)
- **baseball_db.sql**: Archivo de base de datos con estructura y datos iniciales

## Capturas de Pantalla

*(Aquí se pueden incluir capturas de pantalla del proyecto)*

## Contribución

Si desea contribuir a este proyecto, por favor:
1. Haga un fork del repositorio
2. Cree una rama para su función (`git checkout -b feature/nueva-funcion`)
3. Realice sus cambios y haga commit (`git commit -m 'Añadir nueva función'`)
4. Envíe a la rama (`git push origin feature/nueva-funcion`)
5. Abra un Pull Request

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - vea el archivo LICENSE para más detalles.

## Contacto

*(Información de contacto del desarrollador)*
