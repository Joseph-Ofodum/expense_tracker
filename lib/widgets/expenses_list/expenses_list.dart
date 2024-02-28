import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
   {super.key,
   required this.expenses,
   required this.onRemovedExpense,
   }
   );

  final List<Expense> expenses;
  final void Function(Expense expense) onRemovedExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed:(direction){
          onRemovedExpense(expenses[index]);
        } ,
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
