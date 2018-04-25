//
//  mem.h
//  mem
//
//  Created by Liu Junqi on 3/23/18.
//  Copyright © 2018 DeviLeo. All rights reserved.
//

#ifndef mem_h
#define mem_h

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <mach/mach.h>
#include <sys/sysctl.h>
#include <sys/errno.h>
#include <dlfcn.h>
#include <TargetConditionals.h>
#include "search_result.h"

void all_processes(int uid);
mach_port_t get_task(int pid);
vm_map_offset_t get_base_address(mach_port_t task);
void read_mem(mach_port_t task);
void *read_range_mem(mach_port_t task, mach_vm_address_t address, int forward, int backward, mach_vm_address_t *ret_address, mach_vm_size_t *ret_data_size);
int write_mem(mach_port_t task, mach_vm_address_t address, void *value, int size);
void print_mem(void *data, mach_vm_size_t data_size);

void review_mem_in_chain(mach_port_t task, search_result_chain_t chain);
search_result_chain_t search_mem(mach_port_t task, void *value, int size, int type, int comparison, search_result_chain_t chain, int *length);

#endif /* mem_h */
