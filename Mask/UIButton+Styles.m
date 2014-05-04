//
//  UIButton+Styles.m
//  Colors
//
//  Created by Juan Manuel Abrigo on 9/17/13.
//  Copyright (c) 2013 Lateral View. All rights reserved.
//

#import "UIButton+Styles.h"
#import "Mask.h"

@implementation UIButton (Styles)

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:StyleClassName])
    {
        [self applyStyleWithClass:[value description]];
        
        if ([Mask shared].monitorMode) {
            NSDictionary *userInfo = @{StyleClassName: [value description]};
            [NSTimer scheduledTimerWithTimeInterval:2.0
                                             target:self
                                           selector:@selector(updateScreen:)
                                           userInfo:userInfo
                                            repeats:YES];
        }
    }
}

- (void)applyStyleWithClass:(NSString*)className{
    if (![className isEqualToString:@""]) {
        NSDictionary *classDict = [[Mask shared]getStyleClassWithName:className];
        if (classDict) {
            
            NSString *backgroudColor = classDict[BackgroundColor];
            if (backgroudColor) {
                if ([[backgroudColor lowercaseString] isEqualToString:Clear]) {
                    [self setBackgroundColor:[UIColor clearColor]];
                }else{
                    [self setBackgroundColor:[UIColor colorWithHex:classDict[BackgroundColor] alpha:1.0]];
                    self.layer.backgroundColor = [UIColor colorWithHex:classDict[BackgroundColor] alpha:1.0].CGColor;
                    [self setBackgroundImage:[self imageWithColor:[UIColor colorWithHex:classDict[BackgroundColorHighlighted] alpha:1.0]] forState:UIControlStateHighlighted];
                }
            }
            
            self.layer.cornerRadius = [classDict[CornerRadius]floatValue];
            self.layer.borderColor = [UIColor colorWithHex:classDict[BorderColor] alpha:1.0].CGColor;
            self.layer.borderWidth = [classDict[BorderWidth]floatValue];
            [self setTitleColor:[UIColor colorWithHex:classDict[TextColor] alpha:1.0] forState:UIControlStateNormal];
            self.titleLabel.font = [UIFont fontWithName:classDict[Font] size:[classDict[FontSize]floatValue]];
            
            
            
        }
    }
}

- (void)updateScreen:(NSTimer*)cn{
    NSDictionary *userInfo = [cn userInfo];
    [self applyStyleWithClass:[userInfo objectForKey:StyleClassName]];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, self.frame.size.width*2, self.frame.size.height*2);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = rect;
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds
                                cornerRadius:rect.size.height/2] addClip];
    // Draw your image
    [image drawInRect:imageView.bounds];
    
    // Get the image, here setting the UIImageView image
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return imageView.image;
}

@end
