Lambda Alert
------------

This is a simple wrapper around the `UIAlertView` class that uses
blocks for button actions, so that you don’t have to mess with
delegate callbacks and button indexes.

Installing
----------

Simply grab the `LambdaAlert.{h,m}` files from this repository. Please
note that the blocks are currently only available in the 4.0 SDK.

Usage
-----

    LambdaAlert *alert = [[LambdaAlert alloc]
        initWithTitle:@"Test Alert"
        message:@"See if the thing works."];
    [alert addButtonWithTitle:@"Foo" block:^{ NSLog(@"Foo"); }];
    [alert addButtonWithTitle:@"Bar" block:^{ NSLog(@"Bar"); }];
    [alert addButtonWithTitle:@"Cancel" block:NULL];
    [alert show];
    [alert release];

The memory management works as with the `UIAlertView`. You can release the
alert after you show it and it will get released after dismissing.

Author
------

Tomáš Znamenáček, <zoul@fleuron.cz>
