import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/utils/common/widgets/shimmer_container.dart';
import 'package:test_app/utils/constants/spacing.dart';

class GoupTileShimmer extends StatelessWidget {
  const GoupTileShimmer({
    super.key,
    this.count = 7,
  });
  final int count;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, i) {
          return ShimmerContainer(width: size.width, height: 66.h);
        },
        separatorBuilder: (context, i) {
          return lgVerticalSpace;
        },
        itemCount: count,
      ),
    );
  }
}
