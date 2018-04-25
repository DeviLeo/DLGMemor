//
//  DLGMemEntry.m
//  memui
//
//  Created by Liu Junqi on 4/23/18.
//  Copyright © 2018 DeviLeo. All rights reserved.
//

#import "DLGMemEntry.h"
#import "DLGMem.h"

@implementation DLGMemEntry

static void __attribute__((constructor)) entry() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[[DLGMem alloc] init] launchDLGMem];
    });
}

@end
