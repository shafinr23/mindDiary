import 'package:flutter/material.dart';
import 'package:mindDiary/auth/login.dart';
import 'package:mindDiary/auth/singup.dart';

import '../constent/constent.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
    );
  }

  _buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'WELCOME',
            style: CboldTxt,
          ),
          Text(
            'Please login or sign up to continue using our app.',
            style: CNormalTxt,
          ),
          Container(
            width: 300,
            child: Image.asset('images/group.png'),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Enter Via Social network',
            style: CNormalTxt,
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 180.0,
                height: 60.0,
                child: RaisedButton(
                  color: Color(0xff76A9EA),
                  child: Image.asset('images/twitter.png'),
                  onPressed: () {
                    print('twitter');
                  },
                ),
              ),
              SizedBox(
                width: 180.0,
                height: 60.0,
                child: RaisedButton(
                  color: Color(0xff475993),
                  child: Image.asset('images/facebook.png'),
                  onPressed: () {
                    print('facebook');
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'or login with Email',
            style: CNormalTxt,
          ),
          SizedBox(
            height: 40.0,
          ),
          SizedBox(
            width: 380.0,
            height: 60.0,
            child: RaisedButton(
              color: Color(0xff3C82FF),
              child: Text(
                'Sing Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SingUpPage()),
                );
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Don\'t have an account ? ',
                style: CNormalTxt,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xff3C82FF),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
