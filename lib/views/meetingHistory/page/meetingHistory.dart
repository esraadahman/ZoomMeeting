import 'package:flutter/material.dart';
import 'package:zoomclone/Core/Theming/Colors/pColors.dart';
import 'package:zoomclone/repo/auth_methods.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingHistory extends StatefulWidget {
  const MeetingHistory({super.key});

  @override
  State<MeetingHistory> createState() => _MeetingHistoryState();
}

class _MeetingHistoryState extends State<MeetingHistory> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthMethods.meetingsHistory,
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No meeting history found"));
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var meetingData = snapshot.data!.docs[index].data();
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: ListTile(
                title: Text(
                  'Room ID:\n${meetingData['callID']}',
                ),
                subtitle: Text(
                  'Joined on ${meetingData['startTime'] != null ? DateFormat.yMMMd().format(meetingData['startTime'].toDate()) : 'Unknown'}',
                  style: TextStyle(color: grayColor),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
