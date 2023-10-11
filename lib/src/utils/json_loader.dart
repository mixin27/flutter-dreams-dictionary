import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future loadDreamsDictionaryData() async {
  final data = await rootBundle.loadString(
    'assets/json/dreams_dictionary.json',
  );

  return jsonDecode(data);
}
