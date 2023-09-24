part of 'feed_bloc.dart';

@immutable
abstract class FeedState {}

abstract class FeedActionState extends FeedState{}

class FeedInitial extends FeedState {}

class FeedFetchingLoadingState extends FeedState{}

class FeedFetchingErrorState extends FeedState{}

class FeedFetchingSuccessfulState extends FeedState{
  final String title;
  final List<Feed> feeds;
  FeedFetchingSuccessfulState({
    required this.title,
    required this.feeds
  });
}