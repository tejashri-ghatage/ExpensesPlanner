import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../model/transaction.dart';
 
class UserTransaction extends StatefulWidget {
  UserTransaction({Key key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
   List<Transaction> transaction;
   
  @override
  Widget build(BuildContext context) {
    List<Transaction> transaction;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
          //  NewTransaction(addNewTransaction),
           TrasactionList(transaction),
       
    ]);
  }
}