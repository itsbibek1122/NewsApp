import 'package:flutter/material.dart';
import 'package:news_app/models/api_call.dart';
import 'package:news_app/widgets/appbar.dart';
import 'package:news_app/widgets/news_card.dart';
import 'package:news_app/widgets/news_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomAppBar(),
    );
  }
}
