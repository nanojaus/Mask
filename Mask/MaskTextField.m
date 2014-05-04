//
//  MaskTextField.m
//
//  Created by Juan Manuel Abrigo on 2/19/14.
//  Copyright (c) 2014 Alimentes. All rights reserved.
//

#import "MaskTextField.h"

@implementation MaskTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [UIColor colorWithHex:@"D4D4D4" alpha:1.0].CGColor;
        self.layer.borderWidth = 1.0;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.borderColor = [UIColor colorWithHex:@"D4D4D4" alpha:1.0].CGColor;
        self.layer.borderWidth = 1.0;
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect ret = [super textRectForBounds:bounds];
    ret.origin.x = ret.origin.x + 5;
    ret.size.width = ret.size.width - 10;
    return ret;
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}


@end
