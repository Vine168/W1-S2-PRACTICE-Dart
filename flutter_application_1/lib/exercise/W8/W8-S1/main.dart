import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() => runApp(ExpenseApp());
class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Item UI For Each Item'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the boxes
            children: [
              ExpenseItem(
                title: 'The Best Book',
                price: 200,
                category: 'Books',
                date: DateTime(2024, 20, 01),
              ),
              SizedBox(width: 16),
              ExpenseItem(
                title: 'The Great Meal',
                price: 2500.00,
                category: 'Food',
                date: DateTime(2024, 20, 01),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ExpenseItem extends StatelessWidget {
  final String title;
  final double price;
  final String category;
  final DateTime date;

  ExpenseItem({
    required this.title,
    required this.price,
    required this.category,
    required this.date,
  });

  IconData _category(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return Icons.restaurant;
      case 'entertainment':
        return Icons.movie;
      case 'books':
        return Icons.book;
      default:
        return Icons.category;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle long text
                ),
                SizedBox(height: 4),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),

          // Bottom Section: Icon and Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                _category(category),
                size: 24, // Adjust icon size
                color: Colors.blue,
              ),
              Text(
                DateFormat.yMd().format(date),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
