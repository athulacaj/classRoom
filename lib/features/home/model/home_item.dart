import 'package:flutter/material.dart';

class HomeItem {
  final String title;
  final String icon;
  final Color color;
  final String? route;

  const HomeItem({
    required this.title,
    required this.icon,
    required this.color,
    this.route,
  });
}
