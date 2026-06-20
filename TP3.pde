// https://youtu.be/hbe_6hjMRHE

PImage img;        
int tamCelda;      // tamaño de celda 
int columnas;      // cantidad de columnas 
int filas;         // cantidad de filas 
int miniCuadrado;  // tamaño de minicuadrado
int desplazar;     // desplazamiento a la derecha
float angulo;      // rotacion de los minicuadrados

void setup() {
  size(800, 400);                  
  img = loadImage("imagen.jpeg");  
  reiniciar();                     // inicia todas las variables
}

// funcion SIN retorno
void dibujarTablero() {
  for (int i = 0; i < columnas; i++) {      // columnas
    for (int j = 0; j < filas; j++) {        // filas
      if (i%2==0 && j%2==0 || i%2!=0 && j%2!=0) {  
        fill(0);                              // celda negra
      } else {
        fill(255);                            // celda blanca
      }
      noStroke();                             
      rect(desplazar + tamCelda*i, tamCelda*j, tamCelda, tamCelda);  

      if (i%2==0 && j%2==0) {                // celdas negras de posicion par
        fill(255);                            // minicuadrados blancos
        stroke(0);                            
        strokeWeight(1);                      
        dibujarMini(desplazar + tamCelda*i, tamCelda*j);                                                      // superior-izquierda
        dibujarMini(desplazar + tamCelda*i + tamCelda - miniCuadrado, tamCelda*j);                            // superior-derecha
        dibujarMini(desplazar + tamCelda*i, tamCelda*j + tamCelda - miniCuadrado);                            // inferior-izquierda
        dibujarMini(desplazar + tamCelda*i + tamCelda - miniCuadrado, tamCelda*j + tamCelda - miniCuadrado); // inferior-derecha
        noStroke();                           
      }
    }
  }
}


void dibujarMini(int x, int y) {
  pushMatrix();                                        // coordenadas
  translate(x + miniCuadrado/2, y + miniCuadrado/2);  // mueve centro del minicuadrado
  rotate(angulo);                                      // rota desde centro
  rect(-miniCuadrado/2, -miniCuadrado/2, miniCuadrado, miniCuadrado); 
  popMatrix();                                         // restaura coordenadas
}

// distancia del mouse al centro del tablero
float calcularDistancia(int mx, int my) {
  float centrox = desplazar + 200;          // coordenada x del centro
  float centroy = 200;                      // coordenada y del centro 
  return dist(mx, my, centrox, centroy);    // devuelve distancia entre mouse y centro
}

// vuelve a su estado original
void reiniciar() {
  columnas = 9;               
  filas = 9;                 
  tamCelda = 400/9;           
  miniCuadrado = tamCelda/4;  
  desplazar = width/2;        
  angulo = 0;                 
}

void draw() {
  background(255);             
  image(img, 0, 0, 400, 400); 
  dibujarTablero();            
}

// rotacion de los minicuadrados 
void mouseMoved() {
  float distancia = calcularDistancia(mouseX, mouseY);  
  angulo = map(distancia, 0, 400, 0, 6.28);             
}

// tecla R reinicia el programa
void keyPressed() {
  if (key == 'r' || key == 'R') {  // tecla R: reinicia el programa
    reiniciar();
  }
}
