//
//  DG_NetTools.h
//  DG_NetTools
//
//  Created by lanou3g on 16/1/5.
//  Copyright © 2016年 侯彦栋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^dataBlock)(NSData *data);

typedef void(^imageBlock)(UIImage *image);


@interface DG_NetTools : NSObject


+ (void)solveDataWithUrl:(NSString *)stringUrl
              httpMethod:(NSString *)method
                httpBody:(NSString *)body
             revockBlock:(dataBlock)block;



+ (void)sessionDownloadsWithUrl:(NSString *)stringUrl
                    revockBlock:(imageBlock)block;









@end
