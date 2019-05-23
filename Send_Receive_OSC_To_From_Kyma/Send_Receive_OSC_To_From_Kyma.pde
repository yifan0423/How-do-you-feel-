// REMEMBER TO MANUALLY SET IP ADDRESS FOR PACARANA!
float x = 0 ;
float y = 450 ;
float z = 0 ;
int mode = 1;
boolean rain = false;
int count = 300;
float []rainx = new float[count]; // 200
float []rainy = new float[count];    //-50
float []speedx = new float[count];     //1
float []speedy = new float[count];   //20
float []rainsize = new float[count];   //8
PImage img;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress kymaAddress, maxAddress, myReceiveAddress;
OSC_received osc_received;

void setup() {
  img = loadImage("TP_Pic2.jpg");
  size(1920, 1080, P3D);
  for (int i = 0; i< count; i++) {    // for loop
    rainx [i] = random(width);
    rainy [i] = random(-1200, -50);
    speedx [i] = random(0, 2.0);
    speedy [i] = random(25, 50);   
    rainsize [i] = random(5, 10);
  }

  frameRate(60);

  /* start oscP5, listening for incoming messages at port 8000 */
  oscP5 = new OscP5(this, 8000);
  kymaAddress = new NetAddress("169.254.171.68", 8000); // NEED TO MANUALLY CHANGE THIS!
  osc_received = new OSC_received();
  osc_received.OSC_Setup();

  OscMessage connectMessage = new OscMessage("/osc/respond_to"); // initialize communication with Kyma
  connectMessage.add(8000);
  oscP5.send(connectMessage, kymaAddress); // send the message

  OscMessage fader1Message = new OscMessage("/fader1/x"); // initialize communication with Kyma parameter !osc_1_fader1
  fader1Message.add(0.1);
  oscP5.send(fader1Message, kymaAddress); // send the message

  OscMessage fader2Message = new OscMessage("/fader1/y"); // initialize communication with Kyma parameter !osc_fader2
  fader2Message.add(0.1);
  oscP5.send(fader2Message, kymaAddress); // send the message

  OscMessage randMessage = new OscMessage("/fader1/z"); // initialize communication with Kyma parameter !osc_rand
  randMessage.add(0.1);
  oscP5.send(randMessage, kymaAddress); // send the message

}

void draw() { 

  osc_received.oscPrint();// demonstrate that the patch is receiving OSC from Kyma
  if (mode == 1) {
    runMode1(    );
  }
}

void oscEvent(OscMessage theOscMessage) {/* incoming osc message are forwarded to the oscEvent method. */
  if (theOscMessage.checkAddrPattern("/fader1/x")==true) {
    x = map(theOscMessage.get(0).floatValue(), 0, 1, 0, width) ;// Map is scaling function 
  } 
  if (theOscMessage.checkAddrPattern("/fader1/y")==true) {
    y = map(theOscMessage.get(0).floatValue(), 1, 0, 0, height) ;// match the width and height by the defined screen size.
  } 
  if (theOscMessage.checkAddrPattern("/fader1/z")==true) {
    z = map(theOscMessage.get(0).floatValue(), 0, 1, 324, -500) ;// Z is need manually adjust to make it feel right.
  } 
}

void keyPressed(){
  for (int i = 0; i< count; i++) {    // for loop
      rainx [i] = random(width);
      rainy [i] = random(-1200, -50);
      speedx [i] = random(0, 2.0);
      speedy [i] = random(25, 50);
      rainsize [i] = random(5, 10);
    }
    rain = !rain;
}
