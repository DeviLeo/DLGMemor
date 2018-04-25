//
//  UIWindow+DLGMemUI
//  memui
//
//  Created by Liu Junqi on 11/11/2016.
//  Copyright © 2016 Liu Junqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DLGMemUIView;

@interface UIWindow (DLGMemUI)

- (BOOL)dragging;
- (void)setDragging:(BOOL)dragging;
- (CGPoint)startPosition;
- (void)setStartPosition:(CGPoint)pt;
- (DLGMemUIView *)DLGMemUIView;
- (void)setDLGMemUIView:(DLGMemUIView *)view;
- (void)handleGesture:(UIPanGestureRecognizer *)sender;
- (void)handleTTTapGesture:(UIPanGestureRecognizer *)sender;

@end
