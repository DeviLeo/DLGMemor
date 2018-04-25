//
//  DLGMemUI.m
//  memui
//
//  Created by DeviLeo on 2017/1/14.
//  Copyright © 2017 Liu Junqi. All rights reserved.
//

#import "DLGMemUI.h"
#import "DLGMemUIView.h"

@implementation DLGMemUI

+ (void)addDLGMemUIView:(id<DLGMemUIViewDelegate>)delegate {
    UIApplication *application = [UIApplication sharedApplication];
    if (application) {
        [DLGMemUI addDLGMemUIViewToWindow:application.keyWindow withDelegate:delegate];
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [DLGMemUI addDLGMemUIView:delegate];
    });
}

+ (void)addDLGMemUIViewToWindow:(UIWindow *)window withDelegate:(id<DLGMemUIViewDelegate>)delegate{
    CGRect frame = CGRectMake(0, 100, DLG_DEBUG_CONSOLE_VIEW_SIZE, DLG_DEBUG_CONSOLE_VIEW_SIZE);
    DLGMemUIView *view = [DLGMemUIView instance];
    view.delegate = delegate;
    view.translatesAutoresizingMaskIntoConstraints = YES;
    view.autoresizingMask = UIViewAutoresizingNone;
    view.frame = frame;
    view.alpha = 0.5f;
    [window addSubview:view];
    [window setDLGMemUIView:view];
    
    NSArray *gestures = view.gestureRecognizers;
    if (gestures == nil || gestures.count == 0) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:window action:@selector(handleGesture:)];
        [view addGestureRecognizer:pan];
    }
    
    if ([delegate respondsToSelector:@selector(DLGMemUILaunched:)]) {
        [delegate DLGMemUILaunched:view];
    }
}

+ (void)removeDLGMemUIView {
    DLGMemUIView *view = [DLGMemUIView instance];
    if (view.expanded) [view doCollapse];
    NSArray *gestures = view.gestureRecognizers;
    for (UIGestureRecognizer *gesture in gestures) {
        [view removeGestureRecognizer:gesture];
    }
    [view removeFromSuperview];
}

@end
