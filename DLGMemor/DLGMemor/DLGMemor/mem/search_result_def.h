//
//  search_result_def.h
//  mem
//
//  Created by Liu Junqi on 3/27/18.
//  Copyright © 2018 DeviLeo. All rights reserved.
//

#ifndef search_result_def_h
#define search_result_def_h

#include <mach/mach.h>

#define SearchResultValueTypeUndef  0
#define SearchResultValueTypeUInt8  1
#define SearchResultValueTypeSInt8  2
#define SearchResultValueTypeUInt16 3
#define SearchResultValueTypeSInt16 4
#define SearchResultValueTypeUInt32 5
#define SearchResultValueTypeSInt32 6
#define SearchResultValueTypeUInt64 7
#define SearchResultValueTypeSInt64 8
#define SearchResultValueTypeFloat  9
#define SearchResultValueTypeDouble 10

#define SearchResultComparisonLT    -2
#define SearchResultComparisonLE    -1
#define SearchResultComparisonEQ     0
#define SearchResultComparisonGE     1
#define SearchResultComparisonGT     2

struct search_result {
    mach_vm_address_t address;
    void *value;
    int size;
    int type;
    int protection;
};
typedef struct search_result *search_result_t;

struct search_result_chain {
    search_result_t result;
    struct search_result_chain *next;
};
typedef struct search_result_chain *search_result_chain_t;

#endif /* search_result_def_h */
