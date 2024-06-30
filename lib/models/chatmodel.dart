import 'package:flutter/material.dart';

class ChatModel{
  bool? isGroup;
  Icon? icon;
  String? name;
  String? currentMessage;
  String? time;

  ChatModel({
    this.name,this.icon,this.currentMessage,this.isGroup,this.time
  });
}