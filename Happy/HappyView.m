//
//  HappyView.m
//  Happy
//
//  Created by Fernando Alava on 22/01/13.
//  Copyright (c) 2013 Fernando Alava. All rights reserved.
//

#import "HappyView.h"

@implementation HappyView



- (void)setup {
	[self setEscala:0.9];
	[self setFelicidad:1.0];
	[self setContentMode:UIViewContentModeRedraw];
}

- (void)awakeFromNib {
	[self setup];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		[self setup];
    }
    return self;
}

#pragma mark Setter y Getters

- (void)setEscala:(CGFloat)escala {
	if(escala >= 0.0 && escala <= 2.0) {
		_escala = escala;
		[self setNeedsDisplay];
	}
}

#pragma mark Dibujar

- (void)dibujarCaraEnXYRadio:(XYRadio)xyrCara  conContext:(CGContextRef)context
{
	UIGraphicsPushContext(context);

	[[UIColor blackColor] setStroke];
	[[UIColor yellowColor] setFill];

    CGContextAddArc(context, xyrCara.x, xyrCara.y, xyrCara.radio, 0, M_PI * 2, 0);
	CGContextDrawPath(context, kCGPathFillStroke);

	UIGraphicsPopContext();
}
- (void)dibujarOjosEnXYRadio:(XYRadio)xyrCara  conContext:(CGContextRef)context {
	UIGraphicsPushContext(context);

	[[UIColor blackColor] setStroke];
	[[UIColor whiteColor] setFill];

	CGPoint ojo1 = CGPointMake(xyrCara.x - xyrCara.radio * FACTOR_DISTANCIA_OJO,
							   xyrCara.y - xyrCara.radio * FACTOR_DISTANCIA_OJO);
    CGContextAddArc(context, ojo1.x, ojo1.y, xyrCara.radio * FACTOR_RADIO_OJO, 0, M_PI * 2, 0);
	CGContextDrawPath(context, kCGPathFillStroke);

	CGPoint ojo2 = CGPointMake(xyrCara.x + xyrCara.radio * FACTOR_DISTANCIA_OJO,
							   xyrCara.y - xyrCara.radio * FACTOR_DISTANCIA_OJO);
    CGContextAddArc(context, ojo2.x, ojo2.y, xyrCara.radio * FACTOR_RADIO_OJO, 0, M_PI * 2, 0);
	CGContextDrawPath(context, kCGPathFillStroke);

	UIGraphicsPopContext();
}
- (void)dibujarBocaEnXYRadio:(XYRadio)xyrCara  conContext:(CGContextRef)context
{
	UIGraphicsPushContext(context);

	[[UIColor blackColor] setStroke];

	CGPoint inicioBoca = CGPointMake(xyrCara.x - xyrCara.radio * FACTOR_DISTANCIA_BOCA,
									 xyrCara.y + xyrCara.radio * FACTOR_DISTANCIA_BOCA);
	CGPoint finBoca = CGPointMake(xyrCara.x + xyrCara.radio * FACTOR_DISTANCIA_BOCA,
								  xyrCara.y + xyrCara.radio * FACTOR_DISTANCIA_BOCA);
	CGFloat anchoBoca = finBoca.x - inicioBoca.x;
	CGPoint cp1 = CGPointMake(inicioBoca.x + anchoBoca * 1/4,
							  inicioBoca.y + anchoBoca / 2 * [self.delegate obtenerFelicidad]);
	CGPoint cp2 = CGPointMake(inicioBoca.x + anchoBoca * 3/4,
							  inicioBoca.y + anchoBoca / 2 * [self.delegate obtenerFelicidad]);

	CGContextMoveToPoint(context,
						 inicioBoca.x,
						 inicioBoca.y);
	CGContextAddCurveToPoint(context,
							 cp1.x, cp1.y,
							 cp2.x, cp2.y,
							 finBoca.x, finBoca.y);

	CGContextDrawPath(context, kCGPathStroke);

	UIGraphicsPopContext();
}
- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();

	CGContextSetLineWidth(context, ANCHO_LINEA);

	CGPoint centro = CGPointMake(self.bounds.origin.x + self.bounds.size.width / 2,
								 self.bounds.origin.y + self.bounds.size.height / 2);
	CGFloat radio = MIN(self.bounds.size.width / 2, self.bounds.size.height / 2) * self.escala;
	XYRadio xyrCara = (XYRadio) { centro.x, centro.y, radio };

	[self dibujarCaraEnXYRadio:xyrCara conContext:context];
	[self dibujarOjosEnXYRadio:xyrCara conContext:context];
	[self dibujarBocaEnXYRadio:xyrCara conContext:context];
}

@end
