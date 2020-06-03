import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TrasactionList extends StatelessWidget {
 final List<Transaction> transaction;
 final Function deleteTx;

 TrasactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 600,
      child: transaction.isEmpty ?
       Column(children: <Widget>[
        Text('No Transcation available', style: Theme.of(context).textTheme.title),
        Image.asset('Assets/images/download.jpg'),
      ]) : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal:5),
            elevation: 8,
            child:
            ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Text('\$${transaction[index].amount}'),
                ),
              ),
            ),
            title: Text(transaction[index].title,
            style: Theme.of(context).textTheme.title),
            subtitle: Text(DateFormat.yMMMd().format(transaction[index].date),),
            trailing: IconButton(
              icon: Icon(Icons.delete), 
              color: Colors.red,
              onPressed: () => deleteTx(transaction[index].id)
              ),
                        
                      )
                      ); 
                      
                      // return Card(
                      //           child: Row( children: <Widget>[
                      //             Container( 
                      //               margin: EdgeInsets.all(10),
                      //               padding: EdgeInsets.all(5),
                      //               decoration: BoxDecoration(
                      //                 border: Border.all(color: Colors.purple),
                                      
                      //               ),
                      //               child: Text('\$${transaction[index].amount.toStringAsFixed(2)}',
                      //               style: TextStyle(
                      //                   color: Theme.of(context).primaryColor,
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 20
                      //               ),)
                      //             ),
                      //             Column( 
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: <Widget>[
                      //               Text(transaction[index].title, 
                      //               style: Theme.of(context).textTheme.title),
                      //               Text(
                      //               DateFormat.yMMMd().format(transaction[index].date),
                      //               style: TextStyle(
                      //                 fontSize: 12,
                      //                 color: Colors.grey
                      //               ),)
                      //             ] )
                      //           ],
            
                      //           )
                      //         );
                    },
                    itemCount: transaction.length,
                  )
                );
                  }
              
             
}
