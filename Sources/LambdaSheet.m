#import "LambdaSheet.h"

@interface LambdaSheet () <UIActionSheetDelegate>
@property(retain) UIActionSheet *sheet;
@property(retain) NSMutableArray *blocks;
@end

@implementation LambdaSheet
@synthesize sheet, blocks;

- (id) initWithTitle: (NSString*) title
{
    [super init];
    sheet = [[UIActionSheet alloc] initWithTitle:title delegate:self
        cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    blocks = [[NSMutableArray alloc] init];
    return self;
}

- (void) dealloc
{
    [blocks release];
    [sheet release];
    [super dealloc];
}

#pragma mark Button Management

- (void) addButtonWithTitle: (NSString*) title block: (dispatch_block_t) block
{
    if (!block) block = ^{};
    [sheet addButtonWithTitle:title];
    [blocks addObject:[[block copy] autorelease]];
}

- (void) addDestructiveButtonWithTitle: (NSString*) title block: (dispatch_block_t) block
{
    [self addButtonWithTitle:title block:block];
    [sheet setDestructiveButtonIndex:sheet.numberOfButtons-1];
}

- (void) addCancelButtonWithTitle: (NSString*) title block: (dispatch_block_t) block
{
    [self addButtonWithTitle:title block:block];
    [sheet setCancelButtonIndex:sheet.numberOfButtons-1];
}

- (void) addCancelButtonWithTitle: (NSString*) title
{
    [self addCancelButtonWithTitle:title block:NULL];
}

#pragma mark Display

- (void) showInView: (UIView*) view
{
    [sheet showInView:view];
    [self retain];
}

- (void) showFromTabBar: (UITabBar*) view
{
    [sheet showFromTabBar:view];
    [self retain];
}

- (void) showFromToolbar: (UIToolbar*) view
{
    [sheet showFromToolbar:view];
    [self retain];
}

#pragma mark UIActionSheetDelegate

- (void) actionSheet: (UIActionSheet*) actionSheet didDismissWithButtonIndex: (NSInteger) buttonIndex
{
    NSParameterAssert(actionSheet == sheet);
    if (buttonIndex >= 0 && buttonIndex < [blocks count]) {
        dispatch_block_t block = [blocks objectAtIndex:buttonIndex];
        block();
    }
    [self release];
}

@end
