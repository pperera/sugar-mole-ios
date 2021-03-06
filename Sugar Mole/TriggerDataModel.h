//
//  TriggerDataModel.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 24/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemDataModel.h"

@interface TriggerDataModel : ItemDataModel

@property (nonatomic, assign) TriggerType type;
@property (nonatomic, assign) DetailTrigger detail;
@property (nonatomic, assign) int value;

@end
