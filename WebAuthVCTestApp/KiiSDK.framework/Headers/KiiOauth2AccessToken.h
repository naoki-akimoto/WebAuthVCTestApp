//
//  KiiOauth2AccessToken.h
//  KiiSDK
//
//  Created by syahRiza on 2017/08/03.
//  Copyright © 2017 Kii Corporation. All rights reserved.
//

#import "KiiCredential.h"

/** Class represent credential for Identity provider
 */
@interface KiiOauth2AccessToken : NSObject<KiiCredential>
/** Construct credential with accessToken.
 @param accessToken credential
 @return instance of KiiProviderCredential than only provide accessToken
 */
+(nonnull instancetype) accessToken:(nonnull NSString*) accessToken;
/** Construct QQ credentia with accessToken and openID
 @param accessToken credential for QQ
 @param openID openID token given by QQ
 @return instance of KiiProviderCredential
 */
+(nonnull instancetype) accessToken:(nonnull NSString*) accessToken openID:(nonnull NSString*) openID;

@end

