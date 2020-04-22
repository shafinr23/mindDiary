import 'package:flutter/material.dart';
import 'package:loginp/auth/login.dart';
import 'package:loginp/constent/constent.dart';
import 'package:loginp/thanksPage.dart';

class SingUpPage extends StatelessWidget {
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
            'Sing Up',
            style: CboldTxt,
          ),
          Text(
            'Please Sing up To enter in a App.',
            style: CNormalTxt,
          ),
          SizedBox(
            height: 50.0,
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
            height: 25.0,
          ),
          Text(
            'or Sing Up with Email',
            style: CNormalTxt,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE2E6EA), width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE2E6EA), width: 1.0),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  //borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
            child: TextField(
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black87,
              ),
              decoration: CDecorationforInput,
            ),
          ),
          SizedBox(
            height: 15.0,
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
                  MaterialPageRoute(builder: (context) => ThankYouPage()),
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
                ' have an account ? ',
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
