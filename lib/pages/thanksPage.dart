import 'package:flutter/material.dart';
import 'package:mindDiary/constent/constent.dart';
import 'package:mindDiary/pages/home.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              child: Image.asset('images/thanks.png'),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              'Thank You !',
              style: CboldTxt,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Welcome to my App',
              style: CNormalTxt,
            ),
            SizedBox(
              height: 70.0,
            ),
            SizedBox(
              width: 380.0,
              height: 60.0,
              child: RaisedButton(
                color: Color(0xff3C82FF),
                child: Text(
                  'Let\'s go ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
