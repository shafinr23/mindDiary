import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindDiary/auth/login.dart';
import 'package:mindDiary/constent/constent.dart';
import 'package:mindDiary/services/auth.dart';
import 'package:provider/provider.dart';

class SingUpPage extends StatefulWidget {
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String get _email => _emailController.text;
  String get _pass => _passController.text;

  _submit() async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.regInWithEmailPass(_email, _pass);
      // Navigator.of(context).pop();
    } on PlatformException catch (e) {}
  }

  _buildContent(BuildContext context) {
    return SingleChildScrollView(
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
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: _emailController,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black87,
              ),
              decoration: CDecorationforMailInput,
              onChanged: (email) {
                _updateState;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
            child: TextField(
              controller: _passController,
              textInputAction: TextInputAction.done,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black87,
              ),
              decoration: CDecorationforPassInput,
              obscureText: true,
              onChanged: (pass) {
                _updateState;
              },
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
                _submit();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
    );
  }

  void _updateState() {
    setState(() {});
  }
}
