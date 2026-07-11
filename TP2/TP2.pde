// Variables
int pantalla = 0;
boolean fin = false;
int timer;
float alfa = 0;

// Imagenes individuales (sin array)
PImage img0, img1, img2, img3, img4;
PFont fuente;

// Titulos individuales (sin array)
String titulo0 = "RELATOS SALVAJES";
String titulo1 = "LA HISTORIA";
String titulo2 = "EL DIRECTOR";
String titulo3 = "EL REPARTO";
String titulo4 = "PREMIOS";

// Cuerpos individuales (sin array)
String cuerpo0 = "Argentina, 2014 - Dir. Damian Szifron";
String cuerpo1 = "Seis relatos sobre la violencia cotidiana.";
String cuerpo2 = "Damian Szifron - Los Simuladores.";
String cuerpo3 = "Ricardo Darin - Erica Rivas - Oscar Martinez";
String cuerpo4 = "Nominada al Oscar - Mejor Pelicula Extranjera";

void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);
  fuente = loadFont("Arial-Bold.vlw");
  textFont(fuente);

  // Carga imagenes individualmente (sin for)
  img0 = loadImage("img0.jpg");
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
  img4 = loadImage("img4.jpg");

  timer = millis();
}

void draw() {
  background(0);

  if (fin == false) {
    // Muestra la imagen segun la pantalla actual
    if (pantalla == 0) image(img0, 0, 0, 640, 480);
    if (pantalla == 1) image(img1, 0, 0, 640, 480);
    if (pantalla == 2) image(img2, 0, 0, 640, 480);
    if (pantalla == 3) image(img3, 0, 0, 640, 480);
    if (pantalla == 4) image(img4, 0, 0, 640, 480);

    fill(0, 150); rect(0, 0, 640, 480); // oscurece la imagen

    if (alfa < 255) alfa = alfa + 5; // fade in del texto

    // Muestra el titulo segun la pantalla actual
    fill(220, 30, 30, alfa);
    textSize(32);
    if (pantalla == 0) text(titulo0, 320, 160);
    if (pantalla == 1) text(titulo1, 320, 160);
    if (pantalla == 2) text(titulo2, 320, 160);
    if (pantalla == 3) text(titulo3, 320, 160);
    if (pantalla == 4) text(titulo4, 320, 160);

    // Muestra el cuerpo segun la pantalla actual
    fill(255, alfa);
    textSize(20);
    if (pantalla == 0) text(cuerpo0, 320, 280);
    if (pantalla == 1) text(cuerpo1, 320, 280);
    if (pantalla == 2) text(cuerpo2, 320, 280);
    if (pantalla == 3) text(cuerpo3, 320, 280);
    if (pantalla == 4) text(cuerpo4, 320, 280);

    if (millis() - timer > 4000) siguientePantalla(); // avanza cada 4 seg

  } else {
    // Pantalla final
    fill(255); textSize(28); text("FIN", 320, 180);
    boolean hover = mouseX > 220 && mouseX < 420 && mouseY > 300 && mouseY < 360;
    if (hover || mousePressed) fill(220, 30, 30); else fill(100, 0, 0);
    rect(220, 300, 200, 60, 8);
    fill(255); textSize(20); text("REINICIAR", 320, 330);
  }
}

// Pasa a la siguiente pantalla
void siguientePantalla() {
  pantalla = pantalla + 1;
  if (pantalla >= 5) fin = true;
  alfa = 0;
  timer = millis();
}

// Reinicia si se clickea el boton
void mouseClicked() {
  if (fin && mouseX > 220 && mouseX < 420 && mouseY > 300 && mouseY < 360) {
    pantalla = 0; alfa = 0; fin = false; timer = millis();
  }
}

// Avanza manualmente con clic
void mousePressed() {
  if (fin == false) siguientePantalla();
}
