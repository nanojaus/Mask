//
//  Mask.h
//
//  Created by Juan Manuel Abrigo on 9/20/13.
//  Copyright (c) 2013 Lateral View. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MaskTextField.h"
#import "UIColor+Extended.h"

#define STYLEFILENAME @"style"

#define StyleClassName @"styleClass"
#define None @"none"
#define BackgroundColor @"background-color"
#define BackgroundColorHighlighted @"background-color-highlighted"
#define BorderColor @"border-color"
#define BorderWidth @"border-width"
#define TextColor @"text-color"
#define FontSize @"font-size"
#define CornerRadius @"corner-radius"
#define Font @"font"
#define Clear @"clear"

@interface Mask : NSObject

+ (Mask *)shared;

- (void)setUp;
- (void)setUpWithStyleFileName:(NSString*)styleName;
- (NSDictionary*)getStyleClassWithName:(NSString*)className;
- (void)setMonitorMode:(BOOL)on;

@property (nonatomic,assign) BOOL monitorMode;

@end