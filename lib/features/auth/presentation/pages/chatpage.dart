import 'package:flutter/material.dart';
import 'package:social/customUI/custocard.dart';
import 'package:social/models/chatmodel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatModel> chats = [
    ChatModel(
      isGroup: false,
      icon: Icon(Icons.group,color: Colors.black,),
      name: "Sampath",
      currentMessage: "this is demo message",
      time: "21:87"
    ),
    
      ChatModel(
      isGroup: false,
      icon: Icon(Icons.abc),
      name: "Arjun",
      currentMessage: "Hi arjun how are you",
      time: "1:87"
    ),
      ChatModel(
      isGroup: false,
      icon: Icon(Icons.abc),
      name: "Roopesh",
      currentMessage: "How are you",
      time: "12:87"
    ),
      ChatModel(
      isGroup: false,
      icon: Icon(Icons.abc),
      name: "Sangamesh",
      currentMessage: "wish you happy birthday",
      time: "21:87"
    ),
      ChatModel(
      isGroup: false,
      icon: Icon(Icons.abc),
      name: "Prasad",
      currentMessage: "Thank You",
      time: "08:87"
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context,index)=>Customcard(chatModel: chats[index],))
      ));
  }
}
