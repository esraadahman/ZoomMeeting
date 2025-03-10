// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:zoomclone/Core/Theming/Colors/pColors.dart';
// import 'package:zoomclone/Core/Theming/Size/pSize.dart';
// import 'package:zoomclone/views/call_page.dart';

// class DialogBoxWidget extends StatelessWidget {
//   final String callID;

//   const DialogBoxWidget({Key? key, required this.callID}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text(
//         "Meeting Created",
//         style: TextStyle(color: textColor),
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text("Share this Meeting ID:"),
//           size.height(10),
//           Row(
//             children: [
//               Expanded(
//                 child: SelectableText(
//                   callID,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.copy),
//                 onPressed: () {
//                   Clipboard.setData(ClipboardData(text: callID));
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("Meeting ID copied!")),
//                   );
//                 },
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           ElevatedButton.icon(
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => CallPage(callID: callID)),
//               );
//             },
//             icon: const Icon(Icons.video_call, color: buttonColor),
//             label: const Text("Join Meeting",
//                 style: TextStyle(color: buttonColor)),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text("Close", style: TextStyle(color: buttonColor)),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zoomclone/Core/Theming/Colors/pColors.dart';
import 'package:zoomclone/Core/Theming/Size/pSize.dart';
import 'package:zoomclone/views/call_page.dart';

class MeetingBottomSheetCreate extends StatelessWidget {
  final String callID;
  final String userName;
  final String userId;

  const MeetingBottomSheetCreate(
      {Key? key,
      required this.callID,
      required this.userName,
      required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String meetingLink = "https://meet.app/$callID";
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: grayColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Share this joining info with others",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          size.height(10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SelectableText(
                    callID,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: callID));
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text("Meeting link copied!")),
                    // );
                  },
                ),
              ],
            ),
          ),
          size.height(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                 
                   Share.share("Join my meeting: $meetingLink");
                    // Navigator.pop(context); 
                },
                icon: const Icon(
                  Icons.share,
                  color: buttonColorlight,
                ),
                label: const Text(
                  "Share",
                  style: TextStyle(color: textColor),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); // Close bottom sheet
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CallPage(
                              callID: callID,
                              userName: userName,
                              userId: userId,
                            )),
                  );
                },
                icon: const Icon(
                  Icons.video_call,
                  color: buttonColorlight,
                ),
                label: const Text(
                  "Join",
                  style: TextStyle(color: textColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Close",
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
