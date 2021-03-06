import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';

class Utility {

  static Future<bool> checkConnection() async{

    ConnectivityResult connectivityResult = await (new Connectivity().checkConnectivity());

    debugPrint(connectivityResult.toString());

    if ((connectivityResult == ConnectivityResult.mobile) || (connectivityResult == ConnectivityResult.wifi)){
      return true;
    } else {
      return false;
    }
  }

  static void showAlert(BuildContext context, String text) {
    var alert = new AlertDialog(
      content: Container(
        child: Row(
          children: <Widget>[Text(text)],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }
}