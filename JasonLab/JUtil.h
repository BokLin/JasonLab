//
//  JUtil.h
//  JasonLab
//
//  Created by linbo on 16/1/30.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JUtil : NSObject

/**
 *  获取字符串MD5编码
 *
 *  @param str 传入的字符串
 *
 *  @return 返回32位MD5编码
 */
+ (NSString *)Md5:(NSString *)str;

/**
 *  判断字符串是否满足邮件格式
 *
 *  @param email 传入字符串
 *
 *  @return YES:满足 NO:不是
 */
+ (BOOL)isValidateEmail:(NSString *)str;

/**
 *  判断字符串是否满足账号格式（只能包含字母数字和下划线，下划线不能作为开头）
 *
 *  @param str 传入字符串
 *
 *  @return YES:满足 NO:不是
 */
+ (BOOL)isValidateAccount:(NSString *)str;

/**
 *  判断字符串是否满足手机号码格式
 *
 *  @param str 传入字符串
 *
 *  @return YES:满足 NO:不是
 */
+ (BOOL)isValidateMobile:(NSString *)str;

/**
 *  判断字符串是否满足身份证格式
 *
 *  @param str 传入字符串
 *
 *  @return YES:满足 NO:不是
 */
+ (BOOL)isValidateIDCard:(NSString *)str;

/**
 *  版本比较（比如:1.2 1.2.3）
 *
 *  @param v1 第一个参数
 *  @param v2 第二个参数
 *
 *  @return v1>v2 则为1, v1=v2 则为0, v1<v2 则为-1
 */
+ (int)version:(NSString *)v1 compare:(NSString *)v2;

/**
 *  图片压缩
 *
 *  @param image   传入图片
 *  @param newSize 新的尺寸
 *
 *  @return 生成的压缩图片
 */
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

#pragma mark - 计算文件和文件夹大小
/**
 *  计算文件大小
 *
 *  @param filePath 文件路径
 *
 *  @return 返回文件大小（单位MB）
 */
+ (float)fileSizeAtPath:(NSString*) filePath;

/**
 *  计算一个目录的大小下面所有文件大小（不包含目录）
 *
 *  @param folderPath 目录路径
 *
 *  @return 返回的目录大小（单位MB）
 */
+ (float)folderSizeAtPath:(NSString*) folderPath;

@end
