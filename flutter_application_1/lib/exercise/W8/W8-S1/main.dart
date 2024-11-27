import 'package:flutter/material.dart';
import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("This is a testing"),
      ),
      body: Espense_list(),
    );
  }
}
class Espense_list extends StatefulWidget {
  const Espense_list({super.key});

  @override
  State<Espense_list> createState() => _Espense_listState();
}

class _Espense_listState extends State<Espense_list> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Expense_Item(),
          Expense_Item(),
        ],
      ),
    );
  }
}
class Expense_Item extends StatefulWidget {
  const Expense_Item({super.key});

  @override
  State<Expense_Item> createState() => _Expense_ItemState();
}

class _Expense_ItemState extends State<Expense_Item> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
