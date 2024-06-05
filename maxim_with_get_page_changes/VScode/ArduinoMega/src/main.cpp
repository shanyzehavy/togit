#include <Arduino.h>
#include <HardwareSerial.h>
//#include "avr8-stub.h"
//#include "app_api.h"
#include "dpalg.h"
#include "dpuser.h"

DPUCHAR asd;

// the setup function runs once when you press reset or power the board
void setup() {
  //debug_init();

  pinMode(TCK_pin,  OUTPUT);
  pinMode(TDI_pin,  OUTPUT);
  pinMode(TMS_pin,  OUTPUT);
  pinMode(TRST_pin, OUTPUT);
  pinMode(TDO_pin,  INPUT);

  digitalWrite(TRST_pin, LOW);
  delay(100); 
  digitalWrite(TRST_pin, HIGH);

  Serial2.begin(38400);
}

// the loop function runs over and over again forever
void loop() {
  if(Serial2.available() > 0) {
    Action_code = Serial2.read();
    dp_top();
  }
}
