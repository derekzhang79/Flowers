//
//  HttpHelper.m
//  FlickerClient
//
//  Created by Dmitry on 24.12.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

//
// Flickr API Key: 530eada55eeea5c7e57197fb3488a281
//

#import "HttpHelper.h"
#import "Constants.h"

@interface HttpHelper () <NSURLConnectionDelegate>
@property (nonatomic, retain) NSURL * url;
@property (nonatomic, retain) NSMutableData *data;
@property (nonatomic, copy) HttpHelperBlock callbackBlock;

#pragma mark - NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
@end

@implementation HttpHelper

@synthesize url, data, callbackBlock;

+ (void)getDataWithURL:(NSURL *)url completeBlock:(HttpHelperBlock)block
{
    HttpHelper *helper = [[HttpHelper alloc] init];
    helper.callbackBlock = block;
    helper.url = url;
    [helper asyncRequest];
    [helper release];
}


- (void)asyncRequest
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:self.url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:HTTP_REQUEST_TIMEOUT];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [request release];
}

- (void)dealloc
{
    self.url = nil;
    self.data = nil;
    self.callbackBlock = nil;
    
    [super dealloc];
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.data = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)aData
{
    [self.data appendData:aData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *string = [[NSString alloc] initWithData:self.data
                                             encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", string);
    [string release];
    
    if (self.callbackBlock != nil) {
        self.callbackBlock(self.data);
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection did fail with Error = %@", error);
}


@end
