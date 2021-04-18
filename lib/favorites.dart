import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<String> favorites;


  @override
  Widget build(BuildContext context) {
    final _emptyFavoritesMessage = Center(
        child: Text(
      "You have no name in favorites. Add names and check back later.",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText1,
    ));

    return Scaffold(
      appBar: AppBar(),
      body: favorites.isEmpty
          ? _emptyFavoritesMessage
          : ListView.separated(
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int index) =>
                  _itemUI(index, favorites),
              separatorBuilder: (BuildContext context, int index) => Divider(
                    color: Colors.black,
                  )),
    );
  }

  _itemUI(int index, List builder) {
    String _item = builder[index];
    return ListTile(
      title: Text(_item),
      trailing: IconButton(
          icon: Icon(
            favorites.contains(_item)
                ? Icons.favorite_outlined
                : Icons.favorite_border_outlined,
            color: favorites.contains(_item) ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            setState(() {});
          }),
    );
  }
}
