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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Generator"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      ),
      body: StreamBuilder(
        stream: model.homeState,
        builder: (context, snapshot) {
          if (snapshot.hasError) {}

          var homeState = snapshot.data;

          if (!snapshot.hasData || homeState is BusyState) {
            return Center(child: CircularProgressIndicator());
          }

          if (homeState is DataFetchedState) {
            if (!homeState.hasData) {
              return InfoMessage(
                  message:
                      "No data to display for your account. Add something and check back.");
            }
          }

          return ListView.builder(
              itemCount: homeState.data.length,
              itemBuilder: (BuildContext context, int index) =>
                  _itemUI(index, homeState.data));

          return null;
        },
      ),
    );
  }
}
