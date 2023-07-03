import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  final String callID;
  final String userId;
  final String userName;
  const CallPage({Key? key, required this.callID, required this.userId, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID:
            1162427575, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign:
            "a2d1b0b9625ed3e143bebe0f144f2af87986503364388734b4978201af6389aa", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userId,
        userName: userName,
        callID: callID,
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
          ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
      ),
    );
  }
}
