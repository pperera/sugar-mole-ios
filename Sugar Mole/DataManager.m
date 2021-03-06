//
//  DataManager.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <Realm/Realm.h>

#import "DataManager.h"
#import "Device.h"
#import "Data.h"
#import "Description.h"

@interface DataManager ()

@property (nonatomic, strong) RLMRealm *defaultRealm;
@property (nonatomic, strong) NSString *token;

@end

@implementation DataManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _defaultRealm = [RLMRealm defaultRealm];
    }
    return self;
}

- (void)authentificationSucceed:(NSString *)token
{
    _token = token;
}

- (void)resetDatas
{
    _token = nil;
}

- (NSArray *)fetchAllDevicesInfos
{
    RLMResults *results = [Device allObjects];
    
    NSMutableArray *returnedArray = [[NSMutableArray alloc] init];
    
    for (Device *device in results) {
        [returnedArray addObject:device];
    }
    return returnedArray;
}

- (void)persistDevicesInfos:(NSDictionary *)datas
{
    [_defaultRealm beginWriteTransaction];
    
    for (id data in datas) {
        Device *newDevice = [[Device alloc] init];
        newDevice.type = [data[@"type"] intValue];
        
        for (NSString *key in (NSDictionary *)data[@"data"]) {
            Data *newData = [[Data alloc] init];
            newData.key = key;
            newData.value = [((NSDictionary *)data[@"data"]) objectForKey:key];
            [newDevice.data addObject:newData];
        }
        
        newDevice.name = data[@"name"];
        
        for (NSString *key in (NSDictionary *)data[@"desc"]) {
            Description *newDescription = [[Description alloc] init];
            newDescription.parameters = key;
            newDescription.value = [((NSDictionary *)data[@"desc"]) objectForKey:key];
            [newDevice.desc addObject:newDescription];
        }
        
        [_defaultRealm addOrUpdateObject:newDevice];
    }
    
    [_defaultRealm commitWriteTransaction];
}

@end
