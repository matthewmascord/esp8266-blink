#include <stdint.h>

#ifndef _ETS_SYS_H_
#define _ETS_SYS_H_
#define ICACHE_FLASH_ATTR
#define UART_CLK_FREQ 80*1000000
void uart_div_modify(uint8_t uart_no, uint32_t DivLatchValue);
#endif