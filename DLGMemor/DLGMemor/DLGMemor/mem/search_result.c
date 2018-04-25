//
//  search_result.c
//  mem
//
//  Created by Liu Junqi on 3/27/18.
//  Copyright © 2018 DeviLeo. All rights reserved.
//

#include "search_result.h"

void *value_of_type(const char *value_str, int type, int *value_size) {
    int size = size_of_type(type);
    if (size == 0) return NULL;
    void *v = malloc(size);
    if (type == SearchResultValueTypeFloat || type == SearchResultValueTypeDouble) {
        double value = atof(value_str);
        if (type == SearchResultValueTypeFloat) {
            float vv = (float)value;
            memcpy(v, &vv, size);
        } else {
            memcpy(v, &value, size);
        }
    } else {
        uint64_t value = atoll(value_str);
        if (type == SearchResultValueTypeUInt8) {
            uint8_t vv = (uint8_t)value;
            memcpy(v, &vv, size);
        } else if (type == SearchResultValueTypeSInt8) {
            int8_t vv = (int8_t)value;
            memcpy(v, &vv, size);
        } else if (type == SearchResultValueTypeUInt16) {
            uint16_t vv = (uint16_t)value;
            memcpy(v, &vv, size);
        } else if (type == SearchResultValueTypeSInt16) {
            int16_t vv = (int16_t)value;
            memcpy(v, &vv, size);
        } else if (type == SearchResultValueTypeUInt32) {
            uint32_t vv = (uint32_t)value;
            memcpy(v, &vv, size);
        } else if (type == SearchResultValueTypeSInt32) {
            int32_t vv = (int32_t)value;
            memcpy(v, &vv, size);
        } else if (type == SearchResultValueTypeUInt64) {
            memcpy(v, &value, size);
        } else if (type == SearchResultValueTypeSInt64) {
            int64_t vv = (int64_t)value;
            memcpy(v, &vv, size);
        }
    }
    if (value_size) *value_size = size;
    return v;
}

int size_of_type(int type) {
    int size = 0;
    if (type == SearchResultValueTypeUInt8) {
        size = sizeof(uint8_t);
    } else if (type == SearchResultValueTypeSInt8) {
        size = sizeof(int8_t);
    } else if (type == SearchResultValueTypeUInt16) {
        size = sizeof(uint16_t);
    } else if (type == SearchResultValueTypeSInt16) {
        size = sizeof(int16_t);
    } else if (type == SearchResultValueTypeUInt32) {
        size = sizeof(uint32_t);
    } else if (type == SearchResultValueTypeSInt32) {
        size = sizeof(int32_t);
    } else if (type == SearchResultValueTypeUInt64) {
        size = sizeof(uint64_t);
    } else if (type == SearchResultValueTypeSInt64) {
        size = sizeof(int64_t);
    } else if (type == SearchResultValueTypeFloat) {
        size = sizeof(float);
    } else if (type == SearchResultValueTypeDouble) {
        size = sizeof(double);
    }
    return size;
}

int compare_value(void *value1, int size1, void *value2, int size2, int type) {
    int r = 0;
    if (type == SearchResultValueTypeUInt8) {
        uint8_t v1 = *(uint8_t *)(value1);
        uint8_t v2 = *(uint8_t *)(value2);
        r = (v1 == v2) ? 0 : (v1 < v2) ? -1 : 1;
    } else if (type == SearchResultValueTypeSInt8) {
        int8_t v1 = *(int8_t *)(value1);
        int8_t v2 = *(int8_t *)(value2);
        r = (v1 == v2) ? 0 : (v1 < v2) ? -1 : 1;
    } else if (type == SearchResultValueTypeUInt16) {
        uint16_t v1 = *(uint16_t *)(value1);
        uint16_t v2 = *(uint16_t *)(value2);
        r = (v1 == v2) ? 0 : (v1 < v2) ? -1 : 1;
    } else if (type == SearchResultValueTypeSInt16) {
        int16_t v1 = *(int16_t *)(value1);
        int16_t v2 = *(int16_t *)(value2);
        r = (v1 == v2) ? 0 : (v1 < v2) ? -1 : 1;
    } else if (type == SearchResultValueTypeUInt32) {
        uint32_t v1 = *(uint32_t *)(value1);
        uint32_t v2 = *(uint32_t *)(value2);
        r = (v1 == v2) ? 0 : (v1 < v2) ? -1 : 1;
    } else if (type == SearchResultValueTypeSInt32) {
        int32_t v1 = *(int32_t *)(value1);
        int32_t v2 = *(int32_t *)(value2);
        r = (v1 == v2) ? 0 : (v1 < v2) ? -1 : 1;
    } else if (type == SearchResultValueTypeUInt64) {
        uint64_t v1 = *(uint64_t *)(value1);
        uint64_t v2 = *(uint64_t *)(value2);
        r = (v1 == v2) ? 0 : (v1 < v2) ? -1 : 1;
    } else if (type == SearchResultValueTypeSInt64) {
        int64_t v1 = *(int64_t *)(value1);
        int64_t v2 = *(int64_t *)(value2);
        r = (v1 == v2) ? 0 : (v1 < v2) ? -1 : 1;
    } else if (type == SearchResultValueTypeFloat) {
        float v1 = *(float *)(value1);
        float v2 = *(float *)(value2);
        r = (v1 == v2) ? 0 : (v1 < v2) ? -1 : 1;
    } else if (type == SearchResultValueTypeDouble) {
        double v1 = *(double *)(value1);
        double v2 = *(double *)(value2);
        r = (v1 == v2) ? 0 : (v1 < v2) ? -1 : 1;
    } else {
        if (size1 < size2) r = -1;
        else if (size1 > size2) r = 1;
        else {
            char *v1 = (char *)(value1);
            char *v2 = (char *)(value2);
            for (int i = 0; i < size1; ++i) {
                if (v1 == v2) continue;
                else {
                    if (v1 < v2) r = -1;
                    else r = 1;
                    break;
                }
            }
        }
    }
    return r;
}

void print_chain(search_result_chain_t chain) {
    printf("%llX", chain->result->address);
    
    printf(" %c%c%c ",
           (chain->result->protection & VM_PROT_READ) ? 'r' : '-',
           (chain->result->protection & VM_PROT_WRITE) ? 'w' : '-',
           (chain->result->protection & VM_PROT_EXECUTE) ? 'x' : '-'
           );
    
    int type = chain->result->type;
    if (type == SearchResultValueTypeUInt8) {
        uint8_t v = *(uint8_t *)(chain->result->value);
        printf("%u", v);
    } else if (type == SearchResultValueTypeSInt8) {
        int8_t v = *(int8_t *)(chain->result->value);
        printf("%d", v);
    } else if (type == SearchResultValueTypeUInt16) {
        uint16_t v = *(uint16_t *)(chain->result->value);
        printf("%u", v);
    } else if (type == SearchResultValueTypeSInt16) {
        int16_t v = *(int16_t *)(chain->result->value);
        printf("%d", v);
    } else if (type == SearchResultValueTypeUInt32) {
        uint32_t v = *(uint32_t *)(chain->result->value);
        printf("%u", v);
    } else if (type == SearchResultValueTypeSInt32) {
        int32_t v = *(int32_t *)(chain->result->value);
        printf("%d", v);
    } else if (type == SearchResultValueTypeUInt64) {
        uint64_t v = *(uint64_t *)(chain->result->value);
        printf("%llu", v);
    } else if (type == SearchResultValueTypeSInt64) {
        int64_t v = *(int64_t *)(chain->result->value);
        printf("%lld", v);
    } else if (type == SearchResultValueTypeFloat) {
        float v = *(float *)(chain->result->value);
        printf("%f", v);
    } else if (type == SearchResultValueTypeDouble) {
        double v = *(double *)(chain->result->value);
        printf("%f", v);
    } else {
        char *v = (char *)(chain->result->value);
        for (int i = 0; i < chain->result->size; ++i) {
            printf("%02X ", v[i]);
        }
    }
    printf("\n");
}

search_result_chain_t create_search_result_chain(mach_vm_address_t address, void *value, int size, int type, int protection) {
    search_result_t result = malloc(sizeof(struct search_result));
    result->address = address;
    result->value = malloc(size);
    memcpy(result->value, value, size);
    result->size = size;
    result->type = type;
    result->protection = protection;
    search_result_chain_t chain = malloc(sizeof(struct search_result_chain));
    chain->result = result;
    chain->next = NULL;
    return chain;
}

void destroy_search_result_chain(search_result_chain_t chain) {
    if (chain == NULL) return;
    chain->next = NULL;
    if (chain->result) {
        if (chain->result->value) {
            free(chain->result->value);
        }
        free(chain->result);
    }
    free(chain);
}

void destroy_all_search_result_chain(search_result_chain_t chain) {
    search_result_chain_t next = NULL;
    while (chain) {
        next = chain->next;
        destroy_search_result_chain(chain);
        chain = next;
    }
}

void show_search_result_chain(search_result_chain_t chain) {
    int count = 0;
    while (chain) {
        if (chain->result) {
            ++count;
            printf("[%d]", count);
            print_chain(chain);
        }
        chain = chain->next;
    }
}
