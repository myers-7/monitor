import 'package:flutter/material.dart';
import 'package:monitor/widgets/textwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.monitor),
                TextWidget(
                  size: 15,
                  text: 'Home Page',
                  color: Colors.white,
                  bold: true,
                ),
                Icon(Icons.settings)
              ],
            )),
        body: ListView(
          children: const [],
        ));
  }
}
