import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Lagos',
        amount: 200000.00,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Gas',
        amount: 500000.00,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'fish',
        amount: 50000.00,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAndExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
               _registeredExpenses.insert(expenseIndex, expense);
            });

          },),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(
      child: Text('No expenses found yet'),
    );
    if (_registeredExpenses.isNotEmpty) {
      maincontent = ExpensesList(
        expenses: _registeredExpenses,
        onRemovedExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Joseph Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAndExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [const Text('data'), Expanded(child: maincontent)],
      ),
    );
  }
}
