#import "Application.h"

@implementation Application
@synthesize window;

- (void) applicationDidFinishLaunching: (UIApplication*) application
{    
    [window makeKeyAndVisible];
}

- (void) dealloc
{
    [window release];
    [super dealloc];
}

@end
