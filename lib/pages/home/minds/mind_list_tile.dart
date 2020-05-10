import 'package:flutter/material.dart';
import 'package:mindDiary/model/mind.dart';

class MindListTile extends StatelessWidget {
  const MindListTile({Key key, @required this.job, this.onTap})
      : super(key: key);
  final Mind job;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(job.time),
      onTap: onTap,
      trailing: Icon(Icons.chevron_right),
    );
  }
}
