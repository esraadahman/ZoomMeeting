import 'package:flutter/material.dart';
import 'package:zoomclone/Core/Theming/Colors/pColors.dart';
import 'package:zoomclone/Core/Theming/Size/pSize.dart';
import 'package:zoomclone/repo/auth_methods.dart';

class Profile extends StatefulWidget {
  final String userName;
  final String userImage;
  const Profile({super.key, required this.userName, required this.userImage});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: width(context) / 10,
              backgroundImage: NetworkImage(widget.userImage),
            ),
          ),
          size.height(15),
          Text(
            'User Name :     ${widget.userName}',
            style: const TextStyle(
              color: textColor,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          size.height(10),
        ]),
      ),
    );
  }
}
