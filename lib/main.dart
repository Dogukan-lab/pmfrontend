import 'package:flutter/material.dart';
import 'package:pmfrontend/widgets/profile_card.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pale Messenger',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: ProfileCard(
          roundedRadius: 100.0,
        ),
      ),
    ),
  );
}
