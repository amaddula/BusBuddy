//Initialize Sensor Pins
const int IRsensor = 3;//back sensor
const int MotionSensor = 2;//front sensor
int numPeople = 0;//Number of People Currently in bus

    int PrevEntering = 0;
    int PrevLeaving = 0;
void setup()
{
    pinMode(MotionSensor, INPUT); //set button as an INPUT device
    pinMode(IRsensor, INPUT);

    
   
}
void loop()
{
    int Entering = frontend();
    int Leaving = backend();

    
    
    Serial.begin(9600);    
    
    
    if((Entering == 1) && (PrevEntering == 0)){
      numPeople++;
    } //Only update when changes from 0 to 1 not stays at 1
    
    
    if((Leaving == 1) && (PrevLeaving == 0)){
      numPeople--;
      
    }//Only update when changes from 0 to 1 not stays at 1
    
    if(numPeople<0){numPeople=0;}
    Serial.println(numPeople);   
    Serial.println("\n");
    delay(200);
    
    
    PrevEntering = Entering;
    PrevLeaving = Leaving;

}


int frontend(){

  int MotionValues = digitalRead(MotionSensor);//Current Value of the IR sensor
  return MotionValues;
  
}//Represents the front end of the bus


int backend(){
  
  int IRvalues = digitalRead(IRsensor);
  return IRvalues;

}//Represents the back end of the bus
