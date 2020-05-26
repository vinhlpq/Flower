var a;
var b = new Array();
void setup() {
  background(127);
  size(500,500);
  a = loadImage("rose2.png");
}
var deltaX = 0;
mouseClicked = function() {
  b.push("{x: " + mouseX + ", y: " + mouseY + "}");
  if (mouseButton == RIGHT) {
  println(b);
  }
};

draw = function() {

  fill(56, 169, 84);
  ellipse(125, 280, 15, 15);
  fill(234, 67, 53);
  curve(100, 0, 100, 250, 150, 250, 150, 0);

  ellipse(125, 250, 60, 20);
  ellipse(125, 250, 30, 10);
  ellipse(125, 250, 15, 5);

};
