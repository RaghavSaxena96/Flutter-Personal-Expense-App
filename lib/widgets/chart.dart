import 'package:expense/model/transaction.dart';
import 'package:expense/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year)
          totalSum = totalSum + recentTransactions[i].amt;
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get maxSpending {
    double t = groupedTransactionValues.fold(0.0, (sum, element) {
      return sum + double.parse(element['amount'].toString());
    });

    return t == 0 ? 1 : t;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          ...groupedTransactionValues.map((data) {
            return ChartBar(
                data['day'].toString(),
                double.parse(data['amount'].toString()),
                double.parse(data['amount'].toString()) / maxSpending);
          })
        ],
      ),
    );
  }
}
