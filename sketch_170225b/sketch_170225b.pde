// The following short CSV file called "mammals.csv" is parsed 
// in the code below. It must be in the project's "data" folder.
//
// id,species,name
// 0,Capra hircus,Goat
// 1,Panthera pardus,Leopard
// 2,Equus zebra,Zebra

import processing.serial.*;
Serial myPort;
Table table;
String val;
float[] vis =new float[10];

void setup() {
  size(1500,580);
  println(Serial.list());
  // change the number below to match your port:
  vis[0]=10.0;
  vis[1]=30.0;
  vis[3]=20.0;
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  println(myPort);
  background(255, 182, 193);
  PFont myFont;
  //size(200, 200);
    myFont = createFont("ComicSans", 50);
  textFont(myFont);
  text("Bus Buddy Bus Capacities", 500, 50);
  
}
void draw()
{  
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n');
  println(val);// read it and store it in val
  } 

 
  if(val==null)
  {
   vis[2]=0;
  }
  else{
   vis[2]=float(val);

  //fill(206);
  //stroke(206);
//rect(10, 2*120+5, 1100, 100);
    drawBarChart(vis);
  }

   //print it out in the console
}
void drawBarChart(float data[]){
  int b = 100;
color c = color(255, 182, 193);
color d = color(135, 206, 235);
  fill(255);
  stroke(255);
   for (int i = 0; i < data.length; i++) {
      float w = map(data[i], 0, max(data), 0, width - 10);
      if(i==2){
          fill(c);
    stroke(c);
      rect(w+10, 2*120+5+b, 200, 100);
      }
      //color c = color(255, 182, 193);

  fill(255);
      stroke(255);
      if(i!=2){
      rect(10, (i * 120) + 5+b, w, 100);
      //textFont(myFont, 30);
      //text("Bus " + i, 500, (i * 120) + 30);
      }else{
        fill(d);
    stroke(d);
      rect(10, (i * 120) + 5+b, w, 100);
      }
     }
   }