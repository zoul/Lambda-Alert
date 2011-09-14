@interface LambdaAlert : NSObject

@property(copy) dispatch_block_t dismissAction;

- (id) initWithTitle: (NSString*) title message: (NSString*) message;
- (void) addButtonWithTitle: (NSString*) title block: (dispatch_block_t) block;
- (void) show;

@end
