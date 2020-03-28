#include <../gdbstub/gdbstub.h>
#include "ets_sys.h"
#include "osapi.h"
#include "gpio.h"
#include "os_type.h"

// ESP-12 modules have LED on GPIO2. Change to another GPIO
// for other boards.
static const int pin = 2;
static os_timer_t some_timer;

void some_timerfunc(void *arg)
{
    static int my_var = 0;

    //Do blinky stuff
    if (GPIO_REG_READ(GPIO_OUT_ADDRESS) & (1 << pin))
    {
        my_var++;
        // set gpio low
        gpio_output_set(0, (1 << pin), 0, 0);
    }
    else
    {
        // set gpio high
        gpio_output_set((1 << pin), 0, 0, 0);
    }

}

void ICACHE_FLASH_ATTR user_init()
{
    uart_div_modify(0, UART_CLK_FREQ / 115200);
    gdbstub_init();

    // init gpio subsytem
    gpio_init();

    // configure UART TXD to be GPIO1, set as output
    // PIN_FUNC_SELECT(PERIPHS_IO_MUX_U0TXD_U, FUNC_U0TXD);
    gpio_output_set(0, 0, (1 << pin), 0);

    // setup timer (500ms, repeating)
    os_timer_setfn(&some_timer, (os_timer_func_t *)some_timerfunc, NULL);
    os_timer_arm(&some_timer, 250, 1);

}
