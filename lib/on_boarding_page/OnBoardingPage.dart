import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_poc/colors/colors.dart';
import 'package:mental_health_poc/components/DefaultButton.dart';
import 'package:mental_health_poc/strings/strings.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import '../login_screen/LoginScreen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final onBoardingPageViewController = PageController(initialPage: 0);
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onBoardingBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.85,
              child: PageView(
                controller: onBoardingPageViewController,
                onPageChanged: (pageIndex) {
                  _currentPageNotifier.value = pageIndex;
                },
                children: [
                  buildFirstOnBoardingScreen(),
                  buildSecondOnBoardingScreen(),
                ],
              ),
            ),
            CirclePageIndicator(
              size: 10,
              selectedSize: 20,
              selectedDotColor: Colors.black,
              dotColor: Colors.grey,
              dotSpacing: 20,
              itemCount: 2,
              currentPageNotifier: _currentPageNotifier,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: DefaultButton(
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 5,
                    vertical: 10.0,
                  ),
                  child: const Text(
                    nextScreen,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                () {
                  if (_currentPageNotifier.value == 0) {
                    onBoardingPageViewController.nextPage(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeInToLinear,
                    );
                  } else {
                    Get.offAll(LoginScreen());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

buildFirstOnBoardingScreen() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 30.0,
          ),
          child: Image.asset(
            'assets/images/onBoarding_first_image.png',
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: ListTile(
            title: Text(
              onBoardingFirstPageTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                top: 16.0,
              ),
              child: Text(
                onBoardingFirstPageSubTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

buildSecondOnBoardingScreen() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 30.0,
          ),
          child: Image.asset(
            'assets/images/onBoarding_second_image.png',
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: ListTile(
            title: Text(
              onBoardingSecondPageTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 5),
              child: Text(
                onBoardingSecondPageSubTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
