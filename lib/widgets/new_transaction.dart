import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    // onChanged: (val){
                    //   titleInput=val;
                    // },
                    controller:titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                    // onChanged: (val){
                    //   amountInput=val;
                    // },
                    controller: amountController,
                  ),
                  RaisedButton(
                    child: Text("Submit"),
                    color: Colors.orange,
                    onPressed: () {
                      addTx(titleController.text,double.parse(amountController.text));
                    },
                  )
                ],),
              ),
            );
  }
}