//
//  KiiWebAuthProvider.h
//  KiiSDK
//
//  Created by syahRiza on 2017/08/03.
//  Copyright © 2017 Kii Corporation. All rights reserved.
//

#import "KiiIdentityProvider.h"

/** Subtype of KiiIdentityProvider that support  Kii's WebAuth integration.
 */
@interface KiiWebAuthProvider : NSObject<KiiIdentityProvider>
@end

/** Subtype of KiiIdentityProvider that support  Kii's WebAuth integration.
 This is representation of OpenIDConnect

 */
@interface KiiOpenIDConnectProvider : KiiWebAuthProvider<KiiIdentityProviderFactory>

@end

/** Subtype of KiiIdentityProvider that support  Kii's WebAuth integration.
 This is representation of Reserved Provider 1

 */
@interface KiiReservedProvider1 : KiiWebAuthProvider<KiiIdentityProviderFactory>

@end
