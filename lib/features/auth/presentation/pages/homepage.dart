import 'package:flutter/material.dart';
import 'package:social/features/auth/presentation/pages/chatpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange[300],
            bottom: const TabBar(tabs: [
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'DEV',
              ),
              Tab(
                text: 'CALLS',
              )
            ]),
            title: const Text('DevConnect'),
            actions: [
             const Padding(
                padding:  EdgeInsets.only(left: 10.0),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 20.0),
                child: PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) {
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
              )
            ],
          ),
          body: TabBarView(
            children: [
              Container(
                // color: Colors.amber,
                child: const ChatPage(),
              ),
              Container(
                // color: Colors.yellow,
                child: const Center(child: Text("this is techupdates")),
              ),
              Container(
                // color: Colors.green,
                child: const Center(child: Text("this is calls")),
              ),
            ],
          ),
        ));
  }
}
