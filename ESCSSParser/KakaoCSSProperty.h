//
//  KakaoCSSProperty.h
//  ESCSSParser
//
//  Created by hongjun kim on 12. 12. 4..
//  Copyright (c) 2012년 Tracy E. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KakaoCSSProperty : NSObject

+(NSDictionary*)parseValue:(NSString*)key property:(NSString*)property;

@end
