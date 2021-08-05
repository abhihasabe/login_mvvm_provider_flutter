import 'package:flutter/material.dart';
import 'package:login_reg_mvvm_provider/model/Login_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }
}

class _LoginScreen extends State {
  bool priceReductionControllerSubmited = false;
  bool perReductionControllerSubmited = false;
  LoginModel loginModel = LoginModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : <Widget>[
              TextFormField(
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                autovalidate: true,
                decoration: InputDecoration(labelText: "UserName"),
                validator: (value) {
                  if(value!.isEmpty && priceReductionControllerSubmited) {
                    return 'UserName can\'t be empty';
                  }
                  else {
                    return null;
                  }
                },
                onSaved: (value){
                  loginModel.userName = value;
                },
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.done,
                autovalidate: true,
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) {
                  if(value!.isEmpty && perReductionControllerSubmited) {
                    return 'Password can\'t be empty';
                  }
                  else {
                    return null;
                  }
                },
                onSaved: (value){
                  loginModel.password = value;
                },
              ),
              SizedBox(height: 30,),
              Container(
                width: 350,
                child: RaisedButton(
                  color: Colors.indigo,
                  onPressed: () async {
                    setState(() {
                      priceReductionControllerSubmited = true;
                      perReductionControllerSubmited =true;
                    });
                  }, child: Text("Login", style: TextStyle(color:Colors.white),),),
              )
            ]
        ),
      ),
    );
  }
}
