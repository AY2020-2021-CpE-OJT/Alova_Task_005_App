
import 'package:flutter/material.dart';

class DeleteContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Warning"),
      content: Text("Are you sure to delete this contact?"),
      actions: <Widget>[
        TextButton(
            onPressed: (){
              Navigator.of(context).pop(true);
            },
            child: Text("Yes")),
        TextButton(
            onPressed: (){
              Navigator.of(context).pop(false);
            },
            child: Text("No")),
      ],
    );
  }
}
