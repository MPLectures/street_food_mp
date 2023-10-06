import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:street_food_mp/views/screens/screen_singup.dart';

class ScreenOnBoarding extends StatefulWidget {
  @override
  State<ScreenOnBoarding> createState() => _ScreenOnBoardingState();
}

class _ScreenOnBoardingState extends State<ScreenOnBoarding> {
  int? pageIndex;

  PageController _controller = PageController(initialPage: 0);

  List<String> images = [
    'assets/images/Group.png',
    'assets/images/purepng.png',
    'assets/images/purepngaa.png',
  ];

  List<String> titleText = [
    'Get all the healthy recipes that you need',
    'Get the exact nutrition value of everything you eat',
    'Get daily calorie target based on your body weight',
  ];

  List<String> subTitleText = [
    'Whether you are losing or gaining. we have all the recipes you’ll need.',
    'We are updating our food database every minute to help you track your calories',
    "Set your target weight and select your monthly schedule, and we’ill do the rest",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: Center(
      //   child: Column(
      //     children: [
      //       Container(
      //         height: 200,
      //         width: 200,
      //         color: Colors.teal,
      //         child: PageView.builder(
      //           scrollDirection: Axis.vertical,
      //           itemCount: containerColors.length,
      //           itemBuilder: (context, index) => Container(
      //             color: containerColors[index],
      //
      //           ),
      //         ),
      //       ),
      //
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
            child: pageIndex == 2
                ? null
                : GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenSingUp(),
                          ));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        itemCount: images.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40.h,
                width: 40.h,
                child: Image.asset(images[index]),
              ),
              Column(
                children: [
                  Text(
                    titleText[index],
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Text(
                    subTitleText[index],
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      pageIndex == 2
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenSingUp(),
                              ))
                          : _controller.nextPage(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.bounceIn,
                            );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        // shape: BoxShape.circle
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: pageIndex == 2 ? 40.sp : 9.sp,
                          vertical: 9.sp,
                        ),
                        child: pageIndex == 2
                            ? Text(
                                "Get Started",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            : Icon(Icons.arrow_forward),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: (){},
      //   label: Text("x"),
      // ),
    );
  }
}
