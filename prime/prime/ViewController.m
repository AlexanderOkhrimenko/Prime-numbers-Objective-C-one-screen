//
//  ViewController.m
//  prime
//
//  Created by Okhrimenko Alexander on 31.08.17.
//  Copyright © 2017 Okhrimenko Alexander. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () {
    NSTimer *timer;
    int seconds;
}

@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UIView *subView;
- (IBAction)animatedButton:(UIButton *)sender;


@end

@implementation ViewController

u_long d = 0; //
bool b = 0;   // button flag


- (void)viewDidLoad {
    [super viewDidLoad];

    
      [self start:timer];
      [self timer];
    
    dispatch_queue_t newQueue = dispatch_queue_create("newQueue", nil);
    dispatch_async(newQueue, ^{
        
        [self fullP];

    });

}

-(u_long) fullP {
    
    for (u_long i = 1000000000000000000; i<1999999999999999999; i++)
        
    {
        if (prime(i))
          {
              d = i;

         }
    }

    return 0;
}


int prime(u_long a)
{
    u_long i, j, bound;
    if (a == 0 || a == 1)
        return 0;
    if (a == 2 || a == 3 || a == 5)
        return 1;
    if (a%2 == 0 || a%3 == 0 || a%5 == 0)
        return 0;
    bound = sqrt((double)a);
    i = 7; j = 11;
    while (j <= bound && a%i && a%j)
    {
        i += 6; j += 6;
    }
    if (j <= bound || (i <= bound && a%i == 0))
        return 0;
    return 1;
}

-(IBAction)start:(id)sender {
    self->timer = [NSTimer scheduledTimerWithTimeInterval:0.5f  target:self selector:@selector(timer) userInfo:nil repeats:YES];
}

-(void)timer {

    [_count setText:[NSString stringWithFormat:@"%lu",d]];
    
}
- (IBAction)animatedButton:(UIButton *)sender {
    
    if (b == 0) {
        CGRect newFrame = self.subView.frame;
        
        newFrame.size.width = 0;
        newFrame.size.height = 0;
        [self.subView setFrame:newFrame];
        b=1;
    }
    else
    {
        CGRect newFrame = self.subView.frame;
        
        newFrame.size.width = 240;
        newFrame.size.height = 120;
        [self.subView setFrame:newFrame];
        b=0;
    }

    
}
@end
