import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:renew_buy/core/theme/colors.dart';
import 'package:renew_buy/core/utils/constants.dart';
import 'package:renew_buy/src/models/feed_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FeedTile extends StatelessWidget {
  final Feed feed;
  const FeedTile({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
      return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
          boxShadow:[
            BoxShadow(
              color: blackColor.withOpacity(0.1),
              blurRadius: 40.0,
              spreadRadius: 10,
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(feed.imageHref.isNotEmpty || feed.imageHref.isNotEmpty) ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: feed.imageHref,
              fit: BoxFit.cover,
              // height: 25.h,
              width: double.infinity,
              placeholder: (context, url) => const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator(color: primaryColor),),
              ),
              errorWidget: (context, url, error) => SizedBox(
                height: 20.h,
                child: Image.asset(Assets.placeholder),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(feed.title.isNotEmpty) Text(feed.title, style: textTheme.displayMedium),
                if(feed.title.isNotEmpty) SizedBox(height: 0.5.h,),
                if(feed.description.isNotEmpty) Text(feed.description, style: textTheme.headlineLarge?.copyWith(color: textLightColor, fontWeight: FontWeight.w200)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
