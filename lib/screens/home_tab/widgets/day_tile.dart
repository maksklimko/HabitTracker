import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/providers/home_tab_provider.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constants.dart';

class DayTile extends ConsumerWidget {
  const DayTile( {super.key,required this.habitId, required this.isSelected, required this.date,});
  final int habitId;
  final bool isSelected;
  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final month = DateFormat('MMM').format(date);
    final isCurrentDate =
        DateUtils.dateOnly(date) == DateUtils.dateOnly(DateTime.now());
    final isLastMonthDay =
        date.day == DateUtils.getDaysInMonth(date.year, date.month);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            height: 50,
            alignment: Alignment.bottomCenter,
            child: isLastMonthDay || isCurrentDate
                ? Text(
              month,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.xbec0c7),
            )
                : Container(),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: ()=>ref.read(homeTabProvider.notifier).toggleDay(habitId,isSelected,date),
            child: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: isCurrentDate ? Border.all(color: AppColors.x08080a,width: 3) : null,
                  color: isSelected?AppColors.x08080a:AppColors.xbec0c7,
                  shape: BoxShape.circle),
              child: Text(
                date.day.toString(),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: isSelected?AppColors.xf6f6f7:AppColors.x08080a),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            Constants.days[date.weekday - 1],
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.xbec0c7),
          ),
        ],
      ),
    );
  }
}
