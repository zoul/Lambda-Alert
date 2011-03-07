typedef void (^SheetCallback)(void);

@interface LambdaSheet : NSObject {}

- (id) initWithTitle: (NSString*) title;

- (void) addButtonWithTitle: (NSString*) title block: (SheetCallback) block;
- (void) addDestructiveButtonWithTitle: (NSString*) title block: (SheetCallback) block;
- (void) addCancelButtonWithTitle: (NSString*) title block: (SheetCallback) block;
- (void) addCancelButtonWithTitle: (NSString*) title;

- (void) showFromTabBar: (UITabBar*) view;
- (void) showFromToolbar: (UIToolbar*) view;
- (void) showInView: (UIView*) view;

@end
