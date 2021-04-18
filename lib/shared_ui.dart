import 'package:flutter/material.dart';

class InfoMessage extends StatelessWidget {
  final String message;

  const InfoMessage({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      message,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText1,
    ));
  }
}

class ItemUI extends StatelessWidget {
  final String name;
  final List<String> favorites;
  final Function onPressed;

  const ItemUI({Key key, this.name, this.favorites, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(name),
        trailing: IconButton(
          icon: Icon(
            favorites.contains(name)
                ? Icons.favorite_outlined
                : Icons.favorite_border_outlined,
            color: favorites.contains(name) ? Colors.red : Colors.grey,
          ),
          onPressed: onPressed,
        ));
  }
}
