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
            onPressed: () {},
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

          if (homeState is DataFetchedState) {
            if (!homeState.hasData) {
              return InfoMessage(
                  message:
                      "No data to display for your account. Add something and check back.");
            }
          }

          return RefreshIndicator(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) => ItemUI(),
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
