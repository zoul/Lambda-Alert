#import "LambdaAlert.h"

@implementation LambdaAlert

- (id) initWithTitle: (NSString*) title message: (NSString*) message
{
    [super init];
    alert = [[UIAlertView alloc] initWithTitle:title message:message
        delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    blocks = [[NSMutableArray alloc] init];
    return self;
}

- (void) dealloc
{
    [alert release];
    [blocks release];
    [super dealloc];
}

- (void) show
{
    [alert show];
    [self retain];
}

- (void) addButtonWithTitle: (NSString*) title block: (AlertCallback) block
{
    if (!block) block = ^{};
    [alert addButtonWithTitle:title];
    [blocks addObject:[[block copy] autorelease]];
}

- (void) alertView: (UIAlertView*) alertView didDismissWithButtonIndex: (NSInteger) buttonIndex
{
    if (buttonIndex >= 0 && buttonIndex < [blocks count]) {
        AlertCallback block = [blocks objectAtIndex:buttonIndex];
        block();
    }
    [self release];
}

@end
