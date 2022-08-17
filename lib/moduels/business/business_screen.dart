import 'package:flutter/material.dart';

class BusinessScrren extends StatelessWidget {
  const BusinessScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(''),
      ),
      body: Center(
        child: Text('business screen',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
