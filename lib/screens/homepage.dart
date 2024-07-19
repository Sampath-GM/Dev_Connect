import 'package:flutter/material.dart';
import 'package:we_chat/screens/home_screen.dart';
import 'package:we_chat/screens/technews.dart';
import 'package:we_chat/screens/videocall.dart';
import '../core/theme/colors.dart';
// import 'package:social/features/auth/presentation/pages/contactList.dart';
// import 'package:social/features/auth/presentation/pages/technews.dart';
// import 'package:social/features/auth/presentation/pages/videocall.dart';

class Homepage extends StatefulWidget {
  
  const Homepage({super.key,});
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
            // backgroundColor: CustomColors.greencolor,
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
            title: const Text(
              'DevConnect',
              style: TextStyle(
                  color: CustomColors.greencolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          body: TabBarView(
            children: [
               Container(
                // color: Colors.amber,
                child: const HomeScreen(),
              ),
              Container(
                // color: Colors.yellow,
                child: const TechNewsPage(),
              ),
              Container(
                // color: Colors.green,
               child:  VideoCallPage(),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //     backgroundColor: CustomColors.greencolor,
          //     child: Icon(Icons.my_library_add_outlined),
          //     onPressed: () {
          //       Navigator.of(context).push(
          //           MaterialPageRoute(builder: (context) => ContactListPage()));
          //     })
              ),
    );
  }
}
