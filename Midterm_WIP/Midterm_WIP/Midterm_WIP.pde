String state = "pregame"; // Storing our states as Strings 

void setup() {
  size (800, 800);
  textAlign(CENTER);
  textSize(25);
}

////////////////////////////////////////////////////////////

void draw() {
  if (state == "pregame") {
    pregame();
  } else if (state == "game") {
    game();
  } else if (state == "game over") {
    gameover();
  } else if (state == "sketch one") {
    sketchOne();
  } else if (state == "sketch two") {
    sketchTwo();
  } else if (state == "sketch three") {
    sketchThree();
  } else if (state == "sketch four") {
    sketchFour();
  }
  
  println(state);
}

////////////////////////////////////////////////////////////

void mousePressed() {
  if (state == "pregame") {
    state = "game";
  } else if (state == "game over") {
    state = "pregame";
  } else if (state == "game") {
    if (mouseX <= width/2 && mouseY <= height/2) {
      state = "sketch one";
    } else if (mouseX >= width/2 && mouseY <= height/2) {
      state = "sketch two";
    } else if (mouseY >= height/2 && mouseX <= width/2) {
      state = "sketch three";
    } else if (mouseY >= height/2 && mouseX >= width/2) {
      state = "sketch four";
    }
  } else if (state == "sketch one") {
    state = "game over";
  }
  else if (state == "sketch two") {
    state = "game over";
  } else if (state == "sketch two") {
    state = "game over";
  } else if (state == "sketch three") {
    state = "game over";
  } else if (state == "sketch four") {
    state = "game over";
  }
}


////////////////////////////////////////////////////////////

void pregame() {
  background(255);
  fill(0);
  text("Welcome to my Processing Game", width/2, height/2);
  text("click to play the game", width/2, height/1.5);
}

////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////

void gameover() {
  background(255, 0, 0);
  fill(0);
  text("Thanks for visiting", width/2, height/2);
  text("click to see more.", width/2, height/2 + 50);
 
}

////////////////////////////////////////////////////////////

void sketchOne(){
    //stroke(255);
   
   //moon
   fill(255,255,255);
   ellipse(224, 184, 220, 220);
   
   //silhouette of buildings
   fill(80,80,80);
   rect(0, 550, 520, 720);
   rect(300, 450, 320, 340);
   rect(600, 650, 120, 240);
   rect(800, 300, 300, 440);
   rect(1000, 650, 220, 240);

    fill(0,0,0);
   rect(0, 450, 220, 420);
   rect(200, 500, 220, 240);
   rect(500, 650, 100,150);
   rect(900, 350, 300, 320);
   rect(850, 550, 150, 340);
}

void drawSketchOne(){
}


////////////////////////////////////////////////////////////

void sketchTwo(){
}
////////////////////////////////////////////////////////////

void sketchThree(){
}

////////////////////////////////////////////////////////////

void sketchFour(){
}
