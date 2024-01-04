import 'package:flutter/material.dart';
import 'package:test_app/features/home/model/home_item.dart';
import 'package:test_app/utils/common/custom_icons.dart';
import 'package:test_app/utils/constants/route_constants.dart';

const List<HomeItem> homeItemsList = [
  HomeItem(
    title: "Students",
    icon: CustomIcons.student,
    color: Color(0xFFAAC9BF),
    route: RouteConstants.students,
  ),
  HomeItem(
    title: "Subjetcs",
    icon: CustomIcons.subjects,
    color: Color(0xFFD8EBFD),
    route: RouteConstants.subjects,
  ),
  HomeItem(
    title: "Class Rooms",
    icon: CustomIcons.classRooms,
    color: Color(0xFFFFE0DD),
    route: RouteConstants.classRoom,
  ),
  HomeItem(
    title: "Registration",
    icon: CustomIcons.registration,
    color: Color(0xFFFFF3D9),
    route: RouteConstants.registration,
  ),
];
