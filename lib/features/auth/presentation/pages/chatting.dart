import 'package:flutter/material.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Padding(
               padding: const EdgeInsets.only(top:8.0),
               child: const Row(
                 children: [
                   Padding(
                     padding:  EdgeInsets.only(left: 16.0),
                     child: Text("Messages",
                     style: TextStyle(
                      fontSize: 17
                     ),
                     ),
                   ),
                   SizedBox(width: 170,),
                   Text("New Message",
                   style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                   ),
                   )
                 ],
               ),
             ),
             SizedBox(height: 10.0,),
              for(int i=0;i<=14;i++)
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network("https://i.pinimg.com/originals/06/ae/19/06ae195b4206e7b063ab04fe2124e976.jpg")),
                title: const Text("Sangamesh"),
                subtitle: const Text("Hi Sangu how are you"),
              )
            ],
          ),
        ),
      ),
    );
  }
}