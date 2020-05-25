var a;
void setup() {
  background(127);
  size(500,500);
  a = loadImage("rose.png");
}
draw = function() {
  image(a, 0, 0)
};
mouseClicked = function() {
  println(mouseX, mouseY);
};
