//
//  KiiServerClodeExecResult.h
//  KiiSDK-Private
//
//  Created by Riza Alaudin Syah on 6/25/13.
//  Copyright (c) 2013 Kii Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KiiServerCodeEntry.h"
/** Result of KiiServerCodeEntry execution.
 This class can not be instantiated.
 Calling [[KiiServerCodeExecResult alloc] init] directly will throw NSInternalInconsistencyException.
 */
@interface KiiServerCodeExecResult : NSObject
/**  Get calculated number of executed steps.
 @return number of executed steps.
 */
-(NSInteger) executedSteps;

/** Get JSON's NSDictionary returned by server code entry.
 @return NSDictionary instance of result data.
 */
-(nullable NSDictionary*) returnedValue;

/**
 * Get the version of Node.js to run.
 * @return environmentVersion
 */
-(KiiServerCodeEnvironmentVersion) environmentVersion;
@end
