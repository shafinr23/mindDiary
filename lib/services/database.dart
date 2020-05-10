import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mindDiary/model/mind.dart';

import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> setMind(Mind mind);
  Stream<List<Mind>> mindsStream();
  //List<Mind> mindsStream();
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

final _service = FirestoreService.instance;

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  Future<void> setMind(Mind mind) async => await _service.setData(
        path: APIPath.mind(uid, mind.id),
        data: mind.toMap(),
      );
  Stream<List<Mind>> mindsStream() => _service.collectionStream(
        path: APIPath.minds(uid),
        builder: (data, documentId) => Mind.frommap(data, documentId),
      );
}
