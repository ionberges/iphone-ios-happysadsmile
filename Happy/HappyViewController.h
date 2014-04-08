//
//  HappyViewController.h
//  Happy
//
//  Created by Fernando Alava on 22/01/13.
//  Copyright (c) 2013 Fernando Alava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HappyView.h"



@interface HappyViewController : UIViewController <HappyViewDelegate>

@property (weak, nonatomic) IBOutlet HappyView *happyView;
@property (nonatomic) CGFloat felicidad;

@end
