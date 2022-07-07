import 'package:flutter/material.dart';
import './new_transaction.dart';
import '../model/transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction('t1', 'New Shoes', 63.34, DateTime.now()),
    Transaction('t2', 'Groceries', 100.28, DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx =
        Transaction(DateTime.now().toString(), title, amount, DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
