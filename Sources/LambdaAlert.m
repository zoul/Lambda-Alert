#import "LambdaAlert.h"

@interface LambdaAlert () <UIAlertViewDelegate>
@property(retain) UIAlertView *alert;
@property(retain) NSMutableArray *blocks;
@end

@implementation LambdaAlert
@synthesize alert, blocks;

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

- (void) addButtonWithTitle: (NSString*) title block: (dispatch_block_t) block
{
    if (!block) block = ^{};
    [alert addButtonWithTitle:title];
    [blocks addObject:[[block copy] autorelease]];
}

- (void) alertView: (UIAlertView*) alertView didDismissWithButtonIndex: (NSInteger) buttonIndex
{
    if (buttonIndex >= 0 && buttonIndex < [blocks count]) {
        dispatch_block_t block = [blocks objectAtIndex:buttonIndex];
        block();
    }
    [self release];
}

@end
