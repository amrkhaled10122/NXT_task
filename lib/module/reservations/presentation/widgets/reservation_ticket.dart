import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/user_ticket.dart';
import '../../../../core/component/dashed_line.dart';
import '../../../../core/helpers/extension/context_extension.dart';
import '../../../../core/helpers/extension/size_extension_box.dart';

class ReservationTicket extends StatelessWidget {
  final UserTicket userTicket;
  const ReservationTicket({super.key, required this.userTicket});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              15.widthBox,
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.w,
                      color: Theme.of(context).colorScheme.onPrimary,
                    )),
                child: ClipOval(
                  child: CachedNetworkImage(
                    width: 34.w,
                    height: 34.w,
                    fit: BoxFit.cover,
                    imageUrl: userTicket.ticketUserData?.avatar ?? "",
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "${userTicket.ticketUserData?.firstName ?? ""} ${userTicket.ticketUserData?.lastName ?? ""}",
                        style: Theme.of(context).primaryTextTheme.titleMedium,
                      ),
                      Text(
                        "#${userTicket.ticketId}",
                        style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _buildLineWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                16.heightBox,
                Row(
                  children: [
                    Text(
                      "${context.localization.ticketType}: ",
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                    Text(
                      userTicket.ticketTypeName,
                      style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                    ),
                  ],
                ),
                6.heightBox,
                Row(
                  children: [
                    Text("${context.localization.seat}: ", style: Theme.of(context).primaryTextTheme.titleMedium),
                    Text(
                      userTicket.seat,
                      style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                    ),
                  ],
                ),
                10.heightBox,
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLineWidget() {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 18.w,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
          ),
        ),
        const Expanded(child: DashedLine()),
        Container(
          width: 10.w,
          height: 18.w,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
          ),
        ),
      ],
    );
  }
}
