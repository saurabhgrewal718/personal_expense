import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;
  void _submitData(){
    if(_amountController.text.isEmpty){
      return;
    }

    final enteredTitle= _titleController.text;
    final enteredAmount= double.parse(_amountController.text);

    if(enteredAmount<=0 || enteredTitle.isEmpty || _selectedDate==null){
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();

  }

  void _presentDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now()
    ).then((pickedDate) {
      if(pickedDate==null){
        return;
      }
      setState(() {
        _selectedDate= pickedDate;
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Where you Spent your money now ?'),
                    // onChanged: (val){
                    //   titleInput=val;
                    // },
                    controller:_titleController,
                    onSubmitted: (_) => _submitData,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'How much ?'),
                    keyboardType: TextInputType.number,
                    // onChanged: (val){
                    //   amountInput=val;
                    // },
                    onSubmitted: (_) => _submitData,
                    controller: _amountController,
                  ),
                  Container(
                    height: 70,
                    child: Row(children: <Widget>[
                      Expanded(child: Text(_selectedDate == null ? 'No Date Choosen' : 'Picked Date : ${DateFormat.yMd().format(_selectedDate)} ',style: TextStyle(fontSize: 14))),
                      FlatButton(
                          child: Text('Choose Date',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 18),),
                          onPressed: _presentDatePicker,
                        ),
                    ],),
                  ),
                  RaisedButton(
                    child: Text("Submit"),
                    color: Colors.orange,
                    onPressed:_submitData,
                  )
                ],),
              ),
            );
  }
}