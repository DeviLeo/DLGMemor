//
//  DLGMemUIViewDelegate.h
//  memui
//
//  Created by Liu Junqi on 4/23/18.
//  Copyright © 2018 DeviLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DLGMemUIView;

typedef enum : NSUInteger {
    DLGMemValueTypeUnsignedByte,
    DLGMemValueTypeSignedByte,
    DLGMemValueTypeUnsignedShort,
    DLGMemValueTypeSignedShort,
    DLGMemValueTypeUnsignedInt,
    DLGMemValueTypeSignedInt,
    DLGMemValueTypeUnsignedLong,
    DLGMemValueTypeSignedLong,
    DLGMemValueTypeFloat,
    DLGMemValueTypeDouble,
} DLGMemValueType;

typedef enum : NSUInteger {
    DLGMemComparisonLT, // <
    DLGMemComparisonLE, // <=
    DLGMemComparisonEQ, // =
    DLGMemComparisonGE, // >=
    DLGMemComparisonGT, // >
} DLGMemComparison;

@protocol DLGMemUIViewDelegate <NSObject>

@optional
- (void)DLGMemUILaunched:(DLGMemUIView *)view;
- (void)DLGMemUISearchValue:(NSString *)value type:(DLGMemValueType)type comparison:(DLGMemComparison)comparison;
- (void)DLGMemUIModifyValue:(NSString *)value address:(NSString *)address type:(DLGMemValueType)type;
- (void)DLGMemUIRefresh;
- (void)DLGMemUIReset;
- (NSString *)DLGMemUIMemory:(NSString *)address size:(NSString *)size;

@end
