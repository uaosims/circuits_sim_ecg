
#include<TimerOne.h>
int canal;//Variable para la lectura del canal
int selector;//variable de lectura del puerto

void setup() {
Timer1.initialize(200);//frecuencia de muestreo 500 sps = 2 miliseegundos = 200 usegundos
Timer1.attachInterrupt(muestreo);// la interupción muestreo se efectua cada 200 usegundos 
Serial.begin(9600);// configuración del baudios 9600 bits por minutos en comunicacion serial 
pinMode(2, OUTPUT); // se configuran los pines que cambiaran de estado los multiplexores
pinMode(3, OUTPUT);// como salidas
pinMode(4, OUTPUT);
pinMode(5, OUTPUT);
pinMode(6, OUTPUT);
pinMode(7, OUTPUT);
pinMode(8, OUTPUT);
pinMode(9, OUTPUT);
}

void loop() {
   if(Serial.available() > 0) //Si se envia algun dato Serial.available() 
                             //sera mayor que uno y entrara al ciclo funciona
                             //como una bandera
 {
  int selector=Serial.read();//se lee lo que esta en llegando a rx por medio de
                             //Serial.read()
  switch (selector)          //se realiza un witch donde cambiara los extados de los
                             //multiplexores dependiendo lo presionado en la interfaz
  {
     case '1': //En este caso se activara la derivada 1 poniendo en alto y bajos las
               //entradas que cambian los multiplexores, los pines 8 y 9 modifican
               //el multiplexor de uso
          digitalWrite(2,HIGH);
          digitalWrite(3,LOW);
          digitalWrite(4,LOW);
          digitalWrite(5,LOW);
          digitalWrite(6,HIGH);
          digitalWrite(7,HIGH);
          digitalWrite(8,LOW);
          digitalWrite(9,HIGH);
            break;
          
     case '2': //DERIVADA II
          digitalWrite(2,LOW);
          digitalWrite(3,HIGH);
          digitalWrite(4,LOW);
          digitalWrite(5,LOW);
          digitalWrite(6,HIGH);
          digitalWrite(7,HIGH);
          digitalWrite(8,LOW);
          digitalWrite(9,HIGH);
       
            break;
           
    
     case '3': //DERIVADA III
          digitalWrite(2,LOW);
          digitalWrite(3,HIGH);
          digitalWrite(4,LOW);
          digitalWrite(5,HIGH);
          digitalWrite(6,LOW);
          digitalWrite(7,HIGH);
          digitalWrite(8,LOW);
          digitalWrite(9,HIGH);
         
            break;
            
     case '4': //DERIVADA aVR
          digitalWrite(2,LOW);
          digitalWrite(3,LOW);
          digitalWrite(4,LOW);
          digitalWrite(5,LOW);
          digitalWrite(6,LOW);
          digitalWrite(7,LOW);
          digitalWrite(8,LOW);
          digitalWrite(9,HIGH);         
            break;
          
     case '5': //DERIVADA aVL
          digitalWrite(2,HIGH);
          digitalWrite(3,LOW);
          digitalWrite(4,LOW);
          digitalWrite(5,HIGH);
          digitalWrite(6,LOW);
          digitalWrite(7,LOW);
          digitalWrite(8,LOW);
          digitalWrite(9,HIGH);          
            break;
           
     case '6': //DERIVADA aVF
          digitalWrite(2,LOW);
          digitalWrite(3,HIGH);
          digitalWrite(4,LOW);
          digitalWrite(5,LOW);
          digitalWrite(6,HIGH);
          digitalWrite(7,LOW);
          digitalWrite(8,LOW);
          digitalWrite(9,HIGH);
         
            break;
           
     case '7': //DERIVADA V1
          digitalWrite(2,HIGH);
          digitalWrite(3,HIGH);
          digitalWrite(4,LOW);
          digitalWrite(5,HIGH);
          digitalWrite(6,HIGH);
          digitalWrite(7,HIGH);
                    digitalWrite(8,LOW);
          digitalWrite(9,HIGH);
            break;
               
     case '8': //DERIVADA V2
          digitalWrite(2,LOW);
          digitalWrite(3,LOW);
          digitalWrite(4,HIGH);
          digitalWrite(5,HIGH);
          digitalWrite(6,HIGH);
          digitalWrite(7,HIGH);
                    digitalWrite(8,LOW);
          digitalWrite(9,HIGH);
            break;
          
     case '9': //DERIVADA V3
          digitalWrite(2,HIGH);
          digitalWrite(3,LOW);
          digitalWrite(4,HIGH);
          digitalWrite(5,HIGH);
          digitalWrite(6,HIGH);
          digitalWrite(7,HIGH);
          digitalWrite(8,LOW);
          digitalWrite(9,HIGH);
            break;
           
     case 'A': //DERIVADA V4
          digitalWrite(2,LOW);
          digitalWrite(3,HIGH);
          digitalWrite(4,HIGH);
          digitalWrite(5,HIGH);
          digitalWrite(6,HIGH);
          digitalWrite(7,HIGH);
          digitalWrite(8,LOW);
          digitalWrite(9,HIGH);
            break;
          
      case 'B': //DERIVADA V5
          digitalWrite(2,HIGH);
          digitalWrite(3,HIGH);
          digitalWrite(4,HIGH);
          digitalWrite(5,LOW);
          digitalWrite(6,HIGH);
          digitalWrite(7,HIGH);
          digitalWrite(8,HIGH);
          digitalWrite(9,LOW);
            break;
           
      case 'C': //DERIVADA V6
          digitalWrite(2,HIGH);
          digitalWrite(3,HIGH);
          digitalWrite(4,HIGH);
          digitalWrite(5,LOW);
          digitalWrite(6,LOW);
          digitalWrite(7,HIGH);
           digitalWrite(8,HIGH);
          digitalWrite(9,LOW);        
            break;
           
  }
 }
}

void muestreo(void)// funcion de muestreo
{
canal=analogRead(0); // lea el pin 0 analogo donde se encontrara la entrada de ECG
delayMicroseconds(1);// pequeño tiempo para estabilizarse
Serial.println(canal);//envie serialmente el dato de ECG
}
