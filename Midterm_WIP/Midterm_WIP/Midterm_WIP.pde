
String state = "pregame"; // Storing our states as Strings 

void setup() {
  size (800, 800);
  textAlign(CENTER);
  textSize(25);
}

void draw() {
  if (state == "pregame") {
    pregame();
  } else if (state == "game") {
    game();
  } else if (state == "game over") {
    gameover();
  }
  
  println(state);
}

void mousePressed() {
  if (state == "pregame") {
    state = "game";
  } else if (state == "game over") {
    state = "pregame";
  } else if (state == "game") {
     state = "game over";
  }
}

void pregame() {
  background(255);
  fill(0);
  text("Welcome to my Processing Game", width/2, height/2);
  text("click to play the game", width/2, height/1.5);
}

void game() {
  background(200);
  
  // Display score
  fill(0);
  text("Stevens Processing sketch gallery", width/2, 50);
  
   if (mouseX <= width/2 && mouseY <= height/2 && mouseX >= 0 && mouseY >=0) {
    fill(255,0,0);
    rect(0, 0, width/2, height/2);
    fill(0);
    text("Sketch 1", width/4, height/4);
    sketchOne();
  } else if(mouseX >= width/2 && mouseY <= height/2 && mouseX <= width && mouseY >=0){
    fill(0,0,255);
    rect(width/2, 0, width/2, height/2);
    fill(0);
    text("Sketch 2", width/1.5, height/4);
    sketchTwo();
  } else if(mouseY >= height/2 && mouseX <= width/2 && mouseY <= height && mouseX <= height) {
    fill(0,255,0);
    rect(0, height/2, width/2, height/2);
    fill(0);
    text("Sketch 3", width/4, height/1.5);
    sketchThree();
  } else if(mouseY >= height/2 && mouseX >= height/2 && mouseX <= width && mouseY <= height) {
    fill(127, 0, 127);
    rect(width/2, height/2, width/2, height/2);
    fill(0);
    text("Sketch 4", width/1.5, height/1.5);
    sketchFour();
  }
  
}

void gameover() {
  background(255, 0, 0);
  fill(0);
  text("Thanks for visiting", width/2, height/2);
  text("click to see more.", width/2, height/2 + 50);
 
}

void sketchOne(){
}

void sketchTwo(){
}
void sketchThree(){
}
void sketchFour(){
}
