#include <stdint.h>
#include <stdbool.h>

#ifndef _USER_INTERFACE_H_
#define _USER_INTERFACE_H_

typedef enum {
    SYSTEM_PARTITION_BOOTLOADER,
    SYSTEM_PARTITION_OTA_1,
    SYSTEM_PARTITION_OTA_2,
    SYSTEM_PARTITION_RF_CAL,
    SYSTEM_PARTITION_PHY_DATA,
    SYSTEM_PARTITION_SYSTEM_PARAMETER,
    SYSTEM_PARTITION_CUSTOMER_BEGIN = 100,
} partition_type_t;

typedef struct {
    partition_type_t type;    /* the partition type */
    uint32_t addr;            /* the partition address */
    uint32_t size;            /* the partition size */
} partition_item_t;

bool system_partition_table_regist(
        const partition_item_t* partition_table,
        uint32_t partition_num,
        uint32_t map
);

#endif