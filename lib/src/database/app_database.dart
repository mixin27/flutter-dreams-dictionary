import 'dart:async';

import 'package:dreams_dictionary/src/dao/dream_detail_dao.dart';
import 'package:dreams_dictionary/src/dao/dream_header_dao.dart';
import 'package:dreams_dictionary/src/models/dream_detail.dart';
import 'package:dreams_dictionary/src/models/dream_header.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [DreamHeader, DreamDetail])
abstract class AppDatabase extends FloorDatabase {
  DreamHeaderDao get dreamHeaderDao;
  DreamDetailDao get dreamDetailDao;
}
