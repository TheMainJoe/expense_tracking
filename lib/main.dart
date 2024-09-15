import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Custom packages
import 'package:expense_app/blocs/app_blocs.dart';
import 'package:expense_app/repositories/repositories.dart';
import 'package:expense_app/screens/screens.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    )
  );
}

extension on ThemeData {
  dark() {}
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({ @required this.sharedPreferences, });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TransactionsRepository(), 
      child: ExpenseTrackingApp()
    );
  }
}

class ExpenseTrackingApp extends StatelessWidget {
  const ExpenseTrackingApp({ Key key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder:(context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Expense Tracking',
          home: MyHomePage(),
          theme: state.theme,
        );
      },
    );
  }
}