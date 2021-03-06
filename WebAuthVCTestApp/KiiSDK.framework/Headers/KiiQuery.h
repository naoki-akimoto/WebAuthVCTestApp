//
//  KiiQuery.h
//  KiiSDK-Private
//
//  Created by Chris Beauchamp on 1/25/12.
//  Copyright (c) 2012 Kii Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KiiClause;


/** A class to handle queries against the data store.
 
 This class gives an application the opportunity to query the server for a refined set of results. A query must be initialized with a collection (class) to query against, can be composed of various attributes, and must contain a <KiiClause> for its main definition.
 */
@interface KiiQuery : NSObject
NS_ASSUME_NONNULL_BEGIN

/** The file container being queried. nil if querying for objects. */
@property (readonly,nullable) NSString * sortField;

/** The maximum number of items to be returned
 This limit behaves in a best effort way.
 Actual number of the items in the response could be smaller than the limit.
 (But never exceeds.)
 If the specified limit is greater than the limit of the server or limit
 is 0, limit of the server will be applied.
 */
@property (nonatomic, assign) unsigned int limit;

/** TRUE if the result set should be sorted in descending order */
@property (readonly) BOOL sortDescending;


/** Create a KiiQuery object based on a <KiiClause>
 
 By passing nil as the 'clause' parameter, all objects can be retrieved.
 
 @param clause The <KiiClause> to be executed with the query
 */
+ (KiiQuery*) queryWithClause:(nullable KiiClause*)clause;


/**
 Create KiiQuery from Dictionary

 You may not use this method.

 This is introduced for internal use.
 
 @param queryDict Dictionary represents query. Should be equivalent to JSON object constructed for query REST api.
 @return KiiQuery instance
 
 */
+ (KiiQuery*) queryWithDictionary:(nullable NSDictionary *)queryDict;


/** Set the query to sort by a field in descending order
 
 If a sort has already been set, it will be overwritten.
 @param field The key that should be used to sort
 */
- (void) sortByDesc:(NSString*)field;


/** Set the query to sort by a field in ascending order
 
 If a sort has already been set, it will be overwritten.
 @param field The key that should be used to sort
 */
- (void) sortByAsc:(NSString*)field;
NS_ASSUME_NONNULL_END
@end
