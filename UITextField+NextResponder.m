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


-(UIView*)nextResponder{
    return objc_getAssociatedObject(self, &uniqueKey);
}

-(void)setNextResponder:(UIView*)nextResponder{
    objc_setAssociatedObject(self, &uniqueKey , nextResponder , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
