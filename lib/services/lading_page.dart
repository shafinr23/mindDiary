import 'package:flutter/material.dart';
import 'package:mindDiary/pages/home.dart';
import 'package:mindDiary/pages/welcome.dart';
import 'package:mindDiary/services/auth.dart';
import 'package:mindDiary/services/database.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return WelcomePage();
            }
            return Provider<Database>(
              create: (_) => FirestoreDatabase(uid: user.uid),
              child: HomePage(),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
