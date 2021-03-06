//
//  CBRequestAPI.m
//  FwApp
//
//  Created by hxbjt on 2018/9/10.
//  Copyright © 2018年 chenbing. All rights reserved.
//

#import "CBRequestAPI.h"
#import "AESCipher.h"
#import "CBRequestHeaderVO.h"

@implementation CBRequestAPI

#pragma mark ————— 自定义数据 —————

- (NSString *)message {
    if (self.error) {
        return self.error.localizedDescription;
    }
    NSString *message = [NSString stringWithFormat:@"%@", self.responseJSONObject[@"descrp"]];
    return message;
}

- (NSString *)code {
    NSString *code = [NSString stringWithFormat:@"%@", self.responseJSONObject[@"code"]];
    return code;
}

- (BOOL)isSuccess {
    NSString *code = [self code];
    BOOL isSuccess = NO;
    if ([code isEqualToString:@"200"]) {
        isSuccess = YES;
    }
    else if ([code isEqualToString:@"504"]) {
        //账号被顶掉
        //        [[kAppDelegate getCurrentUIVC] AlertWithTitle:nil message:self.message andOthers:@[@"确定"] animated:YES action:nil];
        //        KPostNotification(KNotificationOnKick, nil);
    }
    else if([code isEqualToString:@"40000"]){
        //token过期
        //        [[kAppDelegate getCurrentUIVC] AlertWithTitle:nil message:self.message andOthers:@[@"确定"] animated:YES action:nil];
        //        KPostNotification(KNotificationOnKick, nil);
    }
    return isSuccess;
}

#pragma mark ————— 定义返回数据格式，若是加密要用HTTP接受 —————
- (YTKResponseSerializerType)responseSerializerType {
//    if (self.isOpenAES) {
//        return YTKResponseSerializerTypeHTTP;
//    }
    return YTKResponseSerializerTypeJSON;
}

#pragma mark ————— 默认请求方式 POST —————
- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}

#pragma mark ————— 默认请求体是自身转json —————
- (id)requestArgument {
    return [self modelToJSONObject];
}

#pragma mark ————— 请求失败过滤器 —————
- (void)requestFailedFilter{
    //失败处理器
}

#pragma mark ————— 请求成功过滤器 —————
- (void)requestCompleteFilter{
//    //解密
//    if (_isOpenAES) {
//        self.result = aesDecryptWithData(self.responseData);
//    } else {
//        self.result = self.responseJSONObject;
//    }
}

/*
- (instancetype)init{
    self = [super init];
    if (self) {
        _isOpenAES = NO;
    }
    return self;
}



#pragma mark ————— 非加密时也要传输的头部内容 也可能不需要，暂时保留 —————
- (NSDictionary <NSString *, NSString *> *)requestHeaderFieldValueDictionary{
    //加密header部分
    NSString *contentStr = [[CBRequestHeaderVO new] modelToJSONString];
    NSString *AESStr = aesEncrypt(contentStr);
    return @{@"header-encrypt-code":AESStr};
}

#pragma mark ————— 如果是加密方式传输，自定义request —————
- (NSURLRequest *)buildCustomUrlRequest {
    if (!_isOpenAES) return nil;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.baseUrl, self.requestUrl]]];
    //加密header部分
    NSString *headerContentStr = [[CBRequestHeaderVO new] modelToJSONString];
    NSString *headerAESStr = aesEncrypt(headerContentStr);
    [request setValue:headerAESStr forHTTPHeaderField:@"header-encrypt-code"];
    NSString *contentStr = [self.requestArgument jsonStringEncoded];
    NSString *AESStr = aesEncrypt(contentStr);
    [request setHTTPMethod:@"POST"];
    [request setValue:@"text/encode" forHTTPHeaderField:@"Content-Type"];
    NSData *bodyData = [AESStr dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:bodyData];
    return request;    
}
*/
@end
