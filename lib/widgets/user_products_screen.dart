import 'package:flutter/material.dart';

class UserProductScreen extends StatefulWidget {
  final String Product_name;
  final String imageUrl;

  UserProductScreen(this.Product_name, this.imageUrl);

  @override
  State<UserProductScreen> createState() => _UserProductScreenState();
}

class _UserProductScreenState extends State<UserProductScreen> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.Product_name),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.imageUrl),
      ),
      trailing: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
          )
        ],
      ),
    );
  }
}
