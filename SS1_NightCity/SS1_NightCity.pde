void setup() {
   size(screenWidth, screenHeight);
   background(0,0,255);
}

void draw() {
   //stroke(255);
   
   //moon
   fill(255,255,255)
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