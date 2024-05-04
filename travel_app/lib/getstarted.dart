import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/getStartedScreens/start-1.dart';
import 'package:travel_app/getStartedScreens/start-2.dart';
import 'package:travel_app/login1.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            children: const [
              StartPage1(),
              StartPage2(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(1);
                  },
                  child: Text('Skip'),
                ),
                SmoothPageIndicator(controller: _controller, count: 2),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                        child: Text('Done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('Next'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
