#line 1 "C:/Users/Elnino/Desktop/Mikroiþlemci/örnekler/adc1/adc1.c"
unsigned int temp_res;

void main() {
 ANSEL = 0x04;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;

 TRISA = 0xFF;
 TRISC = 0;
 TRISD = 0;

 do {
 temp_res = ADC_Read(2);
 PORTC = temp_res;
 PORTD = temp_res >> 8;
 } while(1);
}
