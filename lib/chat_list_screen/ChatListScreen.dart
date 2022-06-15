import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_poc/chat_conversation_screen/ChatConversationScreen.dart';
import 'package:mental_health_poc/colors/colors.dart';

class ChatListScreen extends StatefulWidget {
  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatListScreen> {
  List<Professional> professionalsList = [
    Professional(
        'assets/images/antonio_photo.png', "Antonio Carlos", "Psicólogo"),
    Professional(
        'assets/images/juliana_photo.png', "Juliana Fernandes", "Psiquiatra")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Chat",
          style: TextStyle(
            color: Colors.indigo,
          ),
        ),
        centerTitle: true,
        leading: InkResponse(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.indigo,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: professionalsList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkResponse(
            onTap: () {
              Get.to(ChatConversationScreen());
            },
            child: Container(
              color: chatListBackgroundColor,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage(professionalsList[index].photo),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      title: Text(professionalsList[index].name),
                      subtitle: Text(professionalsList[index].role),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Professional {
  String photo;
  String name;
  String role;

  Professional(this.photo, this.name, this.role);
}
