import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});


  @override
  State<Expenses> createState() {
    return _ExpenseState();
  
  }
  
}

class _ExpenseState extends State<Expenses>{
  final List<Expense> _registeredExpenses =[
    Expense(
      title: 'Lagos',
      amount: 200000.00,
      date: DateTime.now(),
      category: Category.travel
    ),
     Expense(
      title: 'Gas',
      amount: 500000.00,
      date: DateTime.now(),
      category: Category.work
    ),
     Expense(
      title: 'fish',
      amount: 50000.00,
      date: DateTime.now(),
      category: Category.leisure
    ),
  ];

  @override
  Widget build(BuildContext context) {
  return  Scaffold(body: Column(children: [
    const Text('data'),
  Expanded(child: ExpensesList(expenses: _registeredExpenses,))
  ],),);
  }
  
}