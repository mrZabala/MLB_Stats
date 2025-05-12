<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MLB Stats - Trivia</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        .trivia-card {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .trivia-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        .option-btn {
            transition: all 0.3s;
            border: 2px solid #e2e8f0;
        }

        .option-btn:hover {
            background-color: #e2e8f0;
        }

        .option-selected {
            border-color: #2d3748;
            background-color: #e2e8f0;
        }

        .option-correct {
            border-color: #31c48d;
            background-color: #f3faf7;
        }

        .option-incorrect {
            border-color: #e53e3e;
            background-color: #fdf2f2;
        }

        .btn-primary {
            background-color: #2d3748;
            color: white;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            background-color: #1a202c;
        }

        .btn-secondary {
            background-color: #4a5568;
            color: white;
            transition: all 0.3s;
        }

        .btn-secondary:hover {
            background-color: #2d3748;
        }

        .result-card {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .confetti {
            position: fixed;
            width: 10px;
            height: 10px;
            background-color: #f00;
            z-index: 1000;
            opacity: 0;
            animation: fall 3s linear forwards;
        }

        @keyframes fall {
            0% {
                transform: translateY(-100vh) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(100vh) rotate(360deg);
                opacity: 0;
            }
        }

        .progress-bar {
            height: 8px;
            background-color: #e2e8f0;
            border-radius: 4px;
            overflow: hidden;
        }

        .progress-bar-inner {
            height: 100%;
            background-color: #3b82f6;
            border-radius: 4px;
            transition: width 0.3s ease;
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
                    <li><a href="trivia.php" class="boton">Trivia</a></li>
                </ul>
            </div>
        </div>
        <!-- END RIGHT Hand Side -->
    </nav>

    <main class="container mx-auto px-4 py-8">
        <h2 class="text-3xl font-bold mb-6 text-center text-gray-800 section-title">Trivia de Béisbol MLB</h2>

        <div class="max-w-3xl mx-auto">
            
            <div id="intro-card" class="trivia-card p-6 mb-8">
                <div class="text-center mb-6">
                    <i class="fas fa-baseball-ball text-4xl text-blue-600 mb-4"></i>
                    <h3 class="text-2xl font-bold mb-2">¡Pon a prueba tus conocimientos!</h3>
                    <p class="text-gray-600">Esta trivia consta de 10 preguntas sobre béisbol y la MLB. ¿Estás listo para el desafío?</p>
                </div>
                <div class="text-center">
                    <button id="start-btn" class="btn-primary px-6 py-3 rounded-md font-bold">
                        <i class="fas fa-play mr-2"></i>Comenzar Trivia
                    </button>
                </div>
            </div>

         
            <div id="quiz-card" class="trivia-card p-6 mb-8 hidden">
               
                <div class="mb-6">
                    <div class="flex justify-between items-center mb-2">
                        <span id="question-counter" class="text-sm font-medium text-gray-600">Pregunta 1 de 10</span>
                        <span id="score-counter" class="text-sm font-medium text-gray-600">Puntuación: 0</span>
                    </div>
                    <div class="progress-bar">
                        <div id="progress-bar-inner" class="progress-bar-inner" style="width: 10%;"></div>
                    </div>
                </div>

            
                <div id="question-area" class="mb-6">
                    <h3 id="question-text" class="text-xl font-bold mb-4">¿Qué equipo rompió la "Maldición del Chivo" al ganar la Serie Mundial en 2016 después de 108 años sin título?</h3>
                    <div id="options-container" class="space-y-3">
                    
                    </div>
                </div>

                <!-- Navigation buttons -->
                <div class="flex justify-between">
                    <button id="prev-btn" class="btn-secondary px-4 py-2 rounded-md font-medium hidden">
                        <i class="fas fa-arrow-left mr-2"></i>Anterior
                    </button>
                    <div class="flex-grow"></div>
                    <button id="next-btn" class="btn-primary px-4 py-2 rounded-md font-medium">
                        Siguiente<i class="fas fa-arrow-right ml-2"></i>
                    </button>
                </div>
            </div>

         
            <div id="results-card" class="result-card p-6 text-center hidden">
                <div id="results-content" class="mb-6">
                    <div id="score-icon" class="text-6xl mb-4">
                        <i class="fas fa-trophy trophy-icon"></i>
                    </div>
                    <h3 class="text-2xl font-bold mb-2">¡Trivia completada!</h3>
                    <p id="final-score" class="text-xl mb-4">Tu puntuación: <span class="font-bold">0</span> de 10</p>
                    <p id="score-message" class="text-gray-600 mb-6">¡Buen intento! Sigue practicando para convertirte en un experto de la MLB.</p>
                </div>

                <div class="flex flex-col sm:flex-row justify-center gap-4">
                    <button id="show-answers-btn" class="btn-secondary px-4 py-2 rounded-md font-medium">
                        <i class="fas fa-list-ol mr-2"></i>Ver respuestas
                    </button>
                    <button id="restart-btn" class="btn-primary px-4 py-2 rounded-md font-medium">
                        <i class="fas fa-redo mr-2"></i>Volver a jugar
                    </button>
                </div>
            </div>

          
            <div id="review-card" class="trivia-card p-6 mb-8 hidden">
                <h3 class="text-2xl font-bold mb-4 text-center">Repaso de respuestas</h3>
                <div id="review-container" class="space-y-6">
       
                </div>
                <div class="mt-6 text-center">
                    <button id="back-to-results-btn" class="btn-primary px-4 py-2 rounded-md font-medium">
                        <i class="fas fa-arrow-left mr-2"></i>Volver a resultados
                    </button>
                </div>
            </div>
        </div>
    </main>

    <footer class="bg-gray-900 text-white py-6 mt-12 px-4 text-lg">
        <div class="px-4 flex flex-col items-center gap-4">
            <!-- Enlaces -->
            <div class="w-full flex justify-between px-4 lg:justify-evenly">
                <a href="index.php" class="hover:text-gray-400 transition">Inicio</a>
                <a href="jugadores.php" class="hover:text-gray-400 transition">Jugadores</a>
                <a href="equipos.php" class="hover:text-gray-400 transition">Equipos</a>
                <a href="trivia.php" class="hover:text-gray-400 transition">Trivia</a>
            </div>

           
            <div class="flex items-center space-x-2">
                <span>&copy;</span>
                <span>2025 MLB STATS. Todos los derechos reservados.</span>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
           
            const quizData = [
                {
                    question: "¿Qué equipo rompió la \"Maldición del Chivo\" al ganar la Serie Mundial en 2016 después de 108 años sin título?",
                    options: [
                        "Cleveland Guardians",
                        "Chicago Cubs",
                        "Cincinnati Reds"
                    ],
                    correctAnswer: 1,
                    explanation: "Los Chicago Cubs rompieron la famosa maldición al ganar la Serie Mundial en 2016, su primer título desde 1908."
                },
                {
                    question: "¿Qué número usaba Derek Jeter con los New York Yankees?",
                    options: [
                        "2",
                        "7",
                        "13"
                    ],
                    correctAnswer: 0,
                    explanation: "Derek Jeter usaba el número 2, que fue retirado por los Yankees en su honor."
                },
                {
                    question: "¿Qué jugador dominicano tiene el récord de más jonrones conectados por un extranjero en la MLB?",
                    options: [
                        "Albert Pujols",
                        "David Ortiz",
                        "Sammy Sosa"
                    ],
                    correctAnswer: 0,
                    explanation: "Albert Pujols tiene el récord de más jonrones conectados por un jugador nacido fuera de Estados Unidos."
                },
                {
                    question: "¿Qué equipo juega sus partidos de local en Fenway Park?",
                    options: [
                        "New York Yankees",
                        "Boston Red Sox",
                        "Philadelphia Phillies"
                    ],
                    correctAnswer: 1,
                    explanation: "Los Boston Red Sox juegan sus partidos como local en el histórico Fenway Park, inaugurado en 1912."
                },
                {
                    question: "¿Cuál es el significado de la sigla \"ERA\" en las estadísticas de los lanzadores?",
                    options: [
                        "Efectividad de Rendimiento Anual",
                        "Efectividad de Rotación Avanzada",
                        "Efectividad de Carreras Limpias (Earned Run Average)"
                    ],
                    correctAnswer: 2,
                    explanation: "ERA significa 'Earned Run Average' o Efectividad de Carreras Limpias, una estadística que mide el promedio de carreras limpias permitidas por un lanzador por cada 9 entradas."
                },
                {
                    question: "¿Qué significa un \"no-hitter\" en béisbol?",
                    options: [
                        "Cuando un lanzador no permite hits durante un juego completo",
                        "Cuando un bateador no conecta hit durante un juego completo",
                        "Cuando ningún equipo anota carreras durante el juego"
                    ],
                    correctAnswer: 0,
                    explanation: "Un 'no-hitter' ocurre cuando un lanzador (o varios lanzadores) no permite(n) ningún hit durante las 9 entradas de un juego completo."
                },
                {
                    question: "¿Qué famoso jugador latino es conocido como \"El Bambino Dominicano\" y jugó para los Medias Rojas y Yankees?",
                    options: [
                        "Pedro Martínez",
                        "Alex Rodriguez",
                        "David Ortiz"
                    ],
                    correctAnswer: 2,
                    explanation: "David Ortiz, conocido como 'Big Papi' y 'El Bambino Dominicano', jugó para los Minnesota Twins, Boston Red Sox y es considerado una leyenda del béisbol."
                },
                {
                    question: "¿Cuál es la distancia estándar desde el montículo del lanzador hasta el home plate?",
                    options: [
                        "50 pies",
                        "60 pies y 6 pulgadas",
                        "66 pies"
                    ],
                    correctAnswer: 1,
                    explanation: "La distancia oficial desde el montículo del lanzador hasta el home plate es de 60 pies y 6 pulgadas (18.44 metros)."
                },
                {
                    question: "¿Qué equipo tiene como mascota al \"Mr. Met\"?",
                    options: [
                        "Miami Marlins",
                        "New York Mets",
                        "Minnesota Twins"
                    ],
                    correctAnswer: 1,
                    explanation: "Mr. Met es la mascota oficial del equipo New York Mets desde 1964."
                },
                {
                    question: "¿En qué ciudad juegan los Dodgers actualmente?",
                    options: [
                        "New York",
                        "Los Angeles",
                        "San Francisco"
                    ],
                    correctAnswer: 1,
                    explanation: "Los Dodgers juegan en Los Angeles desde 1958, cuando se mudaron desde Brooklyn, New York."
                }
            ];

            
            let currentQuestion = 0;
            let score = 0;
            let userAnswers = Array(quizData.length).fill(null);
            let questionAnswered = false;

            // DOM elements
            //#region variables - DOM elements

            const introCard = document.getElementById('intro-card');
            const quizCard = document.getElementById('quiz-card');
            const resultsCard = document.getElementById('results-card');
            const reviewCard = document.getElementById('review-card');
            
            const questionCounter = document.getElementById('question-counter');
            const scoreCounter = document.getElementById('score-counter');
            const progressBarInner = document.getElementById('progress-bar-inner');
            const questionText = document.getElementById('question-text');
            const optionsContainer = document.getElementById('options-container');
            
            const prevBtn = document.getElementById('prev-btn');
            const nextBtn = document.getElementById('next-btn');
            const startBtn = document.getElementById('start-btn');
            const restartBtn = document.getElementById('restart-btn');
            const showAnswersBtn = document.getElementById('show-answers-btn');
            const backToResultsBtn = document.getElementById('back-to-results-btn');
            
            const finalScore = document.getElementById('final-score');
            const scoreMessage = document.getElementById('score-message');
            const reviewContainer = document.getElementById('review-container');

            //#endregion
            
            startBtn.addEventListener('click', function() {
                introCard.classList.add('hidden');
                quizCard.classList.remove('hidden');
                displayQuestion();
            });

           
            function displayQuestion() {
                questionAnswered = false;
                questionCounter.textContent = `Pregunta ${currentQuestion + 1} de ${quizData.length}`;
                scoreCounter.textContent = `Puntuación: ${score}`;
                progressBarInner.style.width = `${((currentQuestion + 1) / quizData.length) * 100}%`;
                
                questionText.textContent = quizData[currentQuestion].question;
                
                optionsContainer.innerHTML = '';
                quizData[currentQuestion].options.forEach((option, index) => {
                    const button = document.createElement('button');
                    button.className = `option-btn w-full text-left py-3 px-4 rounded-md flex items-center`;
                    
                    
                    if (userAnswers[currentQuestion] === index) {
                        button.classList.add('option-selected');
                    }
                    
                    button.innerHTML = `
                        <span class="inline-flex items-center justify-center h-6 w-6 rounded-full bg-gray-200 text-gray-700 mr-3">
                            ${['A', 'B', 'C'][index]}
                        </span>
                        <span>${option}</span>
                    `;
                    
                    button.addEventListener('click', function() {
                        selectOption(index);
                    });
                    
                    optionsContainer.appendChild(button);
                });
                
            
                prevBtn.classList.toggle('hidden', currentQuestion === 0);
                if (currentQuestion === quizData.length - 1) {
                    nextBtn.textContent = 'Finalizar';
                    nextBtn.innerHTML = 'Finalizar<i class="fas fa-check ml-2"></i>';
                } else {
                    nextBtn.textContent = 'Siguiente';
                    nextBtn.innerHTML = 'Siguiente<i class="fas fa-arrow-right ml-2"></i>';
                }
            }

         
            function selectOption(optionIndex) {
                if (questionAnswered) return;
                
                
                const options = optionsContainer.querySelectorAll('.option-btn');
                options.forEach(option => option.classList.remove('option-selected'));
          
                options[optionIndex].classList.add('option-selected');
                
             
                userAnswers[currentQuestion] = optionIndex;
            }

            
            function checkAnswer() {
                if (userAnswers[currentQuestion] === null) return false;
                
                questionAnswered = true;
                const options = optionsContainer.querySelectorAll('.option-btn');
                const correctAnswerIndex = quizData[currentQuestion].correctAnswer;
                const userAnswerIndex = userAnswers[currentQuestion];
                
                
                options.forEach((option, index) => {
                    if (index === correctAnswerIndex) {
                        option.classList.add('option-correct');
                        option.innerHTML += '<span class="ml-auto"><i class="fas fa-check text-green-500"></i></span>';
                    } else if (index === userAnswerIndex) {
                        option.classList.add('option-incorrect');
                        option.innerHTML += '<span class="ml-auto"><i class="fas fa-times text-red-500"></i></span>';
                    }
                    option.disabled = true;
                });
                
                
                if (userAnswerIndex === correctAnswerIndex && !userAnswers.answered) {
                    score++;
                    scoreCounter.textContent = `Puntuación: ${score}`;
                    userAnswers.answered = true;
                }
                
                return true;
            }

            // siguiente pregunta
            nextBtn.addEventListener('click', function() {
                if (currentQuestion < quizData.length - 1) {
                    if (userAnswers[currentQuestion] !== null) {
                        checkAnswer();
                        setTimeout(() => {
                            currentQuestion++;
                            displayQuestion();
                        }, 1000);
                    } else {
                        alert('Por favor, selecciona una respuesta para continuar.');
                    }
                } else {
                    if (userAnswers[currentQuestion] !== null) {
                        checkAnswer();
                        setTimeout(() => {
                            showResults();
                        }, 1000);
                    } else {
                        alert('Por favor, selecciona una respuesta para finalizar.');
                    }
                }
            });

            // ver respuesta anterrior
            prevBtn.addEventListener('click', function() {
                if (currentQuestion > 0) {
                    currentQuestion--;
                    displayQuestion();
                }
            });

            // mostrar resultado
            function showResults() {
                quizCard.classList.add('hidden');
                resultsCard.classList.remove('hidden');
                
                finalScore.innerHTML = `Tu puntuación: <span class="font-bold">${score}</span> de ${quizData.length}`;
                
                // aqui hay un error se arregla despues
                if (score === quizData.length) {
                    scoreMessage.textContent = '¡Perfecto! Eres un verdadero experto en béisbol.';
                    createConfetti();
                } else if (score >= quizData.length * 0.7) {
                    scoreMessage.textContent = '¡Excelente! Tienes un gran conocimiento de béisbol.';
                } else if (score >= quizData.length * 0.5) {
                    scoreMessage.textContent = '¡Bien! Tienes un buen conocimiento básico de béisbol.';
                } else {
                    scoreMessage.textContent = 'Sigue aprendiendo y mejorando tu conocimiento sobre béisbol.';
                }
            }

            // estos se supone que es una animacion de confeti pero no funciona por ahora
            function createConfetti() {
                const colors = ['#f44336', '#e91e63', '#9c27b0', '#3f51b5', '#2196f3', '#03a9f4', '#00bcd4', '#009688', '#4CAF50', '#8BC34A', '#CDDC39', '#FFEB3B', '#FFC107', '#FF9800', '#FF5722'];
                
                for (let i = 0; i < 150; i++) {
                    const confetti = document.createElement('div');
                    confetti.className = 'confetti';
                    confetti.style.left = `${Math.random() * 100}vw`;
                    confetti.style.animationDelay = `${Math.random() * 3}s`;
                    confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                    document.body.appendChild(confetti);
                    
                    
                    setTimeout(() => {
                        confetti.remove();
                    }, 5000);
                }
            }

            // esto te muestra las repuestas una vez terminada la trivia
            showAnswersBtn.addEventListener('click', function() {
                resultsCard.classList.add('hidden');
                reviewCard.classList.remove('hidden');
                
                reviewContainer.innerHTML = '';
                quizData.forEach((q, index) => {
                    const userAnswerIndex = userAnswers[index];
                    const correctAnswerIndex = q.correctAnswer;
                    const isCorrect = userAnswerIndex === correctAnswerIndex;
                    
                    const questionReview = document.createElement('div');
                    questionReview.className = 'border-b pb-4 last:border-b-0';
                    questionReview.innerHTML = `
                        <p class="font-bold mb-2">${index + 1}. ${q.question}</p>
                        <div class="pl-4 mb-2">
                            ${q.options.map((option, i) => {
                                let optionClass = '';
                                let icon = '';
                                
                                if (i === correctAnswerIndex) {
                                    optionClass = 'text-green-600 font-medium';
                                    icon = '<i class="fas fa-check text-green-500 ml-2"></i>';
                                } else if (i === userAnswerIndex && i !== correctAnswerIndex) {
                                    optionClass = 'text-red-600 line-through';
                                    icon = '<i class="fas fa-times text-red-500 ml-2"></i>';
                                }
                                
                                return `<p class="${optionClass}">${['A', 'B', 'C'][i]}. ${option} ${icon}</p>`;
                            }).join('')}
                        </div>
                        <p class="text-sm text-gray-600 pl-4 mt-2">${q.explanation}</p>
                        <p class="text-sm ${isCorrect ? 'text-green-600' : 'text-red-600'} font-medium mt-2">
                            ${isCorrect ? '¡Correcto!' : '¡Incorrecto!'}
                        </p>
                    `;
                    
                    reviewContainer.appendChild(questionReview);
                });
            });

            // volver a ver los resultados
            backToResultsBtn.addEventListener('click', function() {
                reviewCard.classList.add('hidden');
                resultsCard.classList.remove('hidden');
            });

            // estos reinicia la trivia
            restartBtn.addEventListener('click', function() {
                currentQuestion = 0;
                score = 0;
                userAnswers = Array(quizData.length).fill(null);
                
                resultsCard.classList.add('hidden');
                quizCard.classList.remove('hidden');
                displayQuestion();
            });
        });
    </script>
</body>

</html>