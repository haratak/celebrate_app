import 'dart:async';

import 'package:celeblation_app/const.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '恵美ちゃん爆誕祝',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: controller,
        children: [
          CelebratePage(),
          SecondPage(),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Timer _timer;
  int _currentSeconds;
  bool animated = false;

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    final workMinuts = 5;
    _currentSeconds = workMinuts * 60;

    _timer = countTimer();
  }

  Timer countTimer() {
    return Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_currentSeconds < 1) {
          timer.cancel();
        } else {
          setState(() {
            _currentSeconds = _currentSeconds - 1;
            if (_currentSeconds % 2 == 1) {
              animated = true;
            } else {
              animated = false;
            }
            print(_currentSeconds);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFC9D2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedDefaultTextStyle(
                    child: Text('C'),
                    style: TextStyle(
                        fontSize: 50,
                        color: animated ? Colors.white : Colors.orange,
                        fontFamily: 'Hanalei-Regular'),
                    duration: Duration(milliseconds: 800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedDefaultTextStyle(
                    child: Text('O'),
                    style: TextStyle(
                        fontSize: 50,
                        color: animated ? Colors.white : Colors.amber,
                        fontFamily: 'Hanalei-Regular'),
                    duration: Duration(milliseconds: 800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedDefaultTextStyle(
                    child: Text('N'),
                    style: TextStyle(
                        fontSize: 50,
                        color: animated ? Colors.white : Colors.orangeAccent,
                        fontFamily: 'Hanalei-Regular'),
                    duration: Duration(milliseconds: 800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedDefaultTextStyle(
                    child: Text('G'),
                    style: TextStyle(
                        fontSize: 50,
                        color: animated ? Colors.white : Colors.lightBlue,
                        fontFamily: 'Hanalei-Regular'),
                    duration: Duration(milliseconds: 800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedDefaultTextStyle(
                    child: Text('R'),
                    style: TextStyle(
                        fontSize: 50,
                        color: animated ? Colors.white : Colors.redAccent,
                        fontFamily: 'Hanalei-Regular'),
                    duration: Duration(milliseconds: 800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedDefaultTextStyle(
                    child: Text('A'),
                    style: TextStyle(
                        fontSize: 50,
                        color: animated ? Colors.white : Colors.purple,
                        fontFamily: 'Hanalei-Regular'),
                    duration: Duration(milliseconds: 800),
                  ),
                ),
                AnimatedDefaultTextStyle(
                  child: Text('T'),
                  style: TextStyle(
                      fontSize: 50,
                      color: animated ? Colors.white : Colors.yellow,
                      fontFamily: 'Hanalei-Regular'),
                  duration: Duration(milliseconds: 800),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedDefaultTextStyle(
                    child: Text('S'),
                    style: TextStyle(
                        fontSize: 50,
                        color: animated ? Colors.white : Colors.green,
                        fontFamily: 'Hanalei-Regular'),
                    duration: Duration(milliseconds: 800),
                  ),
                ),
              ],
            ),
            Text(
              'on your new baby!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'ArchitectsDaughter-Regular'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '出産おめでとう！\nささやかですが、お祝いの品を贈ります。\n少しだけど、2人で食べてゆったり休んでね。\n$babyName\ちゃん👶に会える日を楽しみにしてまっせ！',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                child: IconButton(
                  icon: Icon(
                    Icons.card_giftcard,
                    size: 40,
                  ),
                  onPressed: () => _launchURL(),
                ),
              ),
            ),
            Text('/ Tap Me!! \\ '),
            Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Created by $myEnglishName and $myPartnerEnglishName with Flutter.'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class CelebratePage extends StatefulWidget {
  @override
  _CelebratePageState createState() => _CelebratePageState();
}

class _CelebratePageState extends State<CelebratePage> {
  double height = 100;
  double width = 100;
  double bottomHeight = 50;
  double bottomWidth = 50;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(),
        ),
        Text(
          '御',
          style: TextStyle(fontSize: 30, fontFamily: 'SawarabiMincho-Regular'),
        ),
        Text(
          '出',
          style: TextStyle(fontSize: 30, fontFamily: 'SawarabiMincho-Regular'),
        ),
        Text(
          '産',
          style: TextStyle(fontSize: 30, fontFamily: 'SawarabiMincho-Regular'),
        ),
        Text(
          '御',
          style: TextStyle(fontSize: 30, fontFamily: 'SawarabiMincho-Regular'),
        ),
        Text(
          '祝',
          style: TextStyle(fontSize: 30, fontFamily: 'SawarabiMincho-Regular'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              painter: TopLeft(),
              child: Container(
                height: height,
                width: width,
              ),
            ),
            CustomPaint(
              painter: TopRight(),
              child: Container(
                height: height,
                width: width,
              ),
            ),
          ],
        ),
        Container(
          child: Container(
            width: double.infinity,
            height: 5.0,
            padding: EdgeInsets.all(8.0),
            color: Colors.red,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              painter: BottomLeft(),
              child: Container(
                height: bottomHeight,
                width: bottomWidth,
              ),
            ),
            CustomPaint(
              painter: BottomRight(),
              child: Container(
                height: bottomHeight,
                width: bottomWidth,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            firstName,
            style:
                TextStyle(fontSize: 30, fontFamily: 'SawarabiMincho-Regular'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  myPartnerLastName[0],
                  style: TextStyle(
                      fontSize: 30, fontFamily: 'SawarabiMincho-Regular'),
                ),
                Text(
                  myPartnerLastName[1],
                  style: TextStyle(
                      fontSize: 30, fontFamily: 'SawarabiMincho-Regular'),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  myLastName[0],
                  style: TextStyle(
                      fontSize: 30, fontFamily: 'SawarabiMincho-Regular'),
                ),
                Text(
                  myLastName[1],
                  style: TextStyle(
                      fontSize: 30, fontFamily: 'SawarabiMincho-Regular'),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: SizedBox(),
        ),
        Container(
          height: 30,
          width: 30,
          child: Transform.rotate(
            angle: 4.7,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'SWIPE UP!!',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}

class TopLeft extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();
    paint = new Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    path = Path();
    path.moveTo(size.width, size.height);
    path.cubicTo(size.width * 0.25, size.height * 0.75, size.width * 0.75,
        size.height * 0.25, size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TopRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();
    paint = new Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    path = Path();
    path.moveTo(0, size.height);
    path.cubicTo(size.width * 0.75, size.height * 0.75, size.width * 0.25,
        size.width * 0.25, 0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BottomLeft extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();
    paint = new Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    path = Path();
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(size.width / 2, size.height, 0, size.height / 1.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BottomRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();
    paint = new Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height, 50, size.height / 1.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
