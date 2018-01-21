#include "gpio.h"
#include <stdbool.h>

uint8_t gpio_read() {
  return *((volatile uint8_t *)(BASE_GPIO + GPIO_READ));
}

uint8_t gpio_read_direction() {
  return *((volatile uint8_t *)(BASE_GPIO + GPIO_DIRECTION));
}

void gpio_set(uint8_t state) {
  *(volatile uint8_t *) (BASE_GPIO + GPIO_SET) = state;
}

void gpio_reset(uint8_t state) {
  *(volatile uint8_t *) (BASE_GPIO + GPIO_RESET) = state;
}

void gpio_set_direction(uint8_t state) {
  *(volatile uint8_t *) (BASE_GPIO + GPIO_DIRECTION) = state;
}