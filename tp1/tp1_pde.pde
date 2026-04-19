PImage img;
int desplazar;

void setup(){
  size (800, 400);
  background (224, 224, 224);
  img = loadImage("imagen.jpg");
  desplazar = width/2;
  
}
 
 void draw(){
   background (224, 224, 224);
   image (img, 0, 0, 400, 400);
   
   //cabeza
   stroke(0);         
   strokeWeight(3);
   fill (121, 196, 183); //cabeza
   rect (78+desplazar, 32, 100, 188);//cabeza
   fill (198, 130, 130); //cabeza
   triangle (188+desplazar, 100, 165+desplazar, 330, 255+desplazar, 288); //cabeza
   fill (160, 214, 181); //cabeza
   triangle (210+desplazar, 195, 250+desplazar, 293, 329+desplazar, 210); //cabeza
   fill (214, 198, 54); //cabeza
   quad (176+desplazar, 44, 328+desplazar, 68, 289+desplazar, 210, 180+desplazar, 190); //cabeza
   fill (177, 178, 211); //cabeza
   quad (73+desplazar, 211, 170+desplazar, 200, 176+desplazar, 355, 74+desplazar, 280); //cabeza
  
    
   noStroke();
   fill (214, 198, 54);
   quad (286+desplazar, 183, 343+desplazar, 196, 340+desplazar, 220, 180+desplazar, 190);
   fill (255);
   ellipse(100+desplazar, 177, 170, 80);
   
   stroke (0);
   strokeWeight (3);
   fill (159, 127, 175);
   quad (132+desplazar, 354, 244+desplazar, 351, 263+desplazar, 400, 114+desplazar, 400);
   
   
   
   noStroke();
   triangle (150+desplazar, 270, 205+desplazar, 270, 177+desplazar, 90); //nariz
   triangle (145+desplazar, 70, 200+desplazar, 68, 177+desplazar, 236); //nariz
   noFill();
   stroke(0);
   strokeWeight(3);
   bezier ( 544, 71, 565, 150, 567, 200, 551, 271); //nariz
   bezier ( 605, 270, 590, 180, 580, 200, 599, 67); //nariz
   bezier ( 544, 71, 564, 70, 579, 70, 599, 67); //nariz
   bezier ( 551, 271, 571, 269, 590, 271, 605, 271); //nariz
   
   noStroke();
   fill (229, 190, 220);
   triangle (75+desplazar, 325, 198+desplazar, 326, 130+desplazar, 285); //labios
   triangle (170+desplazar, 325, 233+desplazar, 280, 295+desplazar, 325); //labios
   arc (185+desplazar, 325, 216, 80, 0, PI); //labios
   noFill();
   stroke(0);
   strokeWeight(3);
   bezier ( 75+desplazar, 325, 493, 312, 518, 299, 130+desplazar, 285 ); //labios
   bezier ( 530, 285, 548, 296, 568, 308, 581, 316 ); //labios
   bezier ( 581, 316, 598, 305, 613, 294, 633, 280 ); //labios
   bezier ( 633, 280, 651, 292, 675, 312, 693, 325 ); //labios
   bezier ( 693, 325 , 645, 380, 531, 380, 475, 327 ); //labios
   bezier ( 693, 325 , 557, 339, 623, 338, 475, 327 ); //labios
   
   
   fill (255);
   ellipse (89+desplazar, 160, 170, 55); //ojo
   ellipse (307+desplazar, 160, 170, 50); //ojo
   ellipse (307+desplazar, 170, 170, 60); //ojo
   
   fill(0);
   ellipse (305+desplazar, 150, 100, 40); //ojo
   
   fill (193, 211, 122);
   triangle (220+desplazar, 153, 389+desplazar, 151, 301+desplazar, 113); //ojo
   
   fill(0);
   ellipse (90+desplazar, 150, 80, 40); //ojo
   
   fill (183, 148, 152);
   arc (89+desplazar, 155, 170, 65, PI, TWO_PI); //ojo
   
   
   
   
 }

 
 void mousePressed(){
   println (mouseX, mouseY);
 }
