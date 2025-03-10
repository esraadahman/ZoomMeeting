import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoomclone/Core/Routing/routing.dart';
import 'package:zoomclone/Core/Theming/Colors/pColors.dart';
import 'package:zoomclone/Core/Theming/Size/pSize.dart';
import 'package:zoomclone/views/call_page.dart';

class MeetingBottomSheetJoin extends StatelessWidget {
  final String userName;
  final String userId;
  MeetingBottomSheetJoin(
      {Key? key, required this.userName, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController callIDController = TextEditingController();

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Enter the code provided by meeting organizer",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            size.height(10),
            TextFormField(
              decoration: InputDecoration(
                fillColor: backgroundColor,
                filled: true,
                hintText: "Enter Meeting ID",
                prefixIcon: const Icon(Icons.videocam),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: callIDController,
            ),
            size.height(10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                if (callIDController.text.isNotEmpty) {
                  context.navigateTo(CallPage(
                    callID: callIDController.text,
                    userName: userName,
                    userId: userId,
                  ));
                }
              },
              icon: const Icon(Icons.video_call, color: buttonColorlight),
              label: const Text("Join", style: TextStyle(color: textColor)),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close", style: TextStyle(color: textColor)),
            ),
          ],
        ),
      ),
    );
  }
}
