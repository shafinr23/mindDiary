import 'package:flutter/material.dart';
import 'package:mindDiary/services/auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  Future<void> _singOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.singOut();
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MindDiary',
          style: TextStyle(
            color: Color(0xff475993),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          FlatButton(
              onPressed: () => _singOut(context),
              child: Text(
                'LogOut',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff475993),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff475993),
      ),
    );
  }
}
