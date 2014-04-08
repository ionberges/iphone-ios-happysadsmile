//
//  HappyView.h
//  Happy
//
//  Created by Fernando Alava on 22/01/13.
//  Copyright (c) 2013 Fernando Alava. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HappyViewDelegate <NSObject>

-(CGFloat) obtenerFelicidad;


@end


struct XYRadio {
	CGFloat x;
	CGFloat y;
	CGFloat radio;
};
typedef struct XYRadio XYRadio;

#define ANCHO_LINEA 4.0
#define FACTOR_DISTANCIA_OJO 0.4
#define FACTOR_RADIO_OJO 0.1
#define FACTOR_DISTANCIA_BOCA 0.4

@interface HappyView : UIView
@property (weak,nonatomic) id<HappyViewDelegate> delegate;
@property (nonatomic) CGFloat felicidad;
@property (nonatomic) CGFloat escala;

@end
