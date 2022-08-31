import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
      SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchcontroller =TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              TextFormField(
                controller: searchcontroller,
                keyboardType: TextInputType.text,
              ),
            ],
          )
        ],
      ),
    );
  }
}
