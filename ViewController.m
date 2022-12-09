//
//  ViewController.m
//  facebook_ios_6.0
//
//  Created by Jayesh on 10/18/12.
//  Copyright (c) 2012 Jayesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnFacebookClick:(id)sender{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbComposer = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeFacebook];
        //set the initial text message
        [fbComposer setInitialText:@"Hi i am coding for bugs!!"];
        //add url
        if ([fbComposer addURL:[NSURL URLWithString:@"www.kmithi.blogspot.com"]]) {
            NSLog(@"Blog url added");
        }
        
        
        // you can remove all added URLs as follows
        //[fbComposer removeAllURLs];
        
        //add image to post
        if ([fbComposer addImage:[UIImage imageNamed:@"strongBinary"]]) {
            NSLog(@"strong binary added to the post");
        }
        if ([fbComposer addImage:[UIImage imageNamed: @"scan.jpg"]]) {
            NSLog(@"scan is added to the post");
        }
        
        //remove all added images
        //[fbComposer removeAllImages];
        
        //present the composer to the user
        [self presentViewController:fbComposer animated:YES completion:nil];
        
    }else {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Facebook Error"
                                  message:@"You may not have set up facebook service on your device or\n                                  You may not connected to internent.\nPlease check ..."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
        [alertView show];
    }
}

-(IBAction)btnTwiiterClick:(id)sender{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        SLComposeViewController *twitterComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        //add initial text
        [twitterComposer setInitialText:@"Tweeting from iPhone 5 #TesingApp"];
        
        //present composer
        [self presentViewController:twitterComposer animated:YES completion:nil];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"twitter Error"
                                  message:@"You may not have set up twitter service on your device or\n                                  You may not connected to internent.\nPlease check ..."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
        [alertView show];
    }
}

-(IBAction)btnFacebookAnotherClick:(id)sender{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"iOS 6 %@ integration test!",mySLComposerSheet.serviceType]];
        [mySLComposerSheet addImage:[UIImage imageNamed:@"image.png"]];
        [mySLComposerSheet addURL:[NSURL URLWithString:@"http:www.StackOverflow.com/"]];
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSLog(@"dfsdf");
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"ACtionCancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
            default:
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook Message" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];

}
@end
