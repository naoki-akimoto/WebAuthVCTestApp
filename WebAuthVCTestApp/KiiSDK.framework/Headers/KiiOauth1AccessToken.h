//
//  KiiOauth1AccessToken.h
//  KiiSDK
//
//  Created by syahRiza on 2017/08/03.
//  Copyright © 2017 Kii Corporation. All rights reserved.
//

#import "KiiCredential.h"
/** Class represent credential for Oauth v1 Identity provider
 */
@interface KiiOauth1AccessToken : NSObject<KiiCredential>
/** Construct Twitter credential with accessToken and accessToken Secret
 @param accessToken credential for Twitter
 @param secret accessToken secret token given by Twitter
 @return instance of KiiProviderCredential
 */
+(nonnull instancetype) accessToken:(nonnull NSString*) accessToken secret:(nonnull NSString*) secret;

@end

