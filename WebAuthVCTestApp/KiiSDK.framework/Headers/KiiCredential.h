//
//  KiiCredential.h
//  KiiSDK
//
//  Created by syahRiza on 2017/08/17.
//  Copyright © 2017 Kii Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Representation of credential.
 */
@protocol KiiCredential<NSObject>
-(nonnull NSDictionary*) requestDictionary;
@end
