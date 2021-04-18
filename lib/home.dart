import 'package:duo_names/favorites.dart';
import 'package:duo_names/model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Names namesProvider = Names();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Name Generator"),
        actions: [
          IconButton(
              icon: Icon(Icons.favorite_outlined),
              onPressed: () async{
                Names names = await
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Favorites(names: namesProvider,)));
                setState(() {
                  namesProvider = names;
                });
              })
        ],
      ),
      body: namesProvider.names == null
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: namesProvider.getNames,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) =>
                    _itemUI(index, namesProvider.names),
                itemCount: namesProvider.names.length,
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.black,
                ),
              ),
            ),
    );
  }

  _itemUI(int index, List builder) {
    String _item = builder[index];
    return ListTile(
      title: Text(_item),
      trailing: IconButton(
          icon: Icon(
            namesProvider.isFav(_item)
                ? Icons.favorite_outlined
                : Icons.favorite_border_outlined,
            color: namesProvider.isFav(_item) ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              namesProvider.addFavorites(_item);
            });
          }),
    );
  }
}

class DuoName extends InheritedWidget {
  final Widget child;
  final Names names;

  DuoName({Key key, this.child, this.names}) : super(key: key, child: child);

  static DuoName of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DuoName>();
  }

  @override
  bool updateShouldNotify(DuoName oldWidget) {
    return true;
  }
}
