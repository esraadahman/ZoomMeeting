import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoomclone/Core/Routing/routing.dart';
import 'package:zoomclone/Core/Theming/Size/pSize.dart';
import 'package:zoomclone/repo/auth_methods.dart';
import 'package:zoomclone/views/Home/widget/BottomNaviBar.dart';
import 'package:zoomclone/views/Home/widget/CustomAppBar.dart';
import 'package:zoomclone/views/Home/widget/HomeMeetingButton.dart';
import 'package:zoomclone/views/Home/widget/dialogBoxCreate.dart';
import 'package:zoomclone/views/Home/widget/dialogBoxJoin.dart';
import 'package:uuid/uuid.dart';
import 'package:zoomclone/views/meetingHistory/page/meetingHistory.dart';
import 'package:zoomclone/views/profile/page/profile.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _page = 0;

  void onClick(int page) {
    setState(() {
      _page = page;
    });
  }

  String userId = '';
  String username = '';
  String userimage = '';
  final auth = FirebaseAuth.instance;
  Future<void> GetUserInfo() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          username = snapshot.data()!['userName'];
          userimage = snapshot.data()!['profilePhoto'];
          userId = snapshot.data()!['uid'];
        });
      } else {
        print('No data');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    GetUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeContent(userName: username, userId: userId),
      MeetingHistory(),
      Profile(
        userName: username,
        userImage: userimage,
      ),
      const Center(child: Text('Settings')),
    ];
    return Scaffold(
      appBar: const CustomAppBar(title: "Meet & Chat"),
      body: pages[_page],
      bottomNavigationBar: BottomNaviBar(
        currentIndex: _page,
        onClick: onClick,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final String userName;
  final String userId;
  HomeContent({
    super.key,
    required this.userName,
    required this.userId,
  });
  TextEditingController callIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Homemeetingbutton(
              onclick: () {
                // if (callIDController.text.isNotEmpty) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => CallPage(
                //                 callID: callIDController.text,
                //               )));
                // }
                //***************************************** */
                // context.navigateTo(CallPage());
                final String callID = Uuid().v4(); // Generate a unique call ID
                //  String callID = "7ddaa318-677a-48b1-b75f-3be4dfd42fd6";
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => MeetingBottomSheetCreate(
                      callID: callID,
                      userName: userName,
                      userId: userId.toString()),
                );
              },
              icon: Icons.videocam,
              text: "New Meeting",
            ),
            Homemeetingbutton(
              onclick: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => MeetingBottomSheetJoin(
                    userName: userName,
                    userId: userId,
                  ),
                );
              },
              icon: Icons.add_box_rounded,
              text: "Join Meeting",
            ),
            Homemeetingbutton(
              onclick: () {},
              icon: Icons.calendar_today,
              text: "Scedule ",
            ),
            Homemeetingbutton(
              onclick: () {},
              icon: Icons.arrow_upward_rounded,
              text: "Share Screen",
            ),
          ],
        ),
        const Expanded(
            child: Center(
                child: const Text(
          "Create/Join Meetings\n    with just a click!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        )))
      ],
    );
  }
}
