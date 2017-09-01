//
//  KiiTokenProvider.h
//  KiiSDK
//
//  Created by syahRiza on 2017/08/03.
//  Copyright © 2017 Kii Corporation. All rights reserved.
//

#import "KiiIdentityProvider.h"

/** Subtype of <KiiIdentityProvider> that support  Kii's token integration.
 */
@interface KiiTokenProvider : NSObject<KiiIdentityProvider>

@end


/** Subtype of <KiiIdentityProvider> for facebook
 */
@interface KiiFacebookProvider : KiiTokenProvider<KiiIdentityProviderFactory>
@end

/** Subtype of <KiiIdentityProvider> for Twitter
 */
@interface KiiTwitterProvider : KiiTokenProvider<KiiIdentityProviderFactory>
@end

/** Subtype of <KiiIdentityProvider> for google
 */
@interface KiiGoogleProvider : KiiTokenProvider<KiiIdentityProviderFactory>
@end

/** Subtype of <KiiIdentityProvider> for sina weibo
 */
@interface KiiSinaWeiboProvider : KiiTokenProvider<KiiIdentityProviderFactory>
@end

/** Subtype of <KiiIdentityProvider> for qq
 */
@interface KiiQQProvider : KiiTokenProvider<KiiIdentityProviderFactory>
@end

/** Subtype of <KiiIdentityProvider> for docomo
 */
@interface KiiDocomoProvider : KiiTokenProvider<KiiIdentityProviderFactory>
@end
