#include "main.h"
#ifdef GDB_DEBUG
#include "gdbstub.h"
#endif
#include <stddef.h>
#include "gpio.h"
#include "os_type.h"
#include "user_interface.h"

#define SPI_FLASH_SIZE_MAP 4
#define SYSTEM_PARTITION_OTA_SIZE							0x6A000
#define SYSTEM_PARTITION_OTA_2_ADDR							0x81000
#define SYSTEM_PARTITION_RF_CAL_ADDR						0x3fb000
#define SYSTEM_PARTITION_PHY_DATA_ADDR						0x3fc000
#define SYSTEM_PARTITION_SYSTEM_PARAMETER_ADDR				0x3fd000
#define SYSTEM_PARTITION_CUSTOMER_PRIV_PARAM_ADDR           0x7c000
#define SYSTEM_PARTITION_CUSTOMER_PRIV_PARAM                SYSTEM_PARTITION_CUSTOMER_BEGIN

static const partition_item_t at_partition_table[] = {
        { SYSTEM_PARTITION_BOOTLOADER, 						0x0, 												0x1000},
        { SYSTEM_PARTITION_OTA_1,   						0x1000, 											SYSTEM_PARTITION_OTA_SIZE},
        { SYSTEM_PARTITION_OTA_2,   						SYSTEM_PARTITION_OTA_2_ADDR, 						SYSTEM_PARTITION_OTA_SIZE},
        { SYSTEM_PARTITION_RF_CAL,  						SYSTEM_PARTITION_RF_CAL_ADDR, 						0x1000},
        { SYSTEM_PARTITION_PHY_DATA, 						SYSTEM_PARTITION_PHY_DATA_ADDR, 					0x1000},
        { SYSTEM_PARTITION_SYSTEM_PARAMETER, 				SYSTEM_PARTITION_SYSTEM_PARAMETER_ADDR, 			0x3000},
        { SYSTEM_PARTITION_CUSTOMER_PRIV_PARAM,             SYSTEM_PARTITION_CUSTOMER_PRIV_PARAM_ADDR,          0x1000},
};

void ICACHE_FLASH_ATTR user_pre_init(void)
{
    if(!system_partition_table_regist(at_partition_table, sizeof(at_partition_table)/sizeof(at_partition_table[0]),SPI_FLASH_SIZE_MAP)) {
        os_printf("system_partition_table_regist fail\r\n");
        while(1);
    }
}

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

void ICACHE_FLASH_ATTR user_init(void)
{
    uart_div_modify(0, UART_CLK_FREQ / 115200);
#ifdef GDB_DEBUG
    gdbstub_init();
#endif
    gpio_init();
    EnablePins();
    SetupTimer();
}
