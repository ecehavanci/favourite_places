import 'dart:io';

import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Place {
  final String id;
  final String title;
  final File? image;

  Place({this.image, required this.title}) : id = uuid.v4();
}
