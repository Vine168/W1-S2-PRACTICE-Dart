import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpenseScreen(),
    );
  }
}

class ExpenseScreen extends StatefulWidget {
  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  // List to hold expense cards
  List<Map<String, dynamic>> expenses = [
    {'title': 'Ronan The Best Book', 'price': 15000.0, 'date': DateTime.now()},
  ];

  // Function to add a new card
  void _addExpense() {
    setState(() {
      expenses.add({
        'title': 'New Expense ${expenses.length + 1}',
        'price': 1000.0 + expenses.length * 100,
        'date': DateTime.now(),
      });
    });
  }

  // Function to remove a card
  void _removeExpense(int index) {
    setState(() {
      expenses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return ExpenseItem(
            title: expense['title'],
            price: expense['price'],
            date: expense['date'],
            onDelete: () => _removeExpense(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExpense,
        child: Icon(Icons.add),
        tooltip: 'Add New Expense',
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final String title;
  final double price;
  final DateTime date;
  final VoidCallback onDelete;

  const ExpenseItem({
    required this.title,
    required this.price,
    required this.date,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            // Expense Title and Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            // Expense Category Icon and Date
            Row(
              children: [
                Icon(Icons.category, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  DateFormat.yMd().format(date),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            // Delete Button
            IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
