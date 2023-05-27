import 'package:flutter/material.dart';

class SearchScreenPage extends StatelessWidget {
  const SearchScreenPage({Key? key}) : super(key: key);

  static const route = "/search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("data")),
    );
  }
}
