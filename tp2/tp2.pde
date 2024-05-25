// asignacion de variables
PImage imagen1, imagen2, imagen3;
String texto1 = "J E N G A \nun juego de habilidad física";
String texto2 = "Consiste en tomar 1 solo bloque \nde cualquier nivel de la torre, \ny colocarlo en el nivel superior para completarlo. \nSolo se debe usar una mano a la vez.";
String texto3 = "El juego termina cuando \nla torre cae, o si cualquier pieza cae \nde la torre que no sea la pieza \nque está siendo derribada para moverse a la cima.";
float posX = 0;
float posY = 0;
float velocidadX = 1;
float velocidadY = 1;
int pantalla = 0;
int tiempoPantalla = 300; 
int tiempo = 0;
int botonX, botonY, botonAncho, botonAlto;

void setup() {
  size(640, 480);
  imagen1 = loadImage("imagen1.jpg");
  imagen2 = loadImage("imagen2.jpg");
  imagen3 = loadImage("imagen3.jpg");
  botonX = width/2 - 50;
  botonY = height - 50;
  botonAncho = 100;
  botonAlto = 40;
}

void draw() {
  background(255);
  fill(0);
  textSize(24);
  if (pantalla == 0) {
    image(imagen1, 0, 0, width, height);
    textAlign(CENTER, CENTER);
    text(texto1, posX, posY);
  } else if (pantalla == 1) {
    image(imagen2, 0, 0, width, height);
    text(texto2, width/2, posY);
  } else if (pantalla == 2) {
    image(imagen3, 0, 0, width, height);
    text(texto3, width/2, posY);
  }
 
  
  // Mover texto
  posX += velocidadX;
  posY += velocidadY;
  
  
  
  // Transición automática entre pantallas por tiempo
  if (frameCount - tiempo > tiempoPantalla) {
    siguientePantalla();
    tiempo = frameCount;
  }
  
  // botón al final
  if (pantalla == 2) {
    fill(100);
    rect(botonX, botonY, botonAncho, botonAlto);
    fill(255);
    text("Reiniciar", width/2, height - 30);
  }
}

void siguientePantalla() {
  pantalla = (pantalla + 1) % 3;
  posX = 0;
  posY = 0;
}

void keyPressed() {
  if (key == ' ') {
    siguientePantalla();
  }
}

void mousePressed() {
  if (pantalla == 2 && mouseX > botonX && mouseX < botonX + botonAncho && mouseY > botonY && mouseY < botonY + botonAlto) {
    reiniciar();
  }
}

void reiniciar() {
  pantalla = 0;
  tiempo = frameCount;
}
