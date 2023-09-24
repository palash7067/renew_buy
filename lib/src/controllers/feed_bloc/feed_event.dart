part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent {}

class FeedInitialFetchEvent extends FeedEvent{
  final bool isPullToRefresh;
  FeedInitialFetchEvent({this.isPullToRefresh = false});
}

class FeedSearchEvent extends FeedEvent{
  final String search;
  FeedSearchEvent({required this.search});
}
