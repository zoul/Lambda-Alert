#import "Application.h"
#import "LambdaAlert.h"

@implementation Application
@synthesize window;

- (void) applicationDidFinishLaunching: (UIApplication*) application
{
    LambdaAlert *alert = [[LambdaAlert alloc]
        initWithTitle:@"Test Alert"
        message:@"See if the thing works."];
    [alert addButtonWithTitle:@"Foo" block:^{ NSLog(@"Foo"); }];
    [alert addButtonWithTitle:@"Bar" block:^{ NSLog(@"Bar"); }];
    [alert setCancelButtonWithTitle:@"Cancel" block:NULL];
    [alert show];
    [alert release];
    [window makeKeyAndVisible];
}

- (void) dealloc
{
    [window release];
    [super dealloc];
}

@end
