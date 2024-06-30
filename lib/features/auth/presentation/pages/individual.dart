import 'package:flutter/material.dart';
import 'package:social/models/chatmodel.dart';

class IndividualPage extends StatelessWidget {
  const IndividualPage({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 20,
                child: Icon(Icons.group),
              ),
            ),
          ],
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Column(
            children: [
              Text(
                "Full stack",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "demo",
                style: TextStyle(
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.video_call_sharp),
          ),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.call),
          ),
          PopupMenuButton<String>(itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                child: Text("New Group"),
                value: "New Grouo",
              ),
              const PopupMenuItem(
                child: Text("New brodcast"),
                value: "New brodcast",
              ),
              const PopupMenuItem(
                child: Text("starred messages"),
                value: "starred messages",
              ),
              const PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              ),
            ];
          }),
        ],
      ),
    );
  }
}
