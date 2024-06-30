import 'package:flutter/material.dart';
import 'package:social/features/auth/presentation/pages/individual.dart';
import 'package:social/models/chatmodel.dart';

class Customcard extends StatelessWidget {
  const Customcard({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPage(chatModel: ChatModel(),)));
      },
      child:  Column(
        children: [
           ListTile(
            leading: const CircleAvatar(
              radius: 25,
              // child:chatModel.isGroup?const Icon(Icons.group):const Icon(Icons.person),
              child: Icon(Icons.group),
            ),
             title: Text(chatModel.name??''),
             subtitle: Text(chatModel.currentMessage??''),
             trailing: Text(chatModel.time??''),     
          ),
          Divider(thickness: 0,)
        ],
      ),
    );
  }
}