//
//  KiiAPNSFields.h
//  KiiSDK-Private
//
//  Created by Riza Alaudin Syah on 1/28/13.
//  Copyright (c) 2013 Kii Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
/** Class that encapsulate APNS message fields data structure
 */
@interface KiiAPNSFields : NSObject

/**String. Not required. encapsulation of loc-key key on APNS alert property*/
@property(nonatomic,nullable) NSString* alertBody;	//String. Not required.

/**String. Not required. encapsulation of action-loc-key key on APNS alert property*/
@property(nonatomic,nullable) NSString* alertActionLocKey;



/**String. Not required. encapsulation of loc-key key on APNS alert property*/
@property(nonatomic,nullable) NSString* alertLocKey;	//String. Not required.

/**Array. Not required. encapsulation of loc-args key on APNS alert property*/
@property(nonatomic,nullable) NSArray* alertLocArgs;	//JSON Array of values. Not required.

/**String. Not required. encapsulation of launch-image key on APNS alert property*/
@property(nonatomic,nullable) NSString* alertLaunchImage;	//String. Not required.

/**String. Not required. encapsulation of title key on APNS alert property*/
@property(nonatomic,nullable) NSString* alertTitle;	//String. Not required.

/**String. Not required. encapsulation of subtitle key on APNS alert property*/
@property(nonatomic,nullable) NSString* alertSubtitle;	//String. Not required.

/**String. Not required. encapsulation of sound key on APNS  property*/
@property(nonatomic,nullable) NSString* sound;

/**Number. Not required. encapsulation of badge key on APNS  property*/
@property(nonatomic,nullable) NSNumber* badge;

/** Number. Not required. encapsulation of content-available key on APNS property.
 If 0, content-available payload is not delivered.
 Otherwise, content-available=1 payload is delivered. */
@property(nonatomic,nullable) NSNumber* contentAvailable;

/** String. Not required. Encapsulation of category key on APNS property.
 */
@property(nonatomic,nullable) NSString* category;

/** Number. Not required. encapsulation of mutable-content key on APNS property.
 */
@property(nonatomic,nullable) NSNumber* mutableContent;

/** Define APNS specific metadata
 @param dict a Dictionary object contains one level json dictionary data
 */
-(void) setSpecificData:(nullable NSDictionary*)dict;

/** generate output dictionary object
  @return dict a Dictionary object contains one level json dictionary data
 */
-(nonnull NSDictionary*)generateFields;

/** Field creation constructor, automatically set enabled = true to APNS Field
 */
+(nonnull KiiAPNSFields*)createFields;
@end
