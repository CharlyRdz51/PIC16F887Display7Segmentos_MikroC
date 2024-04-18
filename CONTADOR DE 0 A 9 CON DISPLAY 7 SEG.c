/*SSPPSE
Ing. Jose Jesus Ramos Guillen
Aguilar Rodriguez Carlos AdolfO
215860049
CONTADOR DE 0 a 9 con DISPLAY DE 7 SEGMENTOS
9 de septiembre del 2016
*/

unsigned char unidades;
unsigned char TABLA[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
void conteo();
void main()          // inicio de programa
{

   ANSEL=0x00; // Se desactivan los puertos analogos
   ANSELH=0x00;
   C1ON_bit=0; // Desactivamos comparadores ADC
   c2on_bit=0;
   TRISC=0x00; // Configuramos puerto C como salida
   TRISB=0x01; // Configuramos bit 0 del puerto B como Entrada
   PORTB=0x01; // Valor inicial de 1 en el bit 0 del puerto B
   PORTC=0x00; // Todos los bits del puerto C inician en estado bajo

   while(1)  // ciclo infinito para que se ejecute constantemente el codigo
   {
      if(PORTB.F0==0) // si el bit o del puerto B es 0 entonces se ejecuta la funcion conteo
      {
          conteo();
                         }
                          }
                           }
                 
 void conteo()
      {
        PORTC=TABLA[unidades]; // aqui se depositan los valores que se mostraran en el display
        unidades++; // incremento en uno a unidades
        delay_ms(500);   // retardo de 1/2 segundo
        if(unidades==10) // si unidades es igual a 10 entonces sera puesto a 0
       {
        unidades=0; // se pone a cero para iniciar de nuevo el conteo
       
                          }
                           }