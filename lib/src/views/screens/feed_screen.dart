import 'package:flutter/material.dart';
import 'package:renew_buy/src/controllers/feed_bloc/feed_bloc.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  final FeedBloc feedBloc = FeedBloc();

  @override
  void initState() {
    super.initState();
    feedBloc.add(FeedInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
