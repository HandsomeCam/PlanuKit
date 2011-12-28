//
//  NuLoginRequest.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/21/11.
//  Copyright 2011 Roboboogie Studios. All rights reserved.
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

@protocol NuLoginRequestDelegate <NSObject>

- (void)loginSucceededWith:(NSString*) ApiKey;
- (void)loginFailedWith:(NSString*) Reason;

@end
 

@interface NuLoginRequest : NSObject
{
@private
    id<NuLoginRequestDelegate> delegate;
    NSMutableData* receivedData;
}

- (void)performLoginWithUsername:(NSString*)username withPassword:(NSString*)password withDelegate:(id<NuLoginRequestDelegate>)delegate;

@end
