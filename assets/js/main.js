


//estas son vainas que na ma es para darle un chin de flow a la vaina pero a esto le falta pila esto na ma es el esqueleto
document.addEventListener('DOMContentLoaded', function() {
    const container = document.querySelector('.scores-container');
    const leftArrow = document.querySelector('.arrows .arrow:first-child');
    const rightArrow = document.querySelector('.arrows .arrow:last-child');
    
    leftArrow.addEventListener('click', function() {
      container.scrollBy({ left: -500, behavior: 'smooth' });
    });
    
    rightArrow.addEventListener('click', function() {
      container.scrollBy({ left: 500, behavior: 'smooth' });
    });
    
    
    const navLinks = document.querySelectorAll('.nav-links a, .nav-right a');
    navLinks.forEach(link => {
      link.addEventListener('click', function(e) {
        e.preventDefault();
        alert('Navegando a: ' + this.textContent);
      });
    });
    
    
    document.querySelector('.search-icon').addEventListener('click', function() {
      alert('Búsqueda activada');
    });
    

    const scoreCards = document.querySelectorAll('.score-card');
    scoreCards.forEach(card => {
      card.addEventListener('click', function() {
        alert('Detalles del partido');
      });
      card.style.cursor = 'pointer';
    });
    
 
    const newsItems = document.querySelectorAll('.news-item');
    newsItems.forEach(item => {
      item.addEventListener('click', function() {
        alert('Leyendo noticia: ' + this.querySelector('.news-title').textContent);
      });
      item.style.cursor = 'pointer';
    });
  });