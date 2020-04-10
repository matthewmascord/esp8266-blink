#include <stdint.h>

#ifndef _GPIO_H_
#define _GPIO_H_
#define GPIO_OUT_ADDRESS (uint32_t) 0
void gpio_init(void);
void gpio_output_set(uint32_t set_mask,
                     uint32_t clear_mask,
                     uint32_t enable_mask,
                     uint32_t disable_mask);
uint32_t GPIO_REG_READ(uint32_t address);
#endif