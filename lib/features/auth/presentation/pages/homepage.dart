import 'package:flutter/material.dart';
import 'package:social/features/auth/presentation/pages/chatting.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
       child: Scaffold(
        appBar: AppBar(
          backgroundColor:  Colors.orange[300],
          bottom: const TabBar(
            tabs: [
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
            title:const Text('DevConnect'),
            actions: [
               Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0,right: 20.0),
                child: Icon(Icons.more_vert),
              )
            ],
        ),
        body: TabBarView(
          children: [
             Container(
              // color: Colors.amber,
              child:const ChattingPage(),
            ),
             Container(
              // color: Colors.yellow,
              child:const Center(child: Text("this is techupdates")),
            ),
             Container(
              // color: Colors.green,
              child:const Center(child: Text("this is calls")),
            ),

          ],
        ),
       ));
  }
}