 import 'package:flutter/material.dart';
  import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
final Function addTx;

 NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
 

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime selectedDate;

  

void submittedData() { 
  final enterredTitle =  titleController.text;
  final enterredAmount = double.parse(amountController.text);
   
   if(enterredTitle.isEmpty || enterredAmount <= 0 || selectedDate == null) {
     return;
   }
   
     widget.addTx(
     enterredTitle, 
       enterredAmount,
       selectedDate
       );

       Navigator.of(context).pop();
   }

   void presentDatePicker() {
     showDatePicker(context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019),
       lastDate: DateTime.now()).then((pickedDate) {
         if(pickedDate == null) {
           return;
         }
         setState(() {
            selectedDate = pickedDate;
         });
       
       });
   }

  

  @override
  Widget build(BuildContext context) {
    return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                   
                    children: <Widget> [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child:
                      TextField(
                        decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                        ),
                        controller: titleController,
                        onSubmitted: (_) => submittedData(),
                        ),
                      ),
                      TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Amount',
  ),
  controller: amountController,
  keyboardType: TextInputType.number,
  onSubmitted: (_) => submittedData(),
  ),
  Container(
    height: 70,
    child: Row(
    children: <Widget>[
      Text(selectedDate == null ? 'No Date Choosen' : DateFormat.yMMMd().format(selectedDate)),
      FlatButton(
        onPressed: presentDatePicker,
    // onPressed: () {
    //     DatePicker.showDatePicker(context,
    //                           showTitleActions: true,
    //                           minTime: DateTime(2018, 3, 5),
    //                           maxTime: DateTime(2019, 6, 7), onChanged: (date) {
    //                         print('change $date');
    //                       }, onConfirm: (date) {
    //                         print('confirm $date');
    //                       }, currentTime: DateTime.now(), locale: LocaleType.en);
    // },
    child: Text(
        'Choose Date',
        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
    )),


      // FlatButton(
      //   textColor: Theme.of(context).primaryColor,
      //   onPressed: () {}, 
      //   child: Text('Choose Date',
      //   style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
    ],
  ),
  ),
  // RaisedButton(
  //   onPressed: submittedData),      
  RaisedButton(
   onPressed: submittedData,
   child: Text(
    'Add Transaction'),
    
    // style: TextStyle(
    //   color: Colors.purple,
      
    // ),
  color: Theme.of(context).primaryColor,
  textColor: Colors.white,
)

                  ])
                );
  }
}