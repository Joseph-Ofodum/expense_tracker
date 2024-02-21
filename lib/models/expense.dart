import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category{leisure, food, work, travel}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.travel: Icons.flight_takeoff
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
    }): expenseId = uuid.v4();

  final String expenseId;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

String get formattedDate{
  return formatter.format(date);
}
}
