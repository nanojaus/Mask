//
//  Mask.m
//
//  Created by Juan Manuel Abrigo on 9/20/13.
//  Copyright (c) 2013 Lateral View. All rights reserved.
//

#import "Mask.h"
#import "StyleParser.h"

@interface Mask () {
    NSDictionary *styleDict;
    NSString *path;
    NSString *monitorPath;
}

@end

@implementation Mask

+ (Mask *)shared
{
    static Mask *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[Mask alloc] init];
    });
    return shared;
}

- (void)setUp{
    [self setUpWithStyleFileName:STYLEFILENAME];
}

- (void)setUpWithStyleFileName:(NSString*)styleName{
    path = [[NSBundle mainBundle] pathForResource:styleName ofType:@"css"];
    styleDict = [[[StyleParser alloc]init] getStylesFromPath:path];
}

- (NSDictionary*)getStyleClassWithName:(NSString*)className{
    if (_monitorMode) {
            styleDict = [[[StyleParser alloc]init] getStylesFromPath:monitorPath];
    }
    return [styleDict objectForKey:className];
}

- (void)setMonitorMode:(BOOL)on{
    _monitorMode = on;
    if (on) {
        
        
        NSString *contentFile = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        monitorPath = [documentsDirectory stringByAppendingPathComponent:@"cosmicss.css"];
        [contentFile writeToFile:monitorPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        NSLog(@"Style Path: %@", monitorPath);
    }
}

@end
