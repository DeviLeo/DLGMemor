//
//  UIWindow+DLGMemUI.m
//  memui
//
//  Created by Liu Junqi on 11/11/2016.
//  Copyright © 2016 Liu Junqi. All rights reserved.
//

#import "UIWindow+DLGMemUI.h"
#import <objc/runtime.h>
#import "DLGMemUIView.h"

@implementation UIWindow (DLGMemUI)

- (BOOL)dragging {
    NSNumber *num = objc_getAssociatedObject(self, @selector(dragging));
    BOOL d = [num boolValue];
    return d;
}
- (void)setDragging:(BOOL)dragging {
    NSNumber *num = [NSNumber numberWithBool:dragging];
    objc_setAssociatedObject(self, @selector(dragging), num, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGPoint)startPosition {
    NSValue *value = objc_getAssociatedObject(self, @selector(startPosition));
    CGPoint pt = [value CGPointValue];
    return pt;
}

- (void)setStartPosition:(CGPoint)pt {
    NSValue *value = [NSValue valueWithCGPoint:pt];
    objc_setAssociatedObject(self, @selector(startPosition), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (DLGMemUIView *)DLGMemUIView {
    DLGMemUIView *view = objc_getAssociatedObject(self, @selector(DLGMemUIView));
    return view;
}
- (void)setDLGMemUIView:(DLGMemUIView *)view{
    objc_setAssociatedObject(self, @selector(DLGMemUIView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)handleGesture:(UIPanGestureRecognizer *)sender {
    UIView *view = self;
    CGRect frame = [self DLGMemUIView].frame;
    
    CGPoint location = [sender locationInView:view];
    if (CGRectContainsPoint(frame, location) || self.dragging) {
        if (sender.state == UIGestureRecognizerStateBegan) {
            self.startPosition = [self DLGMemUIView].frame.origin;
            self.dragging = YES;
            [UIView animateWithDuration:0.2f
                                  delay:0.0f
                                options:UIViewAnimationOptionBeginFromCurrentState
                             animations:^{
                                 [self DLGMemUIView].alpha = 1.0f;
                             }
                             completion:^(BOOL finished) {
                                 [self DLGMemUIView].alpha = 1.0f;
                             }];
        } else if (sender.state == UIGestureRecognizerStateChanged) {
            CGPoint pt = [sender translationInView:view];
            frame.origin.x = self.startPosition.x + pt.x;
            frame.origin.y = self.startPosition.y + pt.y;
            
            if ([self DLGMemUIView].shouldNotBeDragged) {
                CGRect screenBounds = [UIScreen mainScreen].bounds;
                CGFloat screenWidth = CGRectGetWidth(screenBounds);
                CGFloat screenHeight = CGRectGetHeight(screenBounds);
                
                if (CGRectGetMinX(frame) < 0) frame.origin.x = 0;
                else if (CGRectGetMaxX(frame) > screenWidth) frame.origin.x = screenWidth - CGRectGetWidth(frame);
                if (CGRectGetMinY(frame) < 0) frame.origin.y = 0;
                else if (CGRectGetMaxY(frame) > screenHeight) frame.origin.y = screenHeight - CGRectGetHeight(frame);
            }
            
            [self DLGMemUIView].frame = frame;
        } else {
            self.dragging = NO;
            
            CGRect screenBounds = [UIScreen mainScreen].bounds;
            CGFloat screenWidth = CGRectGetWidth(screenBounds);
            CGFloat screenHeight = CGRectGetHeight(screenBounds);
            
            if ([self DLGMemUIView].shouldNotBeDragged) {
                CGRect screenBounds = [UIScreen mainScreen].bounds;
                CGFloat screenWidth = CGRectGetWidth(screenBounds);
                CGFloat screenHeight = CGRectGetHeight(screenBounds);
                
                if (CGRectGetMinX(frame) < 0) frame.origin.x = 0;
                else if (CGRectGetMaxX(frame) > screenWidth) frame.origin.x = screenWidth - CGRectGetWidth(frame);
                if (CGRectGetMinY(frame) < 0) frame.origin.y = 0;
                else if (CGRectGetMaxY(frame) > screenHeight) frame.origin.y = screenHeight - CGRectGetHeight(frame);
                
                
                [UIView animateWithDuration:0.2f
                                      delay:0.0f
                                    options:UIViewAnimationOptionBeginFromCurrentState
                                 animations:^{
                                     [self DLGMemUIView].frame = frame;
                                     [self DLGMemUIView].alpha = DLG_DEBUG_CONSOLE_VIEW_MAX_ALPHA;
                                 }
                                 completion:^(BOOL finished) {
                                     [self DLGMemUIView].frame = frame;
                                     [self DLGMemUIView].alpha = DLG_DEBUG_CONSOLE_VIEW_MAX_ALPHA;
                                 }];
            } else {
                CGFloat w = CGRectGetWidth(frame);
                CGFloat h = CGRectGetHeight(frame);
                CGFloat x = frame.origin.x;
                CGFloat y = frame.origin.y;
                
                CGFloat margin = 20;
                
                if ((x < margin ) || (x > screenWidth - w - margin)) {
                    if (x < (screenWidth - w) / 2) { x = 0; }
                    else { x = screenWidth - w; }
                    if (y < 0) { y = 0; }
                    else if (y > screenHeight - h) { y = screenHeight - h; }
                } else {
                    BOOL yChanged = NO;
                    if (y < h) { y = 0; yChanged = YES; }
                    else if (y > screenHeight - h - h) { y = screenHeight - h; yChanged = YES; }
                    if (yChanged) {
                        if (x < 0) { x = 0; }
                        else if (x > screenWidth - w) { x = screenWidth - w; }
                    } else {
                        if (x < (screenWidth - w) / 2) { x = 0; }
                        else { x = screenWidth - w; }
                    }
                }
                frame.origin.x = x;
                frame.origin.y = y;
                
                [UIView animateWithDuration:0.2f
                                      delay:0.0f
                                    options:UIViewAnimationOptionBeginFromCurrentState
                                 animations:^{
                                     [self DLGMemUIView].frame = frame;
                                     [self DLGMemUIView].alpha = DLG_DEBUG_CONSOLE_VIEW_MIN_ALPHA;
                                 }
                                 completion:^(BOOL finished) {
                                     [self DLGMemUIView].frame = frame;
                                     [self DLGMemUIView].alpha = DLG_DEBUG_CONSOLE_VIEW_MIN_ALPHA;
                                 }];
            }
        }
    }
}

@end
