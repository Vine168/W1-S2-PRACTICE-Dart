import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onExpenseRemoved});

  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: expenses.isEmpty
          ? Center(
              child: Text(
                'No expenses added yet. Start by adding some!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            )
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) => Dismissible(
                onDismissed: (direction) =>
                    onExpenseRemoved(expenses[index]),
                key: Key(expenses[index].id),
                child: ExpenseItem(expenses[index]),
              ),
            ),
    );
  }
}
