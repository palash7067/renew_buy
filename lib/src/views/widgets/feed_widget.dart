import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renew_buy/core/theme/colors.dart';
import 'package:renew_buy/core/utils/constants.dart';
import 'package:renew_buy/src/controllers/feed_bloc/feed_bloc.dart';
import 'package:renew_buy/src/views/widgets/feed_tile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FeedWidget extends StatelessWidget {
  final FeedBloc feedBloc;
  final FeedFetchingSuccessfulState successState;
  final TextEditingController search;
  const FeedWidget({super.key, required this.successState, required this.feedBloc, required this.search});


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return RefreshIndicator(
      key: const Key('successState'),
      onRefresh: ()async{
        feedBloc.add(FeedInitialFetchEvent(isPullToRefresh: true));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
                color: whiteColor,
                boxShadow:[
                  BoxShadow(
                    color: blackColor.withOpacity(0.1),
                    blurRadius: 30.0,
                    spreadRadius: 10,
                  )
                ]
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: 1.h,),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.sidebar),
                      Expanded(child: Text(successState.title, style: textTheme.displaySmall, textAlign: TextAlign.center,)),
                      SvgPicture.asset(Assets.notification),
                    ],
                  ),
                  SizedBox(height: 0.5.h,),
                  const Divider(thickness: 1),
                  SizedBox(height: 0.5.h,),
                  TextField(
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    controller: search,
                    style: textTheme.displaySmall,
                    onChanged: (value){
                      feedBloc.add(FeedSearchEvent(search: search.text));
                    },
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: textTheme.displaySmall?.copyWith(color: textLightColor),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        suffixIcon: Icon(Icons.search, size: 3.h, color: textDarkColor,),
                        suffixIconConstraints: const BoxConstraints()
                    ),
                  ),
                  SizedBox(height: 2.h,),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              itemCount: successState.feeds.length,itemBuilder: (context, index){
              final feed = successState.feeds[index];
              if(feed.imageHref.isNotEmpty && feed.title.isNotEmpty && feed.description.isNotEmpty){
                return FeedTile(
                  feed: feed,
                );
              }
              return const SizedBox();
            }, separatorBuilder: (BuildContext context, int index) {
              final feed = successState.feeds[index];
              if(feed.imageHref.isNotEmpty && feed.title.isNotEmpty && feed.description.isNotEmpty){
                return SizedBox(height: 2.h,);
              }
              return const SizedBox();
            },),
          ),
        ],
      ),
    );
  }
}
