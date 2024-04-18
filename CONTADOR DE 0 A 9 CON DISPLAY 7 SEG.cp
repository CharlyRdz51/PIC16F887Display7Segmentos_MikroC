#line 1 "C:/Users/master/Desktop/SSPPSE/practica2/CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c"
#line 9 "C:/Users/master/Desktop/SSPPSE/practica2/CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c"
unsigned char unidades;
unsigned char TABLA[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
void conteo();
void main()
{

 ANSEL=0x00;
 ANSELH=0x00;
 C1ON_bit=0;
 c2on_bit=0;
 TRISC=0x00;
 TRISB=0x01;
 PORTB=0x01;
 PORTC=0x00;

 while(1)
 {
 if(PORTB.F0==0)
 {
 conteo();
 }
 }
 }

 void conteo()
 {
 PORTC=TABLA[unidades];
 unidades++;
 delay_ms(500);
 if(unidades==10)
 {
 unidades=0;

 }
 }
