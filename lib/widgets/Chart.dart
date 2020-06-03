import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:questionaire/model/transaction.dart';
import '../model/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);
  
  List<Map<String,Object>> get groupedTransactionValues {
    
    
    return List.generate(7,( index ) {
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      double totalsum = 0.0;
      for(var i =0; i< recentTransaction.length; i++){
          if(recentTransaction[i].date.day == weekDay.day &&
          recentTransaction[i].date.month == weekDay.month &&
          recentTransaction[i].date.year == weekDay.year) {
            totalsum += recentTransaction[i].amount;
          }
      }
      return {
        'day':DateFormat.E().format(weekDay),
         'amount':totalsum
         };
    }).reversed.toList();
  }

  double get maxSpending {
      return groupedTransactionValues.fold(0.0, (sum, item) {
        return sum + item['amount'];
      });
    }
  

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(padding: EdgeInsets.all(10),
      
      
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(data['day'], data['amount'], (data['amount'] as double) / maxSpending),); 
            
        }).toList()
      )
    )
    );
  }
}