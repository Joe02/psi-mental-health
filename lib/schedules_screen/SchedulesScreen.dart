import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors/colors.dart';

class SchedulesScreen extends StatefulWidget {
  @override
  SchedulesScreenState createState() => SchedulesScreenState();
}

class SchedulesScreenState extends State<SchedulesScreen>
    with SingleTickerProviderStateMixin {
  List<Schedule> schedulesList = [
    Schedule("Antonio Carlos", "16 Fev 2022", "18:00 - 19:10"),
    Schedule("Juliana Fernandes", "18 Fev 2022", "18:00 - 19:10"),
    Schedule("Antonio Carlos", "01 Mar 2022", "18:00 - 19:10"),
    Schedule("Juliana Fernandes", "03 Mar 2022", "18:00 - 19:10")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Agendamentos",
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
            height: 3,
            color: Colors.transparent,
          );
        },
        itemCount: schedulesList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: chatListBackgroundColor,
            child: Row(
              children: [
                Flexible(
                  child: ListTile(
                    trailing: const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Icon(
                        Icons.access_alarm_rounded,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        schedulesList[index].professionalName,
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
                          schedulesList[index].date +
                              " - " +
                              schedulesList[index].time,
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

class Schedule {
  String professionalName;
  String date;
  String time;

  Schedule(this.professionalName, this.date, this.time);
}
