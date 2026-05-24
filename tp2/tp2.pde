// Variables
int pantalla = 0;
boolean fin = false;
int timer;
float alfa = 0;        // animacion fade del texto
PImage[] imgs = new PImage[5];
PFont fuente;

String[] titulos = {"RELATOS SALVAJES", "LA HISTORIA", "EL DIRECTOR", "EL REPARTO", "PREMIOS"};
String[] cuerpos = {
  "Argentina, 2014 - Dir. Damian Szifron",
  "Seis relatos sobre la violencia cotidiana.",
  "Damian Szifron - Los Simuladores.",
  "Ricardo Darin - Erica Rivas - Oscar Martinez",
  "Nominada al Oscar - Mejor Pelicula Extranjera"
};

void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);
  fuente = loadFont("Arial-Bold.vlw"); // carga la fuente
  textFont(fuente);
  for (int i = 0; i < 5; i++) {
    imgs[i] = loadImage("img" + i + ".jpg"); // carga imagenes
  }
  timer = millis();
}

void draw() {
  background(0);
  if (fin == false) {
    // Muestra pantalla actual
    if (imgs[pantalla] != null) image(imgs[pantalla], 0, 0, 640, 480);
    fill(0, 150); rect(0, 0, 640, 480);  // oscurece la imagen
    if (alfa < 255) alfa = alfa + 5;     // fade in del texto
    fill(220, 30, 30, alfa); textSize(32); text(titulos[pantalla], 320, 160); // titulo
    fill(255, alfa); textSize(20); text(cuerpos[pantalla], 320, 280);         // cuerpo
    if (millis() - timer > 4000) siguientePantalla(); // avanza cada 4 seg
  } else {
    // Pantalla final
    fill(255); textSize(28); text("FIN", 320, 180);
    boolean hover = mouseX > 220 && mouseX < 420 && mouseY > 300 && mouseY < 360;
    if (hover || mousePressed) fill(220, 30, 30); else fill(100, 0, 0); // color del boton
    rect(220, 300, 200, 60, 8);
    fill(255); textSize(20); text("REINICIAR", 320, 330);
  }
}

// Pasa a la siguiente pantalla
void siguientePantalla() {
  pantalla = pantalla + 1;
  if (pantalla >= 5) fin = true; // si termino activa fin
  alfa = 0;          // resetea el fade para la proxima pantalla
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
