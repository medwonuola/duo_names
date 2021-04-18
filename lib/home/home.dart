import 'package:duo_names/favorites/favorite.dart';
import 'package:duo_names/home/home_event.dart';
import 'package:flutter/material.dart';
import '../shared_ui.dart';
import 'home_model.dart';
import 'home_state.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final model = HomeModel();

  @override
  void initState() {
    model.dispatch(FetchDataFromFile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Generator"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Favorites()));
              model.dispatch(UpdateFavorite());
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: model.homeState,
        builder: (context, snapshot) {
          if (snapshot.hasError) {}

          var homeState = snapshot.data;

          if (homeState is BusyState) {
            return Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    String _name = homeState.data[index];
                    bool isFav = homeState.favorites.contains(_name);

                    return ItemUI(
                      name: _name,
                      favorites: homeState.favorites,
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        model.dispatch(AddFavorite(_name));
                        setState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: !isFav
                                ? Text(_name + " added")
                                : Text(_name + " removed")));
                      },
                    );
                  },
                  itemCount: homeState.data.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                        color: Colors.black,
                      )),
              onRefresh: () async {
                model.dispatch(FetchData());
              });
        },
      ),
    );
  }
}
