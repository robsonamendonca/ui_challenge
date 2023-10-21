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
        children: [
          Positioned(
            bottom: 400,
            left: (MediaQuery.of(context).size.width - 150) / 2,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              createPage(
                image: 'assets/plant-one.png',
                title: Constants.titleOne,
              ),
              createPage(
                image: 'assets/plant-two.png',
                title: Constants.titleTwo,
              ),
              createPage(
                image: 'assets/plant-three.png',
                title: Constants.titleThree,
              ),
            ],
          ),
          _botaoCirculo()
        ],
      ),
    );
  }

  //Extra Widgets

  //Create the indicator decorations widget
  Widget _indicator(bool isActive) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 10.0,
        width: isActive ? 20 : 8,
        margin: const EdgeInsets.only(right: 5.0),
        decoration: BoxDecoration(
          color: isActive ? Constants.blackColor6 : Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
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

  _botaoCirculo() {
    return Positioned(
      bottom: 70,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(33),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Constants.blackColor6,
          ),
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
              alignment: Alignment.center, // Centraliza o ícone no botão
              onPressed: () {
                setState(() {
                  if (currentIndex < 2) {
                    currentIndex++;
                    if (currentIndex < 3) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      ),
                    );
                  }
                });
              },
              icon: const Icon(
                Icons.arrow_forward,
                size: 52,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class createPage extends StatelessWidget {
  final String image;
  final String title;

  const createPage({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 220),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 480,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 43,
              fontWeight: FontWeight.normal,
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
