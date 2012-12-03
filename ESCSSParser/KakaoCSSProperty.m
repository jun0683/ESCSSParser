//
//  KakaoCSSProperty.m
//  ESCSSParser
//
//  Created by hongjun kim on 12. 12. 4..
//  Copyright (c) 2012년 Tracy E. All rights reserved.
//

#import "KakaoCSSProperty.h"

@implementation UIColor (HEX)

+ (UIColor *) colorFromHexString:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end

typedef enum propertyKey {
    color = 0,
    image,
    alpha,
    offset,
    margin
}propertyKey;

@implementation KakaoCSSProperty

+(NSDictionary*)parseValue:(NSString*)aKey property:(NSString*)property
{
    NSArray *keys = [[NSArray alloc] initWithObjects:@"color",@"image",@"alpha",@"offset",@"margin", nil];
    propertyKey keyKind;
    
    for (keyKind = color; [keys count]; keyKind++)
    {
        if([aKey hasSuffix:[keys objectAtIndex:keyKind]])
            break;
    }
    
    return [KakaoCSSProperty propertyKey:keyKind value:property];
}

+ (NSDictionary*)propertyKey:(propertyKey)key value:(NSString*)value
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    switch (key) {
        case color:
            [dic setValue:[UIColor colorFromHexString:value] forKey:@"color"];
            break;
        case image:
            [dic setValue:@"filename" forKey:@"image"];
            [dic setValue:@"x" forKey:@"x"];
            [dic setValue:@"y" forKey:@"y"];
            break;
        case alpha:
            [dic setValue:value forKey:@"alpha"];
            break;
        case offset:
            [dic setValue:value forKey:@"offset"];
            break;
        case margin:
            [dic setValue:value forKey:@"margin"];
            break;
        default:
            
            break;
    }
    return dic;
}



@end
