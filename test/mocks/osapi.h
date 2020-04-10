#include <stdint.h>
#include <stdbool.h>

#ifndef _OSAPI_H_
#define _OSAPI_H_
typedef void os_timer_func_t(void *timer_arg);
typedef struct _os_timer_t_ {
    struct _os_timer_t_  *timer_next;
    uint32_t              timer_expire;
    uint32_t              timer_period;
    os_timer_func_t       *timer_func;
    void                 *timer_arg;
} os_timer_t;
void os_timer_arm(os_timer_t *ptimer, uint32_t time, bool repeat_flag);
void os_timer_disarm(os_timer_t *ptimer);
void os_timer_setfn(os_timer_t *ptimer, os_timer_func_t *pfunction, void *parg);
#endif