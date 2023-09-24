import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renew_buy/src/controllers/feed_bloc/feed_bloc.dart';
import 'package:renew_buy/src/views/widgets/custom_loading_widget.dart';
import 'package:renew_buy/src/views/widgets/feed_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  final FeedBloc feedBloc = FeedBloc();
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    feedBloc.add(FeedInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FeedBloc, FeedState>(
        bloc: feedBloc,
        listenWhen: (previous, current) => current is FeedActionState,
        buildWhen: (previous, current) => current is !FeedActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch(state.runtimeType){
            case FeedFetchingLoadingState:
              return const CustomLoadingWidget(key: Key('loadingState'));

            case FeedFetchingSuccessfulState:
              final successState = state as FeedFetchingSuccessfulState;
              return FeedWidget(
                feedBloc: feedBloc,
                successState: successState,
                search: search,
              );

            case FeedFetchingErrorState:
              return const NoDataFoundWidget();
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
