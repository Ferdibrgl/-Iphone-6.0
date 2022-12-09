//
//  ViewController.h
//  facebook_ios_6.0
//
//  Created by Jayesh on 10/18/12.
//  Copyright (c) 2012 kashipara.in. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<Social/Social.h>

@interface ViewController : UIViewController
{
    IBOutlet UIButton *btnLogin;
    IBOutlet UIButton *btnLogout;
    SLComposeViewController *mySLComposerSheet;
}
-(IBAction)btnFacebookClick:(id)sender;
-(IBAction)btnFacebookAnotherClick:(id)sender;
-(IBAction)btnTwiiterClick:(id)sender;

@end
