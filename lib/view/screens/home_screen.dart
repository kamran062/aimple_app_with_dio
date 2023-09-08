import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main_screen_provider.dart';
import '../../utils/textstyles.dart';
import '../widgets/add_item_dialogue.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home',style: AppTextStyles.headingStyle,),
        centerTitle: true,

      ),
      body: ListView.builder(
        itemCount: itemProvider.items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(itemProvider.items[index]), // Unique key for each item
            onDismissed: (direction) {
              // Remove the item from the list when dismissed
              itemProvider.removeItem(index);
            },
            background: Container(
              color: Colors.red, // Background color when swiping to delete
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text(itemProvider.items[index]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddItemDialog();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
