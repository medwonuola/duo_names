import 'package:duo_names/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared_ui.dart';

class Favorites extends StatefulWidget {
  Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<String> _favorites;
  @override
  void initState() {
    getFavorites().then((value) => setState(() {
          _favorites = value;
        }));
    super.initState();
  }

  Future<List<String>> getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> _favorites = prefs.getStringList('favorites') ?? [];

    return _favorites;
  }

  void addFavorite(String name) async {
    setState(() {
      !_favorites.contains(name)
          ? _favorites.add(name)
          : _favorites.remove(name);
    });

    saveFavorites(_favorites);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            String _name = _favorites[index];

            return ItemUI(
              name: _name,
              favorites: _favorites,
              onPressed: () {
                addFavorite(_name);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.black,
              ),
          itemCount: _favorites.length),
    );
  }
}
