import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dreams_dictionary/src/database/app_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_providers.g.dart';

@riverpod
AppDatabase appDatabase(AppDatabaseRef ref) {
  throw UnimplementedError();
}

@riverpod
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  throw UnimplementedError();
}
