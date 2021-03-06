//
//  ESUtils.m
//  ESJsonFormat
//
//  Created by 尹桥印 on 15/7/12.  Change by ZX on 17/5/17
//  Copyright (c) 2015年 EnjoySR. All rights reserved.
//

#import "ESUtils.h"

@implementation ESUtils

+ (NSInteger)XcodePreVsersion{
    NSAppleScript *_script = [[NSAppleScript alloc] initWithSource:@"do shell script \"xcodebuild -version\""];
    NSDictionary  *_error  = [NSDictionary new];
    NSAppleEventDescriptor *des =[_script executeAndReturnError:&_error];
    if (_error.count == 0) {
        NSString *desStr = des.stringValue;
        NSRange preRange = [desStr rangeOfString:@"Xcode "];
        NSRange subRange = [desStr rangeOfString:@"Build"];
        NSInteger version = 0;
        if (preRange.location != NSNotFound && subRange.location != NSNotFound && desStr.length>subRange.length + preRange.length) {
            version = [[desStr substringWithRange:NSMakeRange(preRange.length, subRange.location - preRange.length)] integerValue];
        }
        return version;
    }
    else{
        return 0;
    }
}

+ (BOOL)isXcode7AndLater{
    return [self XcodePreVsersion]>=7;
}

@end
