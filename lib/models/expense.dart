import 'dart:ffi';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date
    }): expenseId = uuid.v4();

  final String expenseId;
  final String title;
  final double amount;
  final DateTime date;
}
