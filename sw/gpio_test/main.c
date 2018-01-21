#include <stdint.h>

#include "uart.h"
#include "urv_time.h"
#include "gpio.h"
#include "board.h"

void main() {  
  gpio_set_direction(0xF0);
  while(1) {
    uint8_t gpio_data = gpio_read();
    gpio_reset(gpio_data << 4);
  }
}
