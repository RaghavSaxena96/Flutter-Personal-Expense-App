// ignore_for_file: deprecated_member_use, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  Function _transactionHandler;

  NewTransaction(this._transactionHandler);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (value) {
              //   titleInput = value;
              // },
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              //onChanged: (value) {
              //  amountInput = value;
              //},
              controller: amountController,
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: () {
                _transactionHandler(
                    titleController.text, double.parse(amountController.text));
              },
              child: Text("Add Expense"),
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
