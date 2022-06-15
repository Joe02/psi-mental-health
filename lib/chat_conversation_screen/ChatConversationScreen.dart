import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_poc/colors/colors.dart';

class ChatConversationScreen extends StatefulWidget {
  @override
  ChatConversationScreenState createState() => ChatConversationScreenState();
}

class ChatConversationScreenState extends State<ChatConversationScreen> {
  List<Message> messagesList = [
    Message("Tudo certo para a consulta de amanhã?"),
    Message("Tudo sim! Confirmado."),
    Message("Perfeito, fico no aguardo amanhã."),
    Message("Ok, estarei lá!"),
  ];
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Antônio",
          style: TextStyle(
            color: Colors.black,
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
      body: Container(
        height: 8000,
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messagesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: index == 0 || index == 2
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Card(
                        color: index == 0 || index == 2
                            ? homeScreenCardBackgroundColor
                            : Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            messagesList[index].text,
                            style: TextStyle(
                                color: index == 0 || index == 2
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: onBoardingBackgroundColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 4),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: "Escreva sua mensagem...",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      suffixIcon: InkResponse(
                        onTap: () {
                          setState(() {
                            messagesList
                                .add(Message(textEditingController.text));
                            textEditingController.clear();
                          });
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: EdgeInsets.only(top: 15, left: 5),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey.shade100)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  String text;

  Message(this.text);
}
