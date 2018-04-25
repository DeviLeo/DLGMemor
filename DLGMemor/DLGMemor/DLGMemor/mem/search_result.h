//
//  search_result.h
//  mem
//
//  Created by Liu Junqi on 3/27/18.
//  Copyright © 2018 DeviLeo. All rights reserved.
//

#ifndef search_result_h
#define search_result_h

#include <stdlib.h>
#include <stdio.h>
#include "search_result_def.h"

search_result_chain_t create_search_result_chain(mach_vm_address_t address, void *value, int size, int type, int protection);
void destroy_search_result_chain(search_result_chain_t chain);
void destroy_all_search_result_chain(search_result_chain_t chain);
void show_search_result_chain(search_result_chain_t chain);
int compare_value(void *value1, int size1, void *value2, int size2, int type);
int size_of_type(int type);
void *value_of_type(const char *value_str, int type, int *value_size);

#endif /* search_result_h */
