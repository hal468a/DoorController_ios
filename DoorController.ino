#include <ESP8266WiFi.h>

const char* ssid = "Xiaomi_71CC";
const char* password = "11223344";

WiFiServer server(80);

void setup() {
  Serial.begin(9600);
  delay(10);

  pinMode(2, OUTPUT);
  digitalWrite(2, 0);

  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while(WiFi.status() != WL_CONNECTED){
    delay(500);
    Serial.print(".");
  }

  Serial.println();
  Serial.println("WiFi connected");

  server.begin();
  Serial.println("Sever started");

  Serial.println(WiFi.localIP());
}

void loop() {
  WiFiClient client = server.available();

  if(!client){
    return;
  }

  Serial.println("new client");
  while(!client.available()){
    delay(1);
  }

  String req = client.readStringUntil('\r');
  Serial.println(req);
  client.flush();

  int val;
  if(req.indexOf("/test/0") != -1){
    val = 0;
  } else if(req.indexOf("/test/1") != -1){
    val = 1;
  } else {
    Serial.println("invalid request");
    client.stop();
    return;
  }

  digitalWrite(2, val);
  client.flush();

  String  s = "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n<!DOCTYPE HTML>\r\n<html>\r\nDoor is running\r\n";
  s += (val)?"Up":"Down";
  s += "</html>\n";

  client.print(s);
  delay(1);
  Serial.println("Client disconnected");
}
