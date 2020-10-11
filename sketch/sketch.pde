Keydion keydion;

void setup()
{
  keydion = new Keydion();
  frameRate(Float.MAX_VALUE);
}

void draw()
{
}

void keyPressed() {
  keydion.press(str(key));
}

void keyReleased() {
  keydion.release(str(key));
}
