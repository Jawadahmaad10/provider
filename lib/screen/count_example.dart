import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/count_provider.dart';

import '../provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final countProvider = Provider.of<CountProvider>(context, listen: false);

    Timer.periodic(Duration(seconds: 2), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    //using this variale and accessing the provider class instance variables
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    //listen false because it rebuilds again and again so listen = false

    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribe'),
      ),
      body: Center(
        //consumer widget only this widget will consume the ram required solution of widget to setstate
        child: Consumer<CountProvider>(builder: ((context, value, child) {
          return Text(
            value.count.toString(),
            style: TextStyle(fontSize: 50),
          );
        })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
