import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_poc/appointment_screen/AppointmentScreen.dart';
import 'package:mental_health_poc/chat_list_screen/ChatListScreen.dart';
import 'package:mental_health_poc/colors/colors.dart';
import 'package:mental_health_poc/schedules_screen/SchedulesScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final homeScreenViewController = PageController(initialPage: 0);
  final _currentPageNotifier = ValueNotifier<int>(0);
  List<HomeScreenGridViewItem> itemsList = [];

  @override
  void initState() {
    super.initState();
    itemsList.add(HomeScreenGridViewItem(
      "Chat",
      const Icon(
        Icons.chat_rounded,
        size: 50,
        color: defaultButtonColor,
      ),
    ));
    itemsList.add(HomeScreenGridViewItem(
      "Consulta",
      const Icon(
        Icons.people,
        size: 50,
        color: defaultButtonColor,
      ),
    ));
    itemsList.add(HomeScreenGridViewItem(
      "Agendamentos",
      const Icon(
        Icons.calendar_today,
        size: 50,
        color: defaultButtonColor,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginBackgroundColor,
      bottomNavigationBar: StatefulBuilder(
        builder: (context, widgetStateSetter) {
          return BottomNavigationBar(
            currentIndex: _currentPageNotifier.value,
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    widgetStateSetter(() {
                      _currentPageNotifier.value = 0;
                      homeScreenViewController.jumpToPage(0);
                    });
                  },
                  icon: const Icon(
                    Icons.house,
                  ),
                ),
                label: "Início",
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    widgetStateSetter(() {
                      _currentPageNotifier.value = 1;
                      homeScreenViewController.jumpToPage(1);
                    });
                  },
                  icon: const Icon(
                    Icons.chat,
                  ),
                ),
                label: "Comunicação",
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    widgetStateSetter(() {
                      _currentPageNotifier.value = 2;
                      homeScreenViewController.jumpToPage(2);
                    });
                  },
                  icon: const Icon(
                    Icons.person,
                  ),
                ),
                label: "Perfil",
              ),
            ],
          );
        },
      ),
      body: PageView(
        controller: homeScreenViewController,
        onPageChanged: (pageIndex) {
          setState(() {
            _currentPageNotifier.value = pageIndex;
          });
        },
        children: [
          buildHomeScreen(),
          buildCommunicationScreen(),
          buildProfileScreen()
        ],
      ),
    );
  }

  buildHomeScreen() {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  "Seja bem vindo, João",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40.0,
              ),
              child: Card(
                color: homeScreenCardBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 20.0,
                        ),
                        child: Text(
                          "Como você está se sentindo?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/Emojis.png',
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/mood_graphics.png',
              ),
            )
          ],
        ),
      ),
    );
  }

  buildCommunicationScreen() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 2
                    : 3,
            children: List.generate(
              3,
              (index) {
                return InkResponse(
                  onTap: () {
                    if (index == 0) {
                      Get.to(
                        ChatListScreen(),
                      );
                    } else if (index == 1) {
                      Get.to(
                        AppointmentScreen(),
                      );
                    } else {
                      Get.to(
                        SchedulesScreen(),
                      );
                    }
                  },
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: loginBackgroundColor,
                      elevation: 5,
                      child: Container(
                        height: 170,
                        width: 170,
                        child: Center(
                          child: ListTile(
                            title: itemsList[index].itemIcon,
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                itemsList[index].itemLabel,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  buildProfileScreen() {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: defaultButtonColor,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35.0,
                  vertical: 25.0,
                ),
                child: Text(
                  "J",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            const Flexible(
              child: ListTile(
                title: Text(
                  "João Silva",
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  "Joaosilva@gmail.com",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            buildProfileListItem(
                "Dados do profissional",
                const Icon(
                  Icons.person,
                  color: defaultButtonColor,
                )),
            buildProfileListItem(
                "Agendamentos",
                InkResponse(
                  onTap: () {
                    Get.to(SchedulesScreen());
                  },
                  child: const Icon(
                    Icons.calendar_today_outlined,
                    color: defaultButtonColor,
                  ),
                )),
            buildProfileListItem(
                "Trocar senha",
                InkResponse(
                  onTap: () {
                    showChangePasswordDialog(context);
                  },
                  child: const Icon(
                    Icons.lock,
                    color: defaultButtonColor,
                  ),
                )),
            buildProfileListItem(
                "Sair",
                InkResponse(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                )),
          ],
        ),
      )
    ]);
  }

  showChangePasswordDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: const Text("Cancelar"),
      onPressed: () {
        Get.back();
      },
    );

    Widget continueButton = FlatButton(
      child: const Text("Trocar"),
      onPressed: () {
        Get.back();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Mudar senha"),
      content: const TextField(
        decoration: InputDecoration(hintText: "Nova senha"),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  buildProfileListItem(label, icon) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Visibility(
              visible: label != "Sair",
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeScreenGridViewItem {
  String itemLabel;
  Icon itemIcon;

  HomeScreenGridViewItem(this.itemLabel, this.itemIcon);
}
