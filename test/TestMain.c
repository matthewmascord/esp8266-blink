#include "main.h"
#include "unity.h"
#include "Mockgpio.h"
#include "Mockets_sys.h"
#include "Mockosapi.h"
#include "Mockgdbstub.h"
#include <stdint.h>

const uint32_t noPinsMask = 0;
const uint32_t pinMask = 4;
const uint32_t otherPinMask = 8;

void setUp(void)
{
    gpio_init_Ignore();
    gpio_output_set_Ignore();
    uart_div_modify_Ignore();
    os_timer_setfn_Ignore();
    os_timer_arm_Ignore();
    gdbstub_init_Ignore();
}

void tearDown(void)
{
}

void test_UserInit_ShouldEnableTheUart(void)
{
    uart_div_modify_Expect(0, 694);

    user_init();
}

void test_UserInit_ShouldInitializeTheGpio(void)
{
    gpio_init_Expect();

    user_init();
}

void test_UserInit_ShouldEnableTheCorrectPin(void)
{
    gpio_output_set_Expect(0, 0, pinMask, 0);

    user_init();
}

void test_UserInit_ShouldInitializeTheTimerCorrectly(void)
{
    os_timer_setfn_Expect(&timer, (os_timer_func_t *)DoBlinkyStuff, NULL);

    user_init();
}

void test_UserInit_ShouldSetTheTimer(void)
{
    os_timer_arm_Expect(&timer, 250, true);

    user_init();
}

void test_DoBlinkyStuff_ShouldSetTheOutputIfCleared(void)
{
    GPIO_REG_READ_ExpectAndReturn(GPIO_OUT_ADDRESS, otherPinMask);
    gpio_output_set_Expect(pinMask, 0, 0, 0);

    DoBlinkyStuff();
}

void test_DoBlinkyStuff_ShouldSetTheOutputIfNoOutputsAreSet(void)
{
    GPIO_REG_READ_ExpectAndReturn(GPIO_OUT_ADDRESS, noPinsMask);
    gpio_output_set_Expect(pinMask, 0, 0, 0);

    DoBlinkyStuff();
}

void test_DoBlinkyStuff_ShouldClearTheOutputIfSet(void)
{
    GPIO_REG_READ_ExpectAndReturn(GPIO_OUT_ADDRESS, pinMask);
    gpio_output_set_Expect(0, pinMask, 0, 0);

    DoBlinkyStuff();
}
