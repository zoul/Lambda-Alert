@interface Application : NSObject <UIApplicationDelegate> {}

@property(retain) IBOutlet UIWindow *window;

- (IBAction) showDemoAlert;
- (IBAction) showDemoActionSheet;

@end
