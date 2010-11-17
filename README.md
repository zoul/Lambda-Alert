λ-alert
-------

This repo contains two simple wrappers around `UIAlertView` and `UIActionSheet`
that allow you to use blocks for actions, so that you don’t have to mess with
delegate callbacks and button indexes.

Installing
----------

Simply grab the `LambdaAlert.{h,m}` or `LambdaSheet.{h,m}` files from this
repository. Please note that the blocks are only available in the 4.0+ SDK
for iPhones and 4.2+ for iPad.

Usage
-----

Displaying an alert:

    LambdaAlert *alert = [[LambdaAlert alloc]
        initWithTitle:@"Test Alert"
        message:@"See if the thing works."];
    [alert addButtonWithTitle:@"Foo" block:^{ NSLog(@"Foo"); }];
    [alert addButtonWithTitle:@"Bar" block:^{ NSLog(@"Bar"); }];
    [alert addButtonWithTitle:@"Cancel" block:NULL];
    [alert show];
    [alert release];

Displaying a sheet:

    LambdaSheet *sheet = [[LambdaSheet alloc] initWithTitle:@"Action Sheet"];
    [sheet addButtonWithTitle:@"Miles" block:^{ NSLog(@"Trumpet"); }];
    [sheet addButtonWithTitle:@"Trane" block:^{ NSLog(@"Saxophone"); }];
    [sheet addDestructiveButtonWithTitle:@"Monk" block:^{ NSLog(@"Piano"); }];
    [sheet addCancelButtonWithTitle:@"Back to the Head"];
    [sheet showInView:window];
    [sheet release];

The memory management works as with the wrapped classes: you may release the
alert/sheet after displaying and it will get released after dismissing. See the
demo project and source for details.

Links
-----

* [Programming with C Blocks][1] by Joachim Bengtsson
* [Practical Blocks][2] by Mike Ash

[1]: http://thirdcog.eu/pwcblocks/
[2]: http://www.mikeash.com/pyblog/friday-qa-2009-08-14-practical-blocks.html

Author
------

Tomáš Znamenáček, <zoul@fleuron.cz>
