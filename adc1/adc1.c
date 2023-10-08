unsigned int temp_res;

void main() {
  ANSEL  = 0x04;              // Configure AN2 pin as analog
  ANSELH = 0;                 // Configure other AN pins as digital I/O
  C1ON_bit = 0;               // Disable comparators
  C2ON_bit = 0;

  TRISA  = 0xFF;              // PORTA is input
  TRISC  = 0;                 // PORTC is output
  TRISD  = 0;                 // PORTB is output

  do {
    temp_res = ADC_Read(2);   // Get 10-bit results of AD conversion
    PORTC = temp_res;         // Send lower 8 bits to PORTB
    PORTD = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
  } while(1);
}
