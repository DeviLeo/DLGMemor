//
//  DLGMem.m
//  memui
//
//  Created by Liu Junqi on 4/23/18.
//  Copyright © 2018 DeviLeo. All rights reserved.
//

#import "DLGMem.h"
#import "DLGMemUI.h"
#import "DLGMemUIView.h"
#include "mem.h"

@interface DLGMem () <DLGMemUIViewDelegate> {
    mach_port_t g_task;
    search_result_chain_t g_chain;
    int g_type;
}

@property (nonatomic, weak) DLGMemUIView *memView;

@end

@implementation DLGMem

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initVars];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%@ dealloc", self);
}

- (void)initVars {
    g_task = mach_task_self();
    g_chain = NULL;
    g_type = SearchResultValueTypeUndef;
}

- (void)launchDLGMem {
    [DLGMemUI addDLGMemUIView:self];
}

- (void)searchMem:(const char *)value type:(int)type comparison:(int)comparison {
    int size = 0;
    void *v = value_of_type(value, type, &size);
    int found = 0;
    search_result_chain_t chain = g_chain;
    g_chain = search_mem(g_task, v, size, type, comparison, chain, &found);
    self.memView.chainCount = found;
    self.memView.chain = g_chain;
}

- (void)modifyMem:(mach_vm_address_t)address value:(const char *)value type:(int)type {
    int size = 0;
    void *v = value_of_type(value, type, &size);
    int ret = write_mem(g_task, address, v, size);
    if (ret == 1) { NSLog(@"Modified successfully."); }
    else { NSLog(@"Failed to modify. Error: %d", ret); }
}

#pragma mark - DLGMemUIViewDelegate
- (void)DLGMemUILaunched:(DLGMemUIView *)view {
    self.memView = view;
}

- (void)DLGMemUISearchValue:(NSString *)value type:(DLGMemValueType)type comparison:(DLGMemComparison)comparison {
    const char *v = [value UTF8String];
    int t = [self memTypeFromDLGMemValueType:type];
    int c = [self memComparisonFromDLGMemComparison:comparison];
    [self searchMem:v type:t comparison:c];
}

- (void)DLGMemUIModifyValue:(NSString *)value address:(NSString *)address type:(DLGMemValueType)type {
    mach_vm_address_t a = 0;
    NSScanner *scanner = [NSScanner scannerWithString:address];
    if (![scanner scanHexLongLong:&a]) return;
    const char *v = [value UTF8String];
    int t = [self memTypeFromDLGMemValueType:type];
    [self modifyMem:a value:v type:t];
}

- (void)DLGMemUIRefresh {
    review_mem_in_chain(g_task, g_chain);
    self.memView.chain = g_chain;
}

- (void)DLGMemUIReset {
    destroy_all_search_result_chain(g_chain);
    g_chain = NULL;
    self.memView.chainCount = 0;
    self.memView.chain = g_chain;
}

- (NSString *)DLGMemUIMemory:(NSString *)address size:(NSString *)size {
    mach_vm_address_t a = 0;
    NSScanner *scanner = [NSScanner scannerWithString:address];
    if (![scanner scanHexLongLong:&a]) return nil;
    int s = [size intValue];
    mach_vm_address_t addr = 0;
    mach_vm_size_t data_size = 0;
    void *data = read_range_mem(g_task, a, 0, s, &addr, &data_size);
    if (data == NULL || size == 0) return @"No memory.";
    
    NSMutableString *hex = [NSMutableString stringWithCapacity:data_size * 4];
    NSMutableString *chs = [NSMutableString stringWithCapacity:data_size];
    [hex appendFormat:@"%08llX ", addr];
    for (mach_vm_size_t i = 0; i < data_size; ++i) {
        if (i > 0 && i % 8 == 0) {
            [hex appendFormat:@"%@\n", chs];
            [hex appendFormat:@"%08llX ", addr + i];
            [chs setString:@""];
        }
        uint8_t v = *(((uint8_t *)data) + i);
        [hex appendFormat:@"%02X ", v];
        char c = v;
        if (c < 32 || c > 126) c = '.';
        [chs appendFormat:@"%c", c];
    }
    [hex appendFormat:@"%@\n", chs];
    return hex;
}

#pragma mark - Utils
- (int)memTypeFromDLGMemValueType:(DLGMemValueType)type {
    switch (type) {
        case DLGMemValueTypeUnsignedByte: return SearchResultValueTypeUInt8;
        case DLGMemValueTypeSignedByte: return SearchResultValueTypeSInt8;
        case DLGMemValueTypeUnsignedShort: return SearchResultValueTypeUInt16;
        case DLGMemValueTypeSignedShort: return SearchResultValueTypeSInt16;
        case DLGMemValueTypeUnsignedInt: return SearchResultValueTypeUInt32;
        case DLGMemValueTypeSignedInt: return SearchResultValueTypeSInt32;
        case DLGMemValueTypeUnsignedLong: return SearchResultValueTypeUInt64;
        case DLGMemValueTypeSignedLong: return SearchResultValueTypeSInt64;
        case DLGMemValueTypeFloat: return SearchResultValueTypeFloat;
        case DLGMemValueTypeDouble: return SearchResultValueTypeDouble;
        default: return SearchResultValueTypeUndef;
    }
}

- (int)memComparisonFromDLGMemComparison:(DLGMemComparison)comparison {
    switch (comparison) {
        case DLGMemComparisonLT: return SearchResultComparisonLT;
        case DLGMemComparisonLE: return SearchResultComparisonLE;
        case DLGMemComparisonEQ: return SearchResultComparisonEQ;
        case DLGMemComparisonGE: return SearchResultComparisonGE;
        case DLGMemComparisonGT: return SearchResultComparisonGT;
        default: return SearchResultComparisonEQ;
    }
}

@end
