//
//  JUtil.m
//  JasonLab
//
//  Created by linbo on 16/1/30.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "JUtil.h"
#import <CommonCrypto/CommonDigest.h>

@implementation JUtil

+ (NSString *)Md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

+ (BOOL)isValidateEmail:(NSString *)str
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:str];
}

+ (BOOL)isValidateAccount:(NSString *)str
{
    NSString *regex = @"^(?!_)[a-zA-Z0-9_]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:str];
}

+ (BOOL)isValidateMobile:(NSString *)str
{
    NSString *regex = @"^1+[3578]+d{9}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:str];
}

+ (BOOL)isValidateIDCard:(NSString *)str
{
    NSString *regex = @"^(d{15}$|^d{18}$|^d{17}(d|X|x))$/";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:str];
}

+ (int)version:(NSString *)v1 compare:(NSString *)v2
{
    NSArray *array1 = [v1 componentsSeparatedByString:@"."];
    NSArray *array2 = [v2 componentsSeparatedByString:@"."];
    
    int max = (int)MAX(array1.count, array2.count);
    
    for (int i = 0; i<max; i++) {
        
        int int1 = 0;
        if (array1.count>i) {
            NSString *str1 = array1[i];
            int1 = str1.intValue;
        }
        
        int int2 = 0;
        if (array2.count>i) {
            NSString *str2 = array2[i];
            int2 = str2.intValue;
        }
        
        if (int1 > int2) {
            return 1;
        }else if (int1 < int2) {
            return -1;
        }
    }
    
    return 0;
}

+ (UIImage *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (float)fileSizeAtPath:(NSString*) filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath])
    {
        long long size = [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
        return size/(1024*1024);
    }
    
    return 0;
}

+ (float)folderSizeAtPath:(NSString*) folderPath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:folderPath])
        return 0;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    
    NSString* fileName;
    long long folderSize = 0;
    
    while ((fileName = [childFilesEnumerator nextObject]) != nil)
    {
        
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize;
}
@end
