//
//  DG_NetTools.m
//  DG_NetTools
//
//  Created by lanou3g on 16/1/5.
//  Copyright © 2016年 侯彦栋. All rights reserved.
//

#import "DG_NetTools.h"

@implementation DG_NetTools


+ (void)solveDataWithUrl:(NSString *)stringUrl
              httpMethod:(NSString *)method
                httpBody:(NSString *)body
             revockBlock:(dataBlock)block
{
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSString *sMethod = [method uppercaseString];
    if ([@"POST" isEqualToString:sMethod]) {
        [request setHTTPMethod:@"POST"];
        NSData *data = [body dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:data];
    }
    else if ([@"GET" isEqualToString:sMethod])
    {
        
    }
    else
    {
        @throw [NSException exceptionWithName:@"Error" reason:@"方法类型参数错误" userInfo:nil];
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data);
    }];
    
    [task resume];
    
}

+ (void)sessionDownloadsWithUrl:(NSString *)stringUrl
                    revockBlock:(imageBlock)block
{
    
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            block(image);
        });
        
        
    }];
    
    [task resume];
    
}












@end
