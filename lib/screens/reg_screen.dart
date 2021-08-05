import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_reg_mvvm_provider/model/Login_model.dart';
import 'package:login_reg_mvvm_provider/model/employee_login_model.dart';
import 'package:login_reg_mvvm_provider/network/api_response.dart';
import 'package:login_reg_mvvm_provider/utils/utility.dart';
import 'package:login_reg_mvvm_provider/viewmodel/register_viewmodel.dart';
import 'package:provider/provider.dart';

import '../PlatformService.dart';
import 'home_screen.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  bool priceReductionControllerSubmited = false;
  bool perReductionControllerSubmited = false;
  LoginModel loginModel = LoginModel();
  ApiResponse? apiResponse;
  EmployeeLoginModel? employeeLoginModel;
  dynamic mediaList;
  String? userName, passwords;
  Map _source = {ConnectivityResult.none: false};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final email = TextFormField(
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      autovalidate: true,
      decoration: InputDecoration(labelText: 'User Name'),
      validator: (value) {
        if(value!.isEmpty && priceReductionControllerSubmited) {
          return 'UserName can\'t be empty';
        }
        else {
          userName= value;
          return null;
        }
      },
      onChanged: (value){
        loginModel.userName = value;
      },
    );

    final password = TextFormField(
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.done,
      autovalidate: true,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
      ),
      validator: (value) {
        if(value!.isEmpty && perReductionControllerSubmited) {
          return 'Password can\'t be empty';
        }
        else {
          passwords=value;
          return null;
        }
      },
      onChanged: (value){
        loginModel.password = value;
      },
    );

    final loginButton = Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: RaisedButton(
        onPressed: () {
          setState(() {
            priceReductionControllerSubmited = true;
            perReductionControllerSubmited =true;
          });
          if(userName!.isNotEmpty && passwords!.isNotEmpty){
            Utility.checkConnection().then((connectionResult) {
              if(connectionResult){
                _createPost(context, userName!, passwords!);
              }else{
                Fluttertoast.showToast(
                    msg: "Please check Internet Connectivity",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
            });
          }
          /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );*/
        },
        padding: EdgeInsets.all(PlatFormServices.isMobile(context)?12:24),
        color: Color(0xFF0D46BB),
        child: Text('Log In',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: PlatFormServices.isMobile(context)?
      Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFF0D46BB),
                ),
              ],
            ),
          ),
          Center(
            child: Card(
              elevation: 2.0,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 1.7,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Text(
                              "Admin",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        SizedBox(height: 28.0),
                        email,
                        SizedBox(height: 8.0),
                        password,
                        SizedBox(height: 8.0),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text("Remember Me")
                          ],
                        ),
                        SizedBox(height: 28.0),
                        loginButton,
                        forgotLabel,
                        Provider.of<RegViewModel>(context, listen: true).response!=null
                            ? getMediaWidget(context, Provider.of<RegViewModel>(context, listen: true).response)
                            : Container()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ):
      Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF0D46BB),
              ),
            ],
          ),
          Center(
            child: Card(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.all(42),
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 1.3,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 42.0),
                      Center(
                          child: Text(
                            "Admin",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height: 48.0),
                      email,
                      SizedBox(height: 8.0),
                      password,
                      SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              Text("Remember Me")
                            ],
                          ),
                          forgotLabel,
                        ],
                      ),
                      SizedBox(height: 18.0),
                      loginButton,
                      Provider.of<RegViewModel>(context, listen: true).response!=null
                          ? getMediaWidget(context, Provider.of<RegViewModel>(context, listen: true).response)
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

  void _createPost(BuildContext context, String userName, String password) async{
    mediaList = await Provider.of<RegViewModel>(context, listen: false).loginPost({"userId": userName, "password": password});
    apiResponse = Provider.of<RegViewModel>(context, listen: false).response;
    if(mediaList!=null){
      employeeLoginModel = new EmployeeLoginModel.fromJson(mediaList);
      if(employeeLoginModel!.statusCode=="200"){
        print("employeeLoginModel: $employeeLoginModel");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (Route<dynamic> route) => false);
      }
    }
  }

  Widget getMediaWidget(BuildContext context, ApiResponse apiResponse) {
    switch(apiResponse.status){
      case Status.INITIAL:
        return Text("");
      case Status.LOADING:
        return CircularProgressIndicator();
      case Status.ERROR:
        return Text('Please try again latter!!!');
      case Status.COMPLETED:
        return Text("${employeeLoginModel!.statusCode}");
    }
  }
}