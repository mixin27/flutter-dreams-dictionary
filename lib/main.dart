import 'package:dreams_dictionary/src/common/keys.dart';
import 'package:dreams_dictionary/src/common/shared_providers.dart';
import 'package:dreams_dictionary/src/database/app_database.dart';
import 'package:dreams_dictionary/src/features/app/views/app.dart';
import 'package:dreams_dictionary/src/models/dream_detail.dart';
import 'package:dreams_dictionary/src/models/dream_dictionary.dart';
import 'package:dreams_dictionary/src/utils/json_loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorAppDatabase.databaseBuilder('dreams.db').build();
  final prefs = await SharedPreferences.getInstance();

  final isFirstTime = prefs.getBool(Keys.keyFirstTime) ?? true;
  if (isFirstTime) {
    final dreamJson = await loadDreamsDictionaryData();
    final dreamData = DreamDictionary.fromJson(dreamJson);

    await database.dreamHeaderDao.insertAll(dreamData.header);
    await database.dreamDetailDao.insertAll(dreamData.details);

    await prefs.setBool(Keys.keyFirstTime, false);
  }

  final container = ProviderContainer(
    overrides: [
      appDatabaseProvider.overrideWithValue(database),
      sharedPrefsProvider.overrideWithValue(prefs),
    ],
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const AppWidget(),
    ),
  );
}
