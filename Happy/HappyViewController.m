//
//  HappyViewController.m
//  Happy
//
//  Created by Fernando Alava on 22/01/13.
//  Copyright (c) 2013 Fernando Alava. All rights reserved.
//

#import "HappyViewController.h"

@interface HappyViewController ()

@end

@implementation HappyViewController

#pragma mark delegacion
- (CGFloat) obtenerFelicidad {
    return self.felicidad;
    
}


- (void)setFelicidad:(CGFloat)felicidad {
    if(felicidad >= -1.0 && felicidad <=1.0){
        _felicidad=felicidad;
        
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.happyView setEscala:0.5];
	//[self.happyView setFelicidad:-1.0];
    [self setFelicidad:1.0];
    [self.happyView setDelegate:self];
}

#pragma mark Gestos
- (IBAction)rotar:(UIRotationGestureRecognizer *)gesture {
    if(gesture.state == UIGestureRecognizerStateBegan ||
	   gesture.state == UIGestureRecognizerStateChanged) {
		NSLog(@"rot: %g", gesture.rotation);
        [self.happyView setTransform:(CGAffineTransformMakeRotation(gesture.rotation))];
		//[self.happyView setEscala:gesture.scale];
        
	}
}

- (IBAction)pinch:(UIPinchGestureRecognizer *)gesture {
	//NSLog(@"Gesto: %@", gesture);
	if(gesture.state == UIGestureRecognizerStateBegan ||
	   gesture.state == UIGestureRecognizerStateChanged) {
        
		//NSLog(@"Escala: %g", gesture.scale);
		[self.happyView setEscala:gesture.scale];
	}
}
- (IBAction)pan:(UIPanGestureRecognizer *)gesture {
    if(gesture.state == UIGestureRecognizerStateBegan ||
	   gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gesture translationInView:self.view];
        CGFloat felicidad2 = translation.y / (self.view.bounds.size.height/2);
        [gesture setTranslation:(CGPointMake(0, 0)) inView:self.view];
         
       // [self.happyView setFelicidad:self.happyView.felicidad+felicidad2];
         [self setFelicidad:self.felicidad+felicidad2];
          [self.happyView setNeedsDisplay];
		//NSLog(@"Escala: %g", gesture.scale);
	}
}

#pragma mark View Lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
