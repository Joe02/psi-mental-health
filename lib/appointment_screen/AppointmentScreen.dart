import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors/colors.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  AppointmentScreenState createState() => AppointmentScreenState();
}

class AppointmentScreenState extends State<AppointmentScreen>
    with SingleTickerProviderStateMixin {
  List<Appointment> appointmentsList = [
    Appointment("Antonio Carlos", "15 Jan 2022", "18:00 - 19:10",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
    Appointment("Juliana Fernandes", "17 Jan 2022", "18:00 - 19:10",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
    Appointment("Antonio Carlos", "02 Fev 2022", "18:00 - 19:10",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
    Appointment("Juliana Fernandes", "04 Fev 2022", "18:00 - 19:10",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Consultas",
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
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            height: 5,
            color: Colors.transparent,
          );
        },
        itemCount: appointmentsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: chatListBackgroundColor,
            child: Row(
              children: [
                Flexible(
                  child: ListTile(
                    trailing: InkResponse(
                      onTap: () {
                        showAnnotationsDialog(
                          context,
                          appointmentsList[index].notes,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Icon(
                          Icons.edit,
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        appointmentsList[index].professionalName,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.calendar_month),
                        ),
                        Text(
                          appointmentsList[index].date,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

showAnnotationsDialog(BuildContext context, String labelText) {
  Widget cancelButton = FlatButton(
    child: const Text("Sair"),
    onPressed: () {
      Get.back();
    },
  );

  Widget saveButton = FlatButton(
    child: const Text("Salvar"),
    onPressed: () {
      Get.back();
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Anotações sobre a sessão"),
    content: TextField(
      controller: TextEditingController(text: labelText),
      autofocus: true,
      maxLines: null,
    ),
    actions: [
      cancelButton,
      saveButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class Appointment {
  String professionalName;
  String date;
  String time;
  String notes;

  Appointment(this.professionalName, this.date, this.time, this.notes);
}
