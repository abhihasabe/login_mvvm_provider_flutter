import 'package:flutter/material.dart';
import 'package:login_reg_mvvm_provider/screens/reg_screen.dart';
import 'package:login_reg_mvvm_provider/viewmodel/register_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: RegViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login(),
      ),
    );
  }
}
