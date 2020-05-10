import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindDiary/model/mind.dart';
import 'package:mindDiary/services/database.dart';
import 'package:provider/provider.dart';

class EditMindPage extends StatefulWidget {
  const EditMindPage({Key key, @required this.database, this.mind})
      : super(key: key);
  final Database database;
  final Mind mind;

  static Future<void> show(BuildContext context, {Mind job}) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditMindPage(
          database: database,
          mind: job,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _EditMindPageState createState() => _EditMindPageState();
}

class _EditMindPageState extends State<EditMindPage> {
  String _time;
  String _cause;
  String _emotion;
  String _thinking;
  String _physical;

  @override
  void initState() {
    super.initState();
    if (widget.mind != null) {
      _time = widget.mind.time;
      _cause = widget.mind.cause;
      _emotion = widget.mind.emotion;
      _thinking = widget.mind.thinking;
      _physical = widget.mind.physical;
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    //TODO:validate and save from
    if (_validateAndSave()) {
      try {
        final minds = await widget.database.mindsStream().first;
        final allNames = minds.map((mind) => mind.time).toList();
        if (widget.mind != null) {
          allNames.remove(widget.mind.time);
        }
        if (allNames.contains(_time)) {
          PlatformException(
              code: 'Error 7',
              message: 'this is taken',
              details: 'change somthing');
        } else {
          final id = widget.mind?.id ?? documentIdFromCurrentDate();
          final job = Mind(
            id: id,
            time: _time,
            cause: _cause,
            emotion: _emotion,
            thinking: _thinking,
            physical: _physical,
          );
          await widget.database.setMind(job);
          Navigator.of(context).pop();
        }
      } on PlatformException catch (e) {
        //print(e.toString());

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff475993),
        elevation: 2.0,
        title: Text(widget.mind == null ? 'New mind' : 'Edit Mind'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'save',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: _submit,
          )
        ],
      ),
      body: _buildcontent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildcontent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      TextFormField(
        maxLines: 8,
        decoration: InputDecoration(
          labelText: 'Job Page',
        ),
        onSaved: (value) => _time = value,
        validator: (value) =>
            value.isNotEmpty ? null : 'name cant\'t be empty ',
        initialValue: _time,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Job Page',
        ),
        onSaved: (value) => _cause = value,
        validator: (value) =>
            value.isNotEmpty ? null : 'name cant\'t be empty ',
        initialValue: _cause,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Job Page',
        ),
        onSaved: (value) => _emotion = value,
        validator: (value) =>
            value.isNotEmpty ? null : 'name cant\'t be empty ',
        initialValue: _emotion,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Job Page',
        ),
        onSaved: (value) => _thinking = value,
        validator: (value) =>
            value.isNotEmpty ? null : 'name cant\'t be empty ',
        initialValue: _thinking,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Job Page',
        ),
        onSaved: (value) => _physical = value,
        validator: (value) =>
            value.isNotEmpty ? null : 'name cant\'t be empty ',
        initialValue: _physical,
      ),
    ];
  }
}
