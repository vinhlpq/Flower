var numberOfTulip = random(5, 10);
var numberOfSunflower = random(5, 10);
var numberOfRose = random(5, 10);
var  sprinklerImage;
void setup () {
  background(127);
  size(500,500);
  sprinklerImage = loadImage("watercan.png");
}
/*******
*House
*******/
var House = function(x, y, width, height) {
  this.x= x;
  this.y= y;
  this.width = width;
  this.height= height;
};
House.prototype.draw = function() {
  stroke(0);
  fill(229,232,255);
  rect(this.x, this.y, this.width, this.height);
  var deltaX= 20;
  var deltaY= 10;
  //Roof
  fill(110,21,10);
  triangle(this.x - deltaX,
          this.y + deltaY,
          this.x + this.width + deltaX,
          this.y + deltaY,
          (this.x + this.width/2),
          (this.y - this.height/2));
  //Window
  strokeWeight(5);
  fill(29, 141 , 242);
  rect(this.x + this.width/16, this.y+this.height/2, this.width/4, this.height/4 );
  rect(this.x + this.width/16*11, this.y+this.height/2, this.width/4, this.height/4 );
  //Door
  fill(183,214,84);
  rect(this.x + this.width * 3 / 8, this.y + this.height/4, this.width/4, this.height * 6 / 8);
  strokeWeight(3);
  ellipse(this.x + this.width * 3 / 8+20, this.y + this.height/1.5, 15, 15);

};

/*******
*Sun OBJECT
*****/
var Sun = function(x, y, radius) {
  this.x= x;
  this.y= y;
  this.radius = radius;

};
Sun.prototype.draw = function() {
fill(253,185,52);
ellipse(this.x, this.y, this.radius, this.radius);
};
/*******
*CLOUD
********/
var Cloud= function(x, y, radiusx, radiusy) {
  this.x= x;
  this.y= y;
  this.radiusx= radiusx;
  this.radiusy= radiusy;
};
Cloud.prototype.draw = function() {
noStroke();
  fill(255);
  ellipse(this.x, this.y, this.radiusx, this.radiusy);
  ellipse(this.x-this.radiusx/2, this.y, this.radiusx/2, this.radiusy/2);
  ellipse(this.x+this.radiusx/2, this.y, this.radiusx/2, this.radiusy/2);
  ellipse(this.x-this.radiusx/2-this.radiusx/4, this.y, this.radiusx/4, this.radiusy/4);
};

/*************
*OBJECT TYPES
**************/

/******************
*Flower Object Type
*******************/
var Flower = function(x, y, height) {
    this.x= x;
    this.y= y;
    this.height = height;
};
Flower.prototype.growBy = function (amount) {
    this.height+= amount;
};
Flower.prototype.isWaterring = function() {
  if(this.x-25<mouseX &&
      mouseX<this.x+25 &&
      this.y - this.height-50 < mouseY &&
      mouseY < this.y - this.height+30) {
    return true;
  }
  return false;
};

/*****************
*Rose
******************/
var Rose = function( x, y, height) {
  Flower.call(this, x, y, height);

};
Rose.prototype= Object.create(Flower.prototype);
Rose.prototype.draw = function() {
  stroke(0);
  fill(16,122,12);
  rect(this.x, this.y, 10, -this.height);
  fill(56, 169, 84);
  ellipse(this.x+5, this.y-this.height+35, 15, 15);
  fill(234, 67, 53);
  var anchorY= this.y- this.height-300;
  curve(this.x-20, anchorY ,
        this.x-20, this.y-this.height,
        this.x+30, this.y-this.height,
        this.x+30, anchorY);

  ellipse(this.x+5, this.y-this.height, 60, 20);
  ellipse(this.x+5, this.y-this.height, 30, 10);
  ellipse(this.x+5, this.y-this.height, 15, 5);
  fill(158,204,102);
  noStroke();
  triangle(this.x, this.y, this.x+10, this.y, this.x-15, this.y - 20);
  triangle(this.x, this.y, this.x+10, this.y, this.x+25, this.y - 20);
};
/*****************
*Tulip Object Type
******************/

var Tulip = function(x, y, height) {
    Flower.call(this, x, y,height);
};
Tulip.prototype= Object.create(Flower.prototype);

Tulip.prototype.draw = function() {
    noStroke();
    fill(16, 122, 12);
    rect(this.x, this.y, 10, -this.height);
    fill(39, 109, 238);
    // petals
    ellipse(this.x+5, this.y-this.height, 44, 44);
    triangle(this.x-16, this.y-this.height,
            this.x+20, this.y-this.height,
            this.x-20, this.y-this.height-31);
    triangle(this.x-14, this.y-this.height,
            this.x+24, this.y-this.height,
            this.x+3, this.y-this.height-39);
    triangle(this.x+-4, this.y-this.height,
            this.x+26, this.y-this.height,
            this.x+29, this.y-this.height-36);
    fill(158,204,102);
    triangle(this.x, this.y, this.x+10, this.y, this.x-15, this.y - 20);
    triangle(this.x, this.y, this.x+10, this.y, this.x+25, this.y - 20);
};


/*********************
*Sunflower Object Type
**********************/
var Sunflower = function(x, y, height) {
   Flower.call(this, x, y, height);
};
Sunflower.prototype = Object.create(Flower.prototype);

Sunflower.prototype.draw = function() {
    fill(16, 122, 12);

    rect(this.x, this.y, 10, -this.height);

    // petals
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(255, 221, 0);
    ellipse(this.x-10, this.y-this.height, 20, 18);
    ellipse(this.x+5, this.y-this.height-15, 20, 18);
    ellipse(this.x+5, this.y-this.height+15, 20, 18);
    ellipse(this.x+20, this.y-this.height, 20, 18);
    fill(20, 20, 20);
    ellipse(this.x+5, this.y-this.height, 20, 20);
    noStroke();
    fill(158,204,102);
    triangle(this.x, this.y, this.x+10, this.y, this.x-15, this.y - 20);
    triangle(this.x, this.y, this.x+10, this.y, this.x+25, this.y - 20);
};
/*******
Sprinkler
*******/
var Sprinkler = function() {
};
Sprinkler.prototype.draw = function() {
  image(sprinklerImage, mouseX, mouseY - 20, 50, 61);
};



/**************
*MAIN PROGRAM
***************/


/** create object instances **/
var tulipArray = new Array(); // tulip
for (var i =0; i < numberOfTulip; i++) {
  if(round (random(0, 1)) == 0) {
    var tulip = new Tulip(random(0,200), random(400, 500), random(50, 250));
    tulipArray.push(tulip);
  } else {
    var tulip = new Tulip(random(300,500), random(400, 500), random(50, 250));
    tulipArray.push(tulip);
  }
}

var SunflowerArray = new Array(); // sunflower
for ( var i = 0; i < numberOfSunflower; i++ ) {
  if(round (random(0, 1)) == 0) {
    var sunflower = new Sunflower(random(0,200), random(400,500), random(50, 250));
    SunflowerArray.push(sunflower);
  }
  else {
    var sunflower = new Sunflower(random(300,500), random(400,500), random(50, 250));
    SunflowerArray.push(sunflower);
  }
}


var RoseArray = new Array(); // rose
for (var i = 0; i < numberOfRose; i++) {
  if (round (random(0, 1)) == 0) {
    var rose = new Rose(random(0,200), random(400, 500), random(50, 250));
    RoseArray.push(rose);
  } else {
    var rose = new Rose(random(300, 500), random(400, 500), random(50, 250));
    RoseArray.push(rose);
  }


}

var sun = new Sun(200,50,100);
var Cloud1 = new Cloud(150,100,150,80);
var Cloud2 = new Cloud(350,50,200,70);
var House1 = new House(100,150,300,200);
var watercan = new Sprinkler();

var drawScene = function() {

    background(207, 250, 255);
    fill(178, 157, 38);
    rect(0, 300, 500, 200);
    sun.draw();
    Cloud1.draw();
    Cloud2.draw();
    House1.draw();
    for (var i = 0; i < numberOfTulip; i++) {
      tulipArray[i].draw();
    }
    for (var i = 0; i < numberOfSunflower; i++) {
      SunflowerArray[i].draw();
    }
    for (var i = 0; i < numberOfRose; i++) {
      RoseArray[i].draw();
    }
    watercan.draw();
};

mouseClicked = function() {
    for (var i = 0; i < numberOfTulip; i++) {
      if(tulipArray[i].isWaterring()) {
        tulipArray[i].growBy(10);
      }
    }
    for (var i = 0; i < numberOfSunflower; i++) {
      if(SunflowerArray[i].isWaterring()) {
        SunflowerArray[i].growBy(20);
      }
    }
    for (var i = 0; i < numberOfRose; i++) {
      if (RoseArray[i].isWaterring()) {
        RoseArray[i].growBy(30);
      }
    }

    drawScene();
};
mouseMoved = function () {
  drawScene();
};
