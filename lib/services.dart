import 'package:english_words/english_words.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> getNames() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> names = List.generate(
      100, (index) => WordPair.random(maxSyllables: 2).asPascalCase);
  prefs.setStringList('names', names);

  return names;
}

Future<List<List<String>>> loadNames() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> names = prefs.getStringList('names') ?? [];
  List<String> favorites = prefs.getStringList('favorites') ?? [];

  if (names.isEmpty) names = await getNames();

  return [names, favorites];
}

Future<void> saveFavorites(List<String> favorites) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList('favorites', favorites);
}
