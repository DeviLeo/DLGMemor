//
//  mem_utils.c
//  memui
//
//  Created by Liu Junqi on 4/24/18.
//  Copyright © 2018 DeviLeo. All rights reserved.
//

#include "mem_utils.h"

void *search_uint8(const void *b, size_t len, uint8_t v, int comparison) {
    size_t vlen = sizeof(uint8_t);
    char *sp = (char *)b;
    char *eos = sp + len - vlen;
    
    if(!(b && len && v)) return NULL;
    
    while (sp <= eos) {
        uint8_t v1 = *(uint8_t *)(sp);
        switch (comparison) {
            case SearchResultComparisonEQ: if (v1 == v) return sp; break;
            case SearchResultComparisonLT: if (v1 < v) return sp; break;
            case SearchResultComparisonLE: if (v1 <= v) return sp; break;
            case SearchResultComparisonGE: if (v1 >= v) return sp; break;
            case SearchResultComparisonGT: if (v1 > v) return sp; break;
        }
        sp++;
    }
    
    return NULL;
}

void *search_int8(const void *b, size_t len, int8_t v, int comparison) {
    size_t vlen = sizeof(int8_t);
    char *sp = (char *)b;
    char *eos = sp + len - vlen;
    
    if(!(b && len && v)) return NULL;
    
    while (sp <= eos) {
        int8_t v1 = *(int8_t *)(sp);
        switch (comparison) {
            case SearchResultComparisonEQ: if (v1 == v) return sp; break;
            case SearchResultComparisonLT: if (v1 < v) return sp; break;
            case SearchResultComparisonLE: if (v1 <= v) return sp; break;
            case SearchResultComparisonGE: if (v1 >= v) return sp; break;
            case SearchResultComparisonGT: if (v1 > v) return sp; break;
        }
        sp++;
    }
    
    return NULL;
}

void *search_uint16(const void *b, size_t len, uint16_t v, int comparison) {
    size_t vlen = sizeof(uint16_t);
    char *sp = (char *)b;
    char *eos = sp + len - vlen;
    
    if(!(b && len && v)) return NULL;
    
    while (sp <= eos) {
        uint16_t v1 = *(uint16_t *)(sp);
        switch (comparison) {
            case SearchResultComparisonEQ: if (v1 == v) return sp; break;
            case SearchResultComparisonLT: if (v1 < v) return sp; break;
            case SearchResultComparisonLE: if (v1 <= v) return sp; break;
            case SearchResultComparisonGE: if (v1 >= v) return sp; break;
            case SearchResultComparisonGT: if (v1 > v) return sp; break;
        }
        sp++;
    }
    
    return NULL;
}

void *search_int16(const void *b, size_t len, int16_t v, int comparison) {
    size_t vlen = sizeof(int16_t);
    char *sp = (char *)b;
    char *eos   = sp + len - vlen;
    
    if(!(b && len && v)) return NULL;
    
    while (sp <= eos) {
        int16_t v1 = *(int16_t *)(sp);
        switch (comparison) {
            case SearchResultComparisonEQ: if (v1 == v) return sp; break;
            case SearchResultComparisonLT: if (v1 < v) return sp; break;
            case SearchResultComparisonLE: if (v1 <= v) return sp; break;
            case SearchResultComparisonGE: if (v1 >= v) return sp; break;
            case SearchResultComparisonGT: if (v1 > v) return sp; break;
        }
        sp++;
    }
    
    return NULL;
}

void *search_uint32(const void *b, size_t len, uint32_t v, int comparison) {
    size_t vlen = sizeof(uint32_t);
    char *sp = (char *)b;
    char *eos = sp + len - vlen;
    
    if(!(b && len && v)) return NULL;
    
    while (sp <= eos) {
        uint32_t v1 = *(uint32_t *)(sp);
        switch (comparison) {
            case SearchResultComparisonEQ: if (v1 == v) return sp; break;
            case SearchResultComparisonLT: if (v1 < v) return sp; break;
            case SearchResultComparisonLE: if (v1 <= v) return sp; break;
            case SearchResultComparisonGE: if (v1 >= v) return sp; break;
            case SearchResultComparisonGT: if (v1 > v) return sp; break;
        }
        sp++;
    }
    
    return NULL;
}

void *search_int32(const void *b, size_t len, int32_t v, int comparison) {
    size_t vlen = sizeof(int32_t);
    char *sp = (char *)b;
    char *eos   = sp + len - vlen;
    
    if(!(b && len)) return NULL;
    
    while (sp <= eos) {
        int32_t v1 = *(int32_t *)(sp);
        switch (comparison) {
            case SearchResultComparisonEQ: if (v1 == v) return sp; break;
            case SearchResultComparisonLT: if (v1 < v) return sp; break;
            case SearchResultComparisonLE: if (v1 <= v) return sp; break;
            case SearchResultComparisonGE: if (v1 >= v) return sp; break;
            case SearchResultComparisonGT: if (v1 > v) return sp; break;
        }
        sp++;
    }
    
    return NULL;
}

void *search_uint64(const void *b, size_t len, uint64_t v, int comparison) {
    size_t vlen = sizeof(uint64_t);
    char *sp = (char *)b;
    char *eos = sp + len - vlen;
    
    if(!(b && len && v)) return NULL;
    
    while (sp <= eos) {
        uint64_t v1 = *(uint64_t *)(sp);
        switch (comparison) {
            case SearchResultComparisonEQ: if (v1 == v) return sp; break;
            case SearchResultComparisonLT: if (v1 < v) return sp; break;
            case SearchResultComparisonLE: if (v1 <= v) return sp; break;
            case SearchResultComparisonGE: if (v1 >= v) return sp; break;
            case SearchResultComparisonGT: if (v1 > v) return sp; break;
        }
        sp++;
    }
    
    return NULL;
}

void *search_int64(const void *b, size_t len, int64_t v, int comparison) {
    size_t vlen = sizeof(int64_t);
    char *sp = (char *)b;
    char *eos   = sp + len - vlen;
    
    if(!(b && len && v)) return NULL;
    
    while (sp <= eos) {
        int64_t v1 = *(int64_t *)(sp);
        switch (comparison) {
            case SearchResultComparisonEQ: if (v1 == v) return sp; break;
            case SearchResultComparisonLT: if (v1 < v) return sp; break;
            case SearchResultComparisonLE: if (v1 <= v) return sp; break;
            case SearchResultComparisonGE: if (v1 >= v) return sp; break;
            case SearchResultComparisonGT: if (v1 > v) return sp; break;
        }
        sp++;
    }
    
    return NULL;
}

void *search_float(const void *b, size_t len, float v, int comparison) {
    size_t vlen = sizeof(float);
    char *sp = (char *)b;
    char *eos = sp + len - vlen;
    
    if(!(b && len && v)) return NULL;
    
    while (sp <= eos) {
        float v1 = *(float *)(sp);
        switch (comparison) {
            case SearchResultComparisonEQ: if (v1 == v) return sp; break;
            case SearchResultComparisonLT: if (v1 < v) return sp; break;
            case SearchResultComparisonLE: if (v1 <= v) return sp; break;
            case SearchResultComparisonGE: if (v1 >= v) return sp; break;
            case SearchResultComparisonGT: if (v1 > v) return sp; break;
        }
        sp++;
    }
    
    return NULL;
}

void *search_double(const void *b, size_t len, double v, int comparison) {
    size_t vlen = sizeof(double);
    char *sp = (char *)b;
    char *eos   = sp + len - vlen;
    
    if(!(b && len && v)) return NULL;
    
    while (sp <= eos) {
        double v1 = *(double *)(sp);
        switch (comparison) {
            case SearchResultComparisonEQ: if (v1 == v) return sp; break;
            case SearchResultComparisonLT: if (v1 < v) return sp; break;
            case SearchResultComparisonLE: if (v1 <= v) return sp; break;
            case SearchResultComparisonGE: if (v1 >= v) return sp; break;
            case SearchResultComparisonGT: if (v1 > v) return sp; break;
        }
        sp++;
    }
    
    return NULL;
}

void *search_mem_value(const void *b, size_t len, void *v, size_t vlen, int type, int comparison) {
    if (type == SearchResultValueTypeUInt8) {
        uint8_t vv = *(uint8_t *)(v);
        return search_uint8(b, len, vv, comparison);
    } else if (type == SearchResultValueTypeSInt8) {
        int8_t vv = *(int8_t *)(v);
        return search_int8(b, len, vv, comparison);
    } else if (type == SearchResultValueTypeUInt16) {
        uint16_t vv = *(uint16_t *)(v);
        return search_uint16(b, len, vv, comparison);
    } else if (type == SearchResultValueTypeSInt16) {
        int16_t vv = *(int16_t *)(v);
        return search_int16(b, len, vv, comparison);
    } else if (type == SearchResultValueTypeUInt32) {
        uint32_t vv = *(uint32_t *)(v);
        return search_uint32(b, len, vv, comparison);
    } else if (type == SearchResultValueTypeSInt32) {
        int32_t vv = *(int32_t *)(v);
        return search_int32(b, len, vv, comparison);
    } else if (type == SearchResultValueTypeUInt64) {
        uint64_t vv = *(uint64_t *)(v);
        return search_uint64(b, len, vv, comparison);
    } else if (type == SearchResultValueTypeSInt64) {
        int64_t vv = *(int64_t *)(v);
        return search_int64(b, len, vv, comparison);
    } else if (type == SearchResultValueTypeFloat) {
        float vv = *(float *)(v);
        return search_float(b, len, vv, comparison);
    } else if (type == SearchResultValueTypeDouble) {
        double vv = *(double *)(v);
        return search_double(b, len, vv, comparison);
    }
    
    return NULL;
}
