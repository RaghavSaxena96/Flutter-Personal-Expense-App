// ignore_for_file: deprecated_member_use, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  Function _transactionHandler;

  NewTransaction(this._transactionHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime? _selectdate;

  void _chooseDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    _selectdate = value;
                  })
                }
            });
  }

  void submitData() {
    if (_titleController.text.isEmpty ||
        double.parse(_amountController.text) < 0 ||
        _selectdate == null) return;

    widget._transactionHandler(_titleController.text,
        double.parse(_amountController.text), _selectdate);

    Navigator.of(context).pop();
  }

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
              controller: _titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              //onChanged: (value) {
              //  amountInput = value;
              //},
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(children: [
                Text(_selectdate == null
                    ? "No Date Choosen"
                    : DateFormat.yMd().format(_selectdate!)),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _chooseDatePicker,
                  child: Text(
                    "Choose Date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () => submitData(),
              child: Text("Add Expense"),
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
