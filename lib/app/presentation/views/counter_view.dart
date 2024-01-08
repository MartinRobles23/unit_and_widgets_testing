// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              key: const Key('iconBtn_abc'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: const Text('Screen'),
                        ),
                        body: const Center(
                          child: Text('Screen ABC'),
                        ),
                      ),
                    ));
              },
              icon: const Icon(Icons.abc))
        ],
      ),
      body: Center(
        child: Text(
          '$_counter',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButton: _counter < 5
          ? FloatingActionButton(
              key: const Key('fBtn'),
              onPressed: _increment,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
