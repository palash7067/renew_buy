import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:renew_buy/services/api/api_services.dart';
import 'package:renew_buy/src/models/feed_model.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {

  final ApiService apiService = ApiService();
  FeedModel feedModel = const FeedModel();

  FeedBloc() : super(FeedInitial()) {
    on<FeedInitialFetchEvent>(feedInitialFetchEvent);
    on<FeedSearchEvent>(feedSearchEvent);
  }

  FutureOr<void> feedInitialFetchEvent(FeedInitialFetchEvent event, Emitter<FeedState> emit)async {
    if(!event.isPullToRefresh) emit(FeedFetchingLoadingState());
    final response = await apiService.getFeed();
    response.fold((failure) {
      debugPrint("Failed");
      emit(FeedFetchingErrorState());
    }, (success) {
      debugPrint("Success");
      feedModel = success;
      emit(FeedFetchingSuccessfulState(title: success.title ?? '', feeds: success.feeds ?? []));
    });
  }

  FutureOr<void> feedSearchEvent(FeedSearchEvent event, Emitter<FeedState> emit) {
    final searchedList = feedModel.feeds?.where((element) => element.title.toLowerCase().contains(event.search.toLowerCase())).toList();
    emit(FeedFetchingSuccessfulState(title: feedModel.title ?? '', feeds: searchedList ?? []));
  }
}
