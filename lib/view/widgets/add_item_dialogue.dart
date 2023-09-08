import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main_screen_provider.dart';

class AddItemDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);

    return AlertDialog(
      title: Text('Add Item'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(labelText: 'Item Name'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final newItem = _controller.text;
            if (newItem.isNotEmpty) {
              itemProvider.addItem(newItem);
            }
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
