int responseFrom; 
float fader1, fader2, randomFromKyma, fader3;

class OSC_received {
  OSC_received() {
  }
  void OSC_Setup() {  
    oscP5.plug(this, "getResponseFrom", "/osc/response_from");
    oscP5.plug(this, "getFader1", "/fader1/x");
    oscP5.plug(this, "getFader2", "/fader1/y");  
    oscP5.plug(this, "getRandom", "/fader1/z");
  }

  void oscPrint() {
    println(responseFrom + "    " + fader1 + "     " + fader2 + "     " +  fader3);
  }
  void getResponseFrom (int fromOSC) {
    responseFrom= fromOSC;
  }
  void getFader1 (float fromOSC) {
    fader1 = fromOSC;
  }
  void getFader2 (float fromOSC) {
    fader2 = fromOSC;
  }
  void getFader3 (float fromOSC) {
    fader3 = fromOSC;
  }
}
