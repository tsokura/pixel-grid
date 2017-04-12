int boxsize = 100;
int cols, rows;
int fill = 150;
color[][] colors;
int[][] states;
//how many states
int numStates = 10;
int colorPalette[];
int times = 1;

void setup() {
  size(400, 500);
  cols = 4;
  rows = 4;
  colors = new color[cols][rows];
  states = new int[cols][rows];
  //how many colors
  colorPalette = new int[11];

  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      colors[i][j] = color(fill);
      states[i][j] = 0;
    }
  }

  colorPalette[0] = color(0);
  colorPalette[1] = color(200,25,0);
  colorPalette[2] = color(50);
  colorPalette[3] = color(75);
  colorPalette[4] = color(100);
  colorPalette[5] = color(125);
  colorPalette[6] = color(150);
  colorPalette[7] = color(175);
  colorPalette[8] = color(200);
  colorPalette[9] = color(225);
}

void draw() {
  background(240, 90, 90);

  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      int x = i*boxsize;
      int y = j*boxsize;
      //look up the current state of 0,0 - which is 0,1 or 2
      //then go to the colorPallette, and get that color [R,G,B]
      fill(colorPalette[states[i][j]]);
      rect(x, y, boxsize, boxsize);
    }
  }
}

void mousePressed() {
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      int x = i*boxsize;
      int y = j*boxsize;
      if (mouseX > x && mouseX < (x + boxsize) && mouseY > y && mouseY < (y + boxsize)) {
        if (mousePressed && (mouseButton == LEFT)) {
          colors[i][j] = color(fill);
          int currentState = states[i][j];
          if (states[i][j] < numStates) {
            states[i][j]++;
          } else {
            states[i][j] =  0;
          }

          println("Button at "+i+","+j+" is now "+states[i][j]);
        }
      }
      if (mousePressed && (mouseButton == RIGHT)) {
       int red = (colorPalette[states[i][j]] >> 16 & 0xFF);
              int green = (colorPalette[states[i][j]] >> 8 & 0xFF);
       int blue = (colorPalette[states[i][j]] & 0xFF);
       print("r"+(red));
       print("g"+(green)); 
       print("b"+(blue)+"-"); 
     
      }
    }
  }
}