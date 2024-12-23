// import 'package:flutter/material.dart';
// import '../models/grocery_category.dart';

// class NewItem extends StatefulWidget {
//   const NewItem({super.key});

//   @override
//   State<NewItem> createState() {
//     return _NewItemState();
//   }
// }

// class _NewItemState extends State<NewItem> {
//   // We create a key to access and control the state of the Form.
//   final _formKey = GlobalKey<FormState>();

//   String _enteredName = '';

//   void _saveItem() {

//     // 1 - Validate the form
//     bool isValid = _formKey.currentState!.validate();
//     if (isValid) {
      
//       // 2 - Save the form to get last entered values
//       _formKey.currentState!.save();

//       // TODO: Get the last entered quantity
//       print("Name $_enteredName");
//     }
//   }

//   void _resetForm() {
//     // TODO: reset the form
//   }

//   String? validateTitle(String? value) {
//     if (value == null ||
//         value.isEmpty ||
//         value.trim().length <= 1 ||
//         value.trim().length > 50) {
//       return 'Must be between 1 and 50 characters.';
//     }
//     return null;
//   }

//   // TODO: validate quantity

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add a new item'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 maxLength: 50,
//                 decoration: const InputDecoration(
//                   label: Text('Name'),
//                 ),
//                 validator: validateTitle,
//                 onSaved: (value) {
//                   _enteredName = value!;
//                 },
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         label: Text('Quantity'),
//                       ),
//                       initialValue: '1',
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: DropdownButtonFormField<GroceryCategory>(
//                       items: [
//                         for (final category in GroceryCategory.values)
//                           DropdownMenuItem<GroceryCategory>(
//                             value: category,
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 16,
//                                   height: 16,
//                                   color: category.color,
//                                 ),
//                                 const SizedBox(width: 6),
//                                 Text(category.label),
//                               ],
//                             ),
//                           ),
//                       ],
//                       onChanged: (value) {},
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: _resetForm,
//                     child: const Text('Reset'),
//                   ),
//                   ElevatedButton(
//                     onPressed: _saveItem,
//                     child: const Text('Add Item'),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// this is a challenge 4 ( invalidate the the box to complete and show it to the console )

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/exercise/W9/Grocery/models/grocery_item.dart';
// import '../models/grocery_category.dart';

// class NewItem extends StatefulWidget {
//   const NewItem({super.key, required Mode mode, required GroceryItem groceryItem});

//   @override
//   State<NewItem> createState() {
//     return _NewItemState();
//   }
// }

// class _NewItemState extends State<NewItem> {
//   final _formKey = GlobalKey<FormState>();

//   String _enteredName = '';
//   int _enteredQuantity = 1;
//   GroceryCategory? _selectedCategory;

//   void _saveItem() {
//     // Validate the form
//     bool isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       // Save the form to get the latest entered values
//       _formKey.currentState!.save();

//       // Print the values
//       print("Name: $_enteredName");
//       print("Quantity: $_enteredQuantity");
//       print("Category: ${_selectedCategory?.label ?? 'None'}");
//     }
//   }

//   void _resetForm() {
//     _formKey.currentState!.reset();
//     setState(() {
//       _enteredName = '';
//       _enteredQuantity = 1;
//       _selectedCategory = null;
//     });
//   }

//   String? validateTitle(String? value) {
//     if (value == null ||
//         value.isEmpty ||
//         value.trim().length <= 1 ||
//         value.trim().length > 100) {
//       return 'Must be between 1 and 100 characters.';
//     }
//     return null;
//   }

//   String? validateQuantity(String? value) {
//     if (value == null || int.parse(value) <= 0) {
//       return 'Must be a valid, positive number.';
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add a new item'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 maxLength: 50,
//                 decoration: const InputDecoration(
//                   label: Text('Name'),
//                 ),
//                 validator: validateTitle,
//                 onSaved: (value) {
//                   _enteredName = value!;
//                 },
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         label: Text('Quantity'),
//                       ),
//                       initialValue: '1',
//                       validator: validateQuantity,
//                       keyboardType: TextInputType.number,
//                       onSaved: (value) {
//                         _enteredQuantity = int.parse(value!);
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: DropdownButtonFormField<GroceryCategory>(
//                       value: _selectedCategory,
//                       items: [
//                         for (final category in GroceryCategory.values)
//                           DropdownMenuItem<GroceryCategory>(
//                             value: category,
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 16,
//                                   height: 16,
//                                   color: category.color,
//                                 ),
//                                 const SizedBox(width: 6),
//                                 Text(category.label),
//                               ],
//                             ),
//                           ),
//                       ],
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedCategory = value;
//                         });
//                       },
//                       decoration: const InputDecoration(
//                         label: Text('Category'),
//                       ),
//                       validator: (value) {
//                         if (value == null) {
//                           return 'Please select a category.';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: _resetForm,
//                     child: const Text('Reset'),
//                   ),
//                   ElevatedButton(
//                     onPressed: _saveItem,
//                     child: const Text('Add Item'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// challenge 5 (can add the new item on to the home screen )


// import 'package:flutter/material.dart';
// import '../models/grocery_category.dart';
// import '../models/grocery_item.dart';

// class NewItem extends StatefulWidget {
//   const NewItem({super.key});

//   @override
//   State<NewItem> createState() {
//     return _NewItemState();
//   }
// }

// class _NewItemState extends State<NewItem> {
//   final _formKey = GlobalKey<FormState>();

//   String _enteredName = '';
//   int _enteredQuantity = 1;
//   GroceryCategory? _selectedCategory;

//   void _saveItem() {
//     // Validate the form
//     bool isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       // Save the form to get the latest entered values
//       _formKey.currentState!.save();

//       // Create the new GroceryItem
//       final newItem = GroceryItem(
//         id: DateTime.now().toString(), // Create a unique ID
//         name: _enteredName,
//         quantity: _enteredQuantity,
//         category: _selectedCategory!,
//       );

//       // Return the item to the previous screen
//       Navigator.of(context).pop(newItem);
//     }
//   }

//   void _resetForm() {
//     _formKey.currentState!.reset();
//     setState(() {
//       _enteredName = '';
//       _enteredQuantity = 1;
//       _selectedCategory = null;
//     });
//   }

//   String? validateTitle(String? value) {
//     if (value == null ||
//         value.isEmpty ||
//         value.trim().length <= 1 ||
//         value.trim().length > 100) {
//       return 'Must be between 1 and 100 characters.';
//     }
//     return null;
//   }

//   String? validateQuantity(String? value) {
//     if (value == null || int.parse(value) <= 0) {
//       return 'Must be a valid, positive number.';
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add a new item'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 maxLength: 50,
//                 decoration: const InputDecoration(
//                   label: Text('Name'),
//                 ),
//                 validator: validateTitle,
//                 onSaved: (value) {
//                   _enteredName = value!;
//                 },
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         label: Text('Quantity'),
//                       ),
//                       initialValue: '1',
//                       validator: validateQuantity,
//                       keyboardType: TextInputType.number,
//                       onSaved: (value) {
//                         _enteredQuantity = int.parse(value!);
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: DropdownButtonFormField<GroceryCategory>(
//                       value: _selectedCategory,
//                       items: [
//                         for (final category in GroceryCategory.values)
//                           DropdownMenuItem<GroceryCategory>(
//                             value: category,
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 16,
//                                   height: 16,
//                                   color: category.color,
//                                 ),
//                                 const SizedBox(width: 6),
//                                 Text(category.label),
//                               ],
//                             ),
//                           ),
//                       ],
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedCategory = value;
//                         });
//                       },
//                       decoration: const InputDecoration(
//                         label: Text('Category'),
//                       ),
//                       validator: (value) {
//                         if (value == null) {
//                           return 'Please select a category.';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: _resetForm,
//                     child: const Text('Reset'),
//                   ),
//                   ElevatedButton(
//                     onPressed: _saveItem,
//                     child: const Text('Add Item'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// challenge 6 (the user can edit the item that they created)


import 'package:flutter/material.dart';
import '../models/grocery_item.dart';
import '../models/grocery_category.dart';
import '../models/mode.dart';

class NewItem extends StatefulWidget {
  final Mode mode;
  final GroceryItem? groceryItem;

  const NewItem({super.key, required this.mode, this.groceryItem});

  @override
  State<NewItem> createState() => _NewItemState();
}


class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';
  int _enteredQuantity = 1;
  GroceryCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.editing && widget.groceryItem != null) {
      _enteredName = widget.groceryItem!.name;
      _enteredQuantity = widget.groceryItem!.quantity;
      _selectedCategory = widget.groceryItem!.category;
    }
  }

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newItem = GroceryItem(
        id: widget.mode == Mode.editing ? widget.groceryItem!.id : DateTime.now().toString(),
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _selectedCategory!,
      );

      Navigator.of(context).pop(newItem); // Return the new or updated item
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _enteredName = '';
      _enteredQuantity = 1;
      _selectedCategory = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mode == Mode.editing ? 'Edit Item' : 'Add New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.mode == Mode.editing ? _enteredName : '',
                decoration: const InputDecoration(label: Text('Name')),
                onSaved: (value) => _enteredName = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: widget.mode == Mode.editing ? _enteredQuantity.toString() : '1',
                decoration: const InputDecoration(label: Text('Quantity')),
                onSaved: (value) => _enteredQuantity = int.parse(value!),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a quantity';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<GroceryCategory>(
                value: _selectedCategory,
                items: GroceryCategory.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.label),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                decoration: const InputDecoration(label: Text('Category')),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _resetForm,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: Text(widget.mode == Mode.editing ? 'Update Item' : 'Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
