//
//  KiiIdentityInfo.h
//  KiiSDK
//
//  Created by syahRiza on 2017/07/18.
//  Copyright © 2017 Kii Corporation. All rights reserved.
//

#import "KiiIdentityProvider.h"

/** Represent details info provided by linked Identity provider.
 */
@interface KiiIdentityInfo : NSObject

/** Identity provider
 @return <KiiIdentityProvider> object.
*/
@property (readonly, nonnull) NSObject<KiiIdentityProvider>* identityProvider;

/** Account ID given by the identity provider
 @return accountID account identifier.
 */
@property (readonly, nonnull) NSString* accountID;

/**  The creation date time of identity provider integration.
@return createdAt the creation of Integration.
 */
@property (readonly, nonnull) NSDate* createdAt;


@end
