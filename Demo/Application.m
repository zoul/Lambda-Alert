#import "Application.h"
#import "LambdaAlert.h"
#import "LambdaSheet.h"

@implementation Application
@synthesize window;

- (BOOL) application: (UIApplication*) application didFinishLaunchingWithOptions: (NSDictionary*) launchOptions
{
    [window makeKeyAndVisible];
    return YES;
}

- (IBAction) showDemoAlert
{
    LambdaAlert *alert = [[LambdaAlert alloc]
        initWithTitle:@"Test Alert"
        message:@"See if the thing works."];
    [alert addButtonWithTitle:@"Foo" block:^{ NSLog(@"Foo"); }];
    [alert addButtonWithTitle:@"Bar" block:^{ NSLog(@"Bar"); }];
    [alert addButtonWithTitle:@"Cancel" block:NULL];
    [alert show];
    [alert release];
}

- (IBAction) showDemoActionSheet
{
    LambdaSheet *sheet = [[LambdaSheet alloc] initWithTitle:@"Action Sheet"];
    [sheet addButtonWithTitle:@"Miles" block:^{ NSLog(@"Trumpet"); }];
    [sheet addButtonWithTitle:@"Trane" block:^{ NSLog(@"Saxophone"); }];
    [sheet addDestructiveButtonWithTitle:@"Monk" block:^{ NSLog(@"Piano"); }];
    [sheet addCancelButtonWithTitle:@"Back to the Head"];
    [sheet setDismissAction:^{
        NSLog(@"Sheet was dismissed.");
    }];
    [sheet showInView:window];
    [sheet release];
}

- (void) dealloc
{
    [window release];
    [super dealloc];
}

@end
