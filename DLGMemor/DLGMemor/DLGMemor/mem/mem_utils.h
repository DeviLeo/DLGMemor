//
//  mem_utils.h
//  memui
//
//  Created by Liu Junqi on 4/24/18.
//  Copyright © 2018 DeviLeo. All rights reserved.
//

#ifndef mem_utils_h
#define mem_utils_h

#include <stdio.h>
#include "search_result_def.h"

void *search_mem_value(const void *b, size_t len, void *v, size_t vlen, int type, int comparison);

#endif /* mem_utils_h */
