#include "main.h"
#include <../gdbstub/gdbstub.h>
#include <stddef.h>
#include "gpio.h"
#include "os_type.h"

static const int pin = 2;
os_timer_t timer;

void DoBlinkyStuff()
{
    if (GPIO_REG_READ(GPIO_OUT_ADDRESS) & (1 << pin))
    {
        // set gpio low
        gpio_output_set(0, (1 << pin), 0, 0);
    }
    else
    {
        // set gpio high
        gpio_output_set((1 << pin), 0, 0, 0);
    }
}

void SetupTimer() {
    os_timer_setfn(&timer, (os_timer_func_t *)DoBlinkyStuff, NULL);
    os_timer_arm(&timer, 250, 1);
}

void EnablePins() {
    gpio_output_set(0, 0, (1 << pin), 0);
}

void ICACHE_FLASH_ATTR user_init()
{
    uart_div_modify(0, UART_CLK_FREQ / 115200);
    gdbstub_init();
    gpio_init();
    EnablePins();
    SetupTimer();
}
