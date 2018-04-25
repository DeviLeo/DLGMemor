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
    [[[DLGMem alloc] init] launchDLGMem];
}

@end
