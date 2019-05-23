void runMode1() {

  background(img);
  noStroke();
  lights();

  pushMatrix();
  translate(x, y, z);
  fill(255);
  sphere(50);
  popMatrix();

  if ( rain == true) {
    for (int i = 0; i< count; i++) {    // for loop
      rainx[i] += speedx[i]; // x+=y;   x = x+y;
      rainy[i] += speedy[i]; 
      if (rainy[i] > height+20 || rainx[i] > width + 20 || rainx[i] < -20) {
        rainx[i] = random(width); 
        rainy[i] = random(-200, -50);
        float temp = random(25, 50);
        speedy[i] = temp;
        rainsize[i] = temp/5.0;
      }
      fill(255, 100);
      ellipse(rainx[i], rainy[i], rainsize[i], rainsize[i]);
    }
  }
}
