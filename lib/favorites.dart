// import 'package:duo_names/home.dart';
// import 'package:flutter/material.dart';

// import 'model.dart';

// class Favorites extends StatefulWidget {
//   final Names names;

//   const Favorites({Key key, this.names}) : super(key: key);

//   @override
//   _FavoritesState createState() => _FavoritesState();
// }

// class _FavoritesState extends State<Favorites> {
//   Names namesProvider;

//   @override
//   void initState() {
//     namesProvider = widget.names;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _emptyFavoritesMessage = Center(
//         child: Text(
//           "You have no name in favorites. Add names and check back later.",
//           textAlign: TextAlign.center,
//           style: Theme
//               .of(context)
//               .textTheme
//               .bodyText1,
//         ));

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
//           Navigator.pop(context, namesProvider);
//         }),
//       ),
//       body: namesProvider.favorites.isEmpty
//           ? _emptyFavoritesMessage
//           : ListView.separated(
//           itemCount: namesProvider.favorites.length,
//           itemBuilder: (BuildContext context, int index) =>
//               _itemUI(index, namesProvider.favorites),
//           separatorBuilder: (BuildContext context, int index) =>
//               Divider(
//                 color: Colors.black,
//               )),
//     );
//   }

//   _itemUI(int index, List favorites) {
//     String _item = favorites[index];
//     return ListTile(
//       title: Text(_item),
//       trailing: IconButton(
//           icon: Icon(
//             favorites.contains(_item)
//                 ? Icons.favorite_outlined
//                 : Icons.favorite_border_outlined,
//             color: favorites.contains(_item) ? Colors.red : Colors.grey,
//           ),
//           onPressed: () {
//             setState(() {
//               namesProvider.addFavorites(_item);
//             });
//           }),
//     );
//   }
// }
