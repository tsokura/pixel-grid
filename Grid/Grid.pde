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
  colorPalette[1] = color(0,0,5);
  colorPalette[2] = color(0,0,10);
  colorPalette[3] = color(0,0,20);
  colorPalette[4] = color(0,0,200);
  colorPalette[5] = color(0,0,50);
  colorPalette[6] = color(200,0,70);
  colorPalette[7] = color(0,0,100);
  colorPalette[8] = color(0,100,120);
  colorPalette[9] = color(150,0,150);
}

void draw() {
  background(90, 90, 90);

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
       print("pixels.setPixelColor(");
       
       if ((i==0) && (j==0)) {
         print("p[0] + offset");
         }
                if ((i==0) && (j==1)) {
         print("p[1] + offset");
         }
                if ((i==0) && (j==2)) {
         print("p[2] + offset");
         }
         if ((i==0) && (j==3)) {
         print("p[3] + offset");
         }
         if ((i==1) && (j==0)) {
         print("p[4] + offset");
         }
         if ((i==1) && (j==1)) {
         print("p[5] + offset");
         }
         if ((i==1) && (j==2)) {
         print("p[6] + offset");
         }
         if ((i==1) && (j==3)) {
         print("p[7] + offset");
         }
         if ((i==2) && (j==0)) {
         print("p[8] + offset");
         }
         if ((i==2) && (j==1)) {
         print("p[9] + offset");
         }
         if ((i==2) && (j==2)) {
         print("p[10] + offset");
         }
         if ((i==2) && (j==3)) {
         print("p[11] + offset");
         }
         if ((i==3) && (j==0)) {
         print("p[12] + offset");
         }
         if ((i==3) && (j==1)) {
         print("p[13] + offset");
         }
         if ((i==3) && (j==2)) {
         print("p[14] + offset");
         }
         if ((i==3) && (j==3)) {
         print("p[15] + offset");
         }

       print(","+(red));
       print(","+(green)); 
       println(","+(blue)+");"); 
     
      }
    }
  }
}
