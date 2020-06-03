import 'package:flutter/material.dart';
import 'package:questionaire/widgets/Chart.dart';

import './model/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses Planner',
      
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.green,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
           fontFamily: 'OpenSans',
            fontSize: 18  
          )
        ),
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().
        textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20),))

        ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
final titleController = TextEditingController();
final amountController = TextEditingController();

  final  List<Transaction> transaction = [
  Transaction(
      id: 't1',
      title: 'new shoes',
      amount: 68.89,
      date: DateTime.now()
    ),
      Transaction(
      id: 't2',
      title:'Raincoat',
      amount: 34.45,
      date: DateTime.now()
    ),
  ];

  void addNewTransaction(String title, double amount, DateTime choosenDate) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: choosenDate,
      id: DateTime.now().toString()
    );

    setState(() {
      transaction.add(newTx);
    });
  }

void deleteTransaction(String id) {
  setState(() {
    transaction.removeWhere((tx) {
      return tx.id == id;
    });
  });
}

void startAddNewTransaction(BuildContext ctx) {
  showModalBottomSheet(context: ctx, builder: (_){
    return NewTransaction(addNewTransaction);
  },);
}

List<Transaction> get recentTransactions {
  return transaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days:7)),);
  }).toList();
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Expenses Planner'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add), onPressed: () {startAddNewTransaction(context);})
            ],
          ),
          body: SingleChildScrollView (
            child: 
          Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              
            children: <Widget>[
              Chart(recentTransactions),
              // Container(
              //  // width: double.infinity,
              //   child: Card(
              //       child: Text('Expenses List Below'),
              //       color: Colors.blue,
              //       elevation: 5,
              //   ),
              // ),
              TrasactionList(transaction, deleteTransaction),
              // UserTransaction(),    
            ],
          )
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddNewTransaction(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
      ),
    );
  }
}
