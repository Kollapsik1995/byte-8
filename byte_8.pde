import drop.*;
import test.*;

boolean display[][] = new boolean[32][32];
int displaySize, pixelSize;
color pixelOnColor = 20;
color pixelShadowColor = 50;
color pixelShadowDestiny = 50;
int halfBetweenPixels;
int shadowMove;
int step;
SDrop drop;
String[] Program;
boolean loaded = false;
int numCom = 0;
int now = 0;
boolean del = false;

void setup() {
  size(600, 600);
  drop = new SDrop(this);
  displaySize = width;
  pixelSize = displaySize/32;
  step=pixelSize;
  shadowMove=int(pixelSize*0.2);
  halfBetweenPixels = pixelSize/10;
  pixelSize-=halfBetweenPixels*2;
  noStroke();
  surface.setTitle("BYTE 8");
  surface.setIcon(loadImage("icon.png"));
}


void draw() {
  background(#62B77F);
  if (loaded) {
    Execute();
  }
  drawDisplay();
  println(int(vars.getOrDefault(vars.get("A"), "A")));
}


void drawDisplay() {
  for (int y = 0; y < 32; y++) {
    for (int x = 0; x < 32; x++) {
      if (display[y][x]) {
        fill(pixelShadowColor, pixelShadowDestiny);
        rect(x*step+shadowMove, y*step+shadowMove, pixelSize, pixelSize);
        fill(pixelOnColor);
        rect(x*step+halfBetweenPixels, y*step+halfBetweenPixels, pixelSize, pixelSize);
      }
    }
  }
}


void dropEvent(DropEvent theDropEvent) {
  if (theDropEvent.isFile()) {
    File myFile = theDropEvent.file();
    Program = loadStrings(myFile.getAbsolutePath());
    loaded = true;
  }
}
