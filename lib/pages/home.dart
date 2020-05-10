import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mindDiary/model/mind.dart';
import 'package:mindDiary/pages/pdf_viewer.dart';
import 'package:mindDiary/pages/welcome.dart';
import 'package:mindDiary/services/auth.dart';
import 'package:mindDiary/services/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:provider/provider.dart';

import 'home/minds/edit_mind.dart';
import 'home/minds/mind_list_tile.dart';

class HomePage extends StatelessWidget {
  Future<void> _singOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.singOut();
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
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
          SizedBox(
            width: 35.0,
            child: IconButton(
              icon: Icon(
                Icons.delete,
                color: Color(0xff475993),
              ),
              onPressed: () => _genratePdf(context),
            ),
          ),
          SizedBox(
            width: 35.0,
            child: IconButton(
              icon: Icon(
                Icons.picture_as_pdf,
                color: Color(0xff475993),
              ),
              onPressed: () => _genratePdf(context),
            ),
          ),
          SizedBox(
            width: 85.0,
            child: FlatButton(
                onPressed: () => _singOut(context),
                child: Text(
                  'LogOut',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff475993),
                  ),
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // Add your onPressed code here!
        onPressed: () => EditMindPage.show(context),
        child: Icon(Icons.add),
        backgroundColor: Color(0xff475993),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: _buildContents(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    navigatorToDetail(DocumentSnapshot post) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsPage(
                    post: post,
                  )));
    }

    final database = Provider.of<Database>(context);
    return StreamBuilder<List<Mind>>(
      stream: database.mindsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final jobs = snapshot.data;
          final children = jobs
              .map((job) => MindListTile(
                    job: job,
                    onTap: () => EditMindPage.show(context, job: job),
                    //onTap: () => navigatorToDetail(jobs),
                  ))
              .toList();
          return ListView(children: children);
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Some Error Occurred'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  _genratePdf(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    Stream<List<Mind>> data = database.mindsStream();
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    pdf.addPage(
      pdfLib.MultiPage(
        build: (context) => [
          pdfLib.Table.fromTextArray(context: context, data: <List<String>>[
            <String>['time', 'cause', 'emotion', 'thinking', 'physical'],
          ]),
        ],
      ),
    );
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/mind.pdf';
    final File file = File(path);
    await file.writeAsBytes(pdf.save());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PdfViewerPage(path: path),
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  final DocumentSnapshot post;

  const DetailsPage({Key key, this.post}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(widget.post.data['time']),
          subtitle: Text(widget.post.data['cause']),
        ),
      ),
    );
  }
}
