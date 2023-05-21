import 'package:flutter/material.dart';

class NewTabScreen extends StatefulWidget {
  const NewTabScreen({super.key});

  @override
  State<NewTabScreen> createState()=> _NewTabScreenState();
}

class _NewTabScreenState extends State<NewTabScreen> {
  String maintitle = "News";

@override
void initState() {
  super.initState();
  print("News");
}

@override
void dispose() {
  super.dispose();
  print("dispose");
}

 @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(maintitle),
    );
  }
}