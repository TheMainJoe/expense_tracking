import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    AppBar _appbar = AppBar(
      title: Text('Expense Tracking'),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => BlocProvider<SearchCubit>(
                  create: (context) => SearchCubit(
                    transactionsRepository: context.read<TransactionsRepository>(),
                  )..loadAll(),
                  child: SearchPage(),
                )
              )
            );
          },
        )
      ],
    )
  
    return Scaffold(
      appBar: _appbar,
      body: SingleChildScrollView(
        child: BlocConsumer<TransactionBloc, TransactionState>(
          
        )
      ),
    );
  }


}