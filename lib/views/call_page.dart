import 'dart:math';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zoomclone/constants/constants.dart';
import 'package:zoomclone/repo/auth_methods.dart';

class CallPage extends StatefulWidget {
  const CallPage(
      {Key? key,
      required this.callID,
      required this.userName,
      required this.userId})
      : super(key: key);
  final String callID;
  final String userName;
  final String userId;

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  void initState() {
    super.initState();
    AuthMethods.saveMeetingToHistory(
        widget.userId, widget.callID, widget.userName);
  }

  @override
  Widget build(BuildContext context) {
    // final userId = Random().nextInt(9999);
    AuthMethods.saveMeetingToHistory(
        widget.callID, widget.userName, widget.userId);
    return ZegoUIKitPrebuiltCall(
      appID: Constants
          .appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: Constants
          .appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: widget.userId,
      userName: widget.userName,
      callID: widget.callID,
      // When two or more users use the same callID, they will join the same call session.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
