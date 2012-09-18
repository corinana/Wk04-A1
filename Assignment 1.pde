/**
 * Multivalue Read
 * 
 * Read comma separated value from the serial port 
   and change the color of rectangles.
   
 */


import processing.serial.*;  // Import Serial class library
Serial myPort;  // Create object from Serial class



float val1 = 0;
float val2 = 0;

void setup() 
{
  size(400, 400);
 
  //for Windows
  //String portName = "COM97"; //change this port the same name as Arduino->Tool->Serial Port
  //for Mac OSX
  String portName = Serial.list()[0]; //the first port
   
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); // buffer incoming characters until line feed.
}

//serialEvent function is called when incoming character reaches '\n'
void serialEvent(Serial p){
  String s = "";        // string value received.
  String[] values;      // splitted string values.
  
  if(p.available() > 0){  // check number of characters in the serial buffer 
    s = p.readString();   // read string.
    if(s != null){ 
      println("received:"+s);
      
      values = s.split(",");     // separate values with ',' characters.
      println(values);           
      
      val1 = float(values[0]);
      val2 = float(values[1]);
    }
  }
}

void draw()
{
  background(255);             // Set background to white
 int w1 = 170;
int w2 = 90;
int w3 = 60;

int h1 =  50;
int h2 =  50;
int h3 =  240;
 
fill(val1);                   // change fill color
rect(120,80, w1, h1);

fill(val1); 
rect(180,180, w2, h2);

fill(val1); 
rect(120,80, w3, h3);
}


