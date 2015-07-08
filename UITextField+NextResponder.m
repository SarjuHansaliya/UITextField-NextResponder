//
//  UITextField+NextResponder.m
//  NextResponder
//
//  Created by sarju hansaliya on 06/07/15.
//
//

#import "UITextField+NextResponder.h"
#import <objc/runtime.h>

static char uniqueKey;

@implementation UITextField (NextResponder)


-(UIView*)nextResponderView{
    return objc_getAssociatedObject(self, @selector(nextResponderView));
}

-(void)setNextResponderView:(NSObject*)nextResponder{
    objc_setAssociatedObject(self, @selector(nextResponderView) , nextResponder , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
