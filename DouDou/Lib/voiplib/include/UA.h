//
//  UA.h
//  MacUserAgentOc++
//
//  Created by webrtc.carat on 8/9/16.
//  Copyright © 2016 webrtc.caratel. All rights reserved.
//

#import <Foundation/Foundation.h>


@class UA;
@class RTCVideoTrack;

@protocol UADelegate <NSObject>

- (void) didRegisterSuccess;
- (void) didRegisterFailure:(int)failureCode reason:(NSString *)reason;
#if 1
- (void) didInviteIncoming:(int)callId caller:(NSString *)caller;
- (void) didInviteTrying:(int)callId;
- (void) didInviteRinging:(int)callId;
- (void) didInviteClosed:(int)callId;
- (void) didInviteAnswerd:(int)callId;
- (void) didInviteConnected:(int)callId;
- (void) didInviteFailure:(int)callId code:(int)code reason:(NSString *)reason;
#endif

- (void) didReceiveLocalVideoTrack: (RTCVideoTrack *) videoTrack;
- (void) didReceiveRemoteVideoTrack: (RTCVideoTrack *) videoTrack;
- (void) didError:(NSError *) error;

@end

@interface UA : NSObject

@property(nonatomic,weak) id<UADelegate> delegate;

- (instancetype)initWithDelegate:(id<UADelegate>)delegate;

- (int) setUser:(NSString *)username password:(NSString *)password
         domain:(NSString *)domain port:(int)port;
- (int) register;
- (int) unregister;
- (void) setRegistered:(BOOL) state;
- (int) call:(NSString *)callee;
- (int) accept:(int)callId;
- (int) reject:(int)callId;
- (int) hangup:(int)callId;

@end
