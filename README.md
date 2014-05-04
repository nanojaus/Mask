Mask
====

Mask is a simple framework for design UIKit components using CSS.

AppDelegate.h

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {
        // Override point for customization after application launch.
        [[Mask shared]setUp];
        
        return YES;
    }


style.css

    FacebookButton {
        background-color: #3B5998;
        background-color-highlighted: #3B5998;
        border-color: #777777;
        border-width: 0;
        text-color: #FFFFFF;
        font-size: 17;
        corner-radius: 25;
        font: Avenir-Medium;
    }

Set style to UIButon:

![alt text](https://github.com/nanojaus/Mask/blob/master/MaskSample/Resources/setup.png?raw=true "")
