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
      title: 'Flutter Demo',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  child: Text('C'),
                  style: TextStyle(
                    fontSize: 50,
                    color: animated ? Colors.white : Colors.orange,
                  ),
                  duration: Duration(milliseconds: 800),
                ),
                AnimatedDefaultTextStyle(
                  child: Text('O'),
                  style: TextStyle(
                    fontSize: 50,
                    color: animated ? Colors.white : Colors.amber,
                  ),
                  duration: Duration(milliseconds: 800),
                ),
                AnimatedDefaultTextStyle(
                  child: Text('N'),
                  style: TextStyle(
                    fontSize: 50,
                    color: animated ? Colors.white : Colors.orangeAccent,
                  ),
                  duration: Duration(milliseconds: 800),
                ),
                AnimatedDefaultTextStyle(
                  child: Text('G'),
                  style: TextStyle(
                    fontSize: 50,
                    color: animated ? Colors.white : Colors.lightBlue,
                  ),
                  duration: Duration(milliseconds: 800),
                ),
                AnimatedDefaultTextStyle(
                  child: Text('R'),
                  style: TextStyle(
                    fontSize: 50,
                    color: animated ? Colors.white : Colors.redAccent,
                  ),
                  duration: Duration(milliseconds: 800),
                ),
                AnimatedDefaultTextStyle(
                  child: Text('A'),
                  style: TextStyle(
                    fontSize: 50,
                    color: animated ? Colors.white : Colors.purple,
                  ),
                  duration: Duration(milliseconds: 800),
                ),
                AnimatedDefaultTextStyle(
                  child: Text('T'),
                  style: TextStyle(
                    fontSize: 50,
                    color: animated ? Colors.white : Colors.yellow,
                  ),
                  duration: Duration(milliseconds: 800),
                ),
                AnimatedDefaultTextStyle(
                  child: Text('S'),
                  style: TextStyle(
                    fontSize: 50,
                    color: animated ? Colors.white : Colors.green,
                  ),
                  duration: Duration(milliseconds: 800),
                ),
              ],
            ),
            Text(
              'on your new baby!',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '出産おめでとう！！！',
              style: TextStyle(color: Colors.orange),
            ),
            IconButton(
              icon: Icon(Icons.card_giftcard),
              onPressed: () => _launchURL(),
            ),
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
          style: TextStyle(fontSize: 50),
        ),
        Text(
          '出',
          style: TextStyle(fontSize: 50),
        ),
        Text(
          '産',
          style: TextStyle(fontSize: 50),
        ),
        Text(
          '御',
          style: TextStyle(fontSize: 50),
        ),
        Text(
          '祝',
          style: TextStyle(fontSize: 50),
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
        SizedBox(
          height: 60,
        ),
        Text(
          firstName,
          style: TextStyle(fontSize: 50),
        ),
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  myPartnerLastName[0],
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  myPartnerLastName[1],
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  myLastName[0],
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  myLastName[1],
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 50,
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
