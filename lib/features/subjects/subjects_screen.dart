import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/students/students_screen.dart';
import 'package:test_app/features/subjects/model/subject_model.dart';
import 'package:test_app/features/subjects/subject_controller.dart';
import 'package:test_app/utils/common/widgets/app_bar.dart';
import 'package:test_app/utils/common/widgets/goup_shimmer_loading.dart';
import 'package:test_app/utils/common/widgets/individual_item_view.dart';
import 'package:test_app/utils/common/widgets/three_widget_tile.dart';
import 'package:test_app/utils/constants/spacing.dart';
import 'package:test_app/utils/constants/ui_constants.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key, this.onClick});
  final Function? onClick;

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SubJectController>(
        builder: (context, SubJectController subJectController, _) {
      return Scaffold(
        appBar: commonAppBar(context),
        body: Padding(
          padding: EdgeInsets.all(UiConstants.defaultPadding.w),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Subjects',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              xlVerticalSpace,
              if (subJectController.isLoading)
                const GoupTileShimmer()
              else
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, i) {
                      SubjectModel subjectModel = subJectController.subjects[i];
                      return ThreeWidgetTile(
                        onTap: () {
                          if (widget.onClick != null) {
                            widget.onClick!(subjectModel);
                          } else {
                            showBottomSheet(
                              enableDrag: true,
                              context: context,
                              builder: (context) => IndividualItemView(
                                title: "Subject Details",
                                subTitle: subjectModel.name,
                                thirdTitle: subjectModel.teacher,
                                endTitle: "Credit: ${subjectModel.credits}",
                              ),
                            );
                          }
                        },
                        title: subJectController.subjects[i].name,
                        subtitle: subJectController.subjects[i].teacher,
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(subJectController.subjects[i].credits
                                .toString()),
                            const Text("Credit"),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, i) {
                      return lgVerticalSpace;
                    },
                    itemCount: subJectController.subjects.length,
                  ),
                )
            ],
          ),
        ),
      );
    });
  }
}
