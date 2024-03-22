import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extension/context_extension.dart';
import '../../../../core/helpers/extension/size_extension_box.dart';

class ReservationGallery extends StatelessWidget {
  final List<String> imageURLs;
  const ReservationGallery({super.key, required this.imageURLs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.localization.gallery,
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        10.heightBox,
        SizedBox(
          height: 225.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageURLs.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(end: 6.w),
                  child: CachedNetworkImage(
                    imageUrl: imageURLs[index],
                    width: 150.w,
                    fit: BoxFit.cover,
                  ),
                );
              }),
        )
      ],
    );
  }
}
