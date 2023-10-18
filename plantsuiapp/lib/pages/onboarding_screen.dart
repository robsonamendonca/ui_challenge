// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:plantsuiapp/constants.dart';
import 'package:plantsuiapp/pages/home_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.blackColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Constants.blackColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomePage()));
              }, //to login screen. We will update later
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              createPage(
                image: 'assets/plants_one.png',
                title: Constants.titleOne,
                description: "", //Constants.descriptionOne,
              ),
              createPage(
                image: 'assets/plants_two.png',
                title: Constants.titleTwo,
                description: "",
              ),
              createPage(
                image: 'assets/plants_three.png',
                title: Constants.titleThree,
                description: "",
              ),
            ],
          ),
          Positioned(
            bottom: 290,
            left: 150,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 170,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.blackColor6,
              ),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (currentIndex < 2) {
                        currentIndex++;
                        if (currentIndex < 3) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomePage()));
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 35,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  //Extra Widgets

  //Create the indicator decorations widget
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: isActive ? Constants.blackColor6 : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const createPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 450,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 31,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Constants.primaryColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
