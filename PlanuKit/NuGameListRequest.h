//
//  NuGameListRequest.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/22/11.
//  Copyright 2011 Srs Biznas, LLC. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import <Foundation/Foundation.h>

@class NuGameListRequest;

@protocol NuGameListRequestDelegate <NSObject>

- (void)gameRequest:(NuGameListRequest*)request succeededWith:(NSArray*)games;
- (void)gameRequest:(NuGameListRequest*)request failedWith:(NSString*)reason;

@end

enum GameStatus {
    Joining = 1,
    Running = 2,
    Finished = 3,
    Hold = 4
    };

@interface NuGameListRequest : NSObject
{

enum GameStatus gameStatus;

@private
    id<NuGameListRequestDelegate> delegate;
    NSMutableData* receivedData;
}

@property (nonatomic, assign) enum GameStatus gameStatus;

- (void)requestGamesFor:(NSString*)username
             withStatus:(enum GameStatus)status
           withDelegate:(id<NuGameListRequestDelegate>)delegate;

@end


