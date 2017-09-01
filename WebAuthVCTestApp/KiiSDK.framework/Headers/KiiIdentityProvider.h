//
//  KiiIdentityProvider.h
//  KiiSDK
//
//  Created by syahRiza on 2017/07/12.
//  Copyright © 2017 Kii Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark -
/** Representation of supported external service that can be used for <KiiUser> authentication.
 */
@protocol KiiIdentityProvider <NSObject,NSCopying>

/** Name of Identity provider.
 @return the provider name.
 */
@property (readonly, nonnull) NSString* identityProviderName;
@end

/** Representation of supported external service that can be used for <KiiUser> authentication.
 */
@protocol KiiIdentityProviderFactory <NSObject>

+(nonnull instancetype) provider;
@end



