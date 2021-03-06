//
//  DataManager.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

@property (nonatomic, readonly) NSString *token;

- (void)authentificationSucceed:(NSString *)token;
- (void)resetDatas;

- (void)persistDevicesInfos:(NSDictionary *)datas;
- (NSArray *)fetchAllDevicesInfos;

@end
