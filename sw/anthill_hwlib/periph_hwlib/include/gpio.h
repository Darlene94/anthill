#include "board.h"

#define GPIO_DIRECTION 0x00
#define GPIO_SET 0x04
#define GPIO_RESET 0x08
#define GPIO_READ 0x10

uint8_t gpio_read();
uint8_t gpio_read_direction();

void gpio_set(uint8_t state);
void gpio_reset(uint8_t state);
void gpio_set_direction(uint8_t state);