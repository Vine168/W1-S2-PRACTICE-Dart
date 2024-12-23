// the old code


// import 'package:flutter/material.dart';
// import '../data/dummy_items.dart';
// import '../models/grocery_item.dart';
// import 'new_item.dart';
 
// class GroceryList extends StatefulWidget {
//   const GroceryList({super.key});

//   @override
//   State<GroceryList> createState() => _GroceryListState();
// }

// class _GroceryListState extends State<GroceryList> {

  
//   void _addItem()  {
 
//      Navigator.of(context).push<GroceryItem>(
//       MaterialPageRoute(
//         builder: (ctx) => const NewItem(),
//       ),
//     );
//   }

 
//   @override
//   Widget build(BuildContext context) {
//     Widget content = const Center(child: Text('No items added yet.'));

//     if (dummyGroceryItems.isNotEmpty) {
//       content = ListView.builder(
//         itemCount: dummyGroceryItems.length,
//         itemBuilder: (ctx, index) => GroceryTile(dummyGroceryItems[index]),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Groceries'),
//         actions: [
//           IconButton(
//             onPressed:  _addItem,
//             icon: const Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: content,
//     );
//   }
// }

// class GroceryTile extends StatelessWidget {
//   const GroceryTile(this.groceryItem, {super.key});

//   final GroceryItem groceryItem;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(groceryItem.name),
//       leading: Container(
//         width: 24,
//         height: 24,
//         color: groceryItem.category.color,
//       ),
//       trailing: Text(
//         groceryItem.quantity.toString(),
//       ),
//     );
//   }
// }


// challenge 5 ( can add new item and show it to the home screen)


// import 'package:flutter/material.dart';
// import '../data/dummy_items.dart';
// import '../models/grocery_item.dart';
// import 'new_item.dart';

// class GroceryList extends StatefulWidget {
//   const GroceryList({super.key});

//   @override
//   State<GroceryList> createState() => _GroceryListState();
// }

// class _GroceryListState extends State<GroceryList> {
//   // List of grocery items
//   List<GroceryItem> _groceries = [...dummyGroceryItems];

//   // Function to add a new item
//   void _addItem() async {
//     // Navigate to NewItem screen and await the result (new grocery item)
//     final newItem = await Navigator.of(context).push<GroceryItem>(
//       MaterialPageRoute(
//         builder: (ctx) => const NewItem(),
//       ),
//     );

//     // If a new item was returned, update the list
//     if (newItem != null) {
//       setState(() {
//         _groceries.add(newItem); // Add the new item to the list
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget content = const Center(child: Text('No items added yet.'));

//     if (_groceries.isNotEmpty) {
//       content = ListView.builder(
//         itemCount: _groceries.length,
//         itemBuilder: (ctx, index) => GroceryTile(_groceries[index]),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Groceries'),
//         actions: [
//           IconButton(
//             onPressed: _addItem,
//             icon: const Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: content,
//     );
//   }
// }

// // GroceryTile Widget to display a single grocery item
// class GroceryTile extends StatelessWidget {
//   const GroceryTile(this.groceryItem, {super.key});

//   final GroceryItem groceryItem;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(groceryItem.name),
//       leading: Container(
//         width: 24,
//         height: 24,
//         color: groceryItem.category.color,
//       ),
//       trailing: Text(groceryItem.quantity.toString()),
//     );
//   }
// }


// // challenge 6 (user tapped in the screen and user can edit it )

import 'package:flutter/material.dart';
import '../data/dummy_items.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';
import '../models/mode.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceries = dummyGroceryItems;

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(mode: Mode.creating),
      ),
    );

    if (newItem != null) {
      setState(() {
        _groceries.add(newItem); // Add the new item to the list
      });
    }
  }

  void _editItem(GroceryItem item) async {
    final updatedItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(mode: Mode.editing, groceryItem: item),
      ),
    );

    if (updatedItem != null) {
      setState(() {
        final index = _groceries.indexWhere((i) => i.id == updatedItem.id);
        if (index != -1) {
          _groceries[index] = updatedItem; // Update the item in the list
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_groceries.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceries.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(_groceries[index].name),
          leading: Container(
            width: 24,
            height: 24,
            color: _groceries[index].category.color,
          ),
          trailing: Text(_groceries[index].quantity.toString()),
          onTap: () => _editItem(_groceries[index]), // Edit item on tap
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem, // Add item
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
