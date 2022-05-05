import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

extension GetPageNavigation on GetInterface {
  static var tagBag = <String>{};

  String getUniqueTag() {
    var randomTag = Random().nextInt(999999).toString();
    if (tagBag.contains(randomTag)) {
      return getUniqueTag();
    }
    tagBag.add(randomTag);
    return randomTag;
  }

  Future<T?>? toView<T>(Widget view, {
    bool? opaque,
    Transition? transition,
    Curve? curve,
    Duration? duration,
    int? id,
    String? routeName,
    bool fullscreenDialog = false,
    dynamic arguments,
    Bindings? binding,
    bool preventDuplicates = false,
    bool? popGesture,
    double Function(BuildContext context)? gestureWidth,
  }) {
    Get.to(() => view,
        binding: binding,
        routeName: routeName,
        opaque: opaque,
        transition: transition,
        curve: curve,
        duration: duration,
        id: id,
        fullscreenDialog: fullscreenDialog,
        arguments: arguments,
        preventDuplicates: preventDuplicates,
        popGesture: popGesture,
        gestureWidth: gestureWidth);
  }

  Future<T?>? toPage<T>(GetPage page, {
    bool? opaque,
    Transition? transition,
    Curve? curve,
    Duration? duration,
    int? id,
    bool fullscreenDialog = false,
    dynamic arguments,
    bool preventDuplicates = false,
    bool? popGesture,
    double Function(BuildContext context)? gestureWidth,
  }) {
    Get.to(page.page,
        binding: page.binding,
        routeName: page.name,
        opaque: opaque,
        transition: transition,
        curve: curve,
        duration: duration,
        id: id,
        fullscreenDialog: fullscreenDialog,
        arguments: arguments,
        preventDuplicates: preventDuplicates,
        popGesture: popGesture,
        gestureWidth: gestureWidth);
  }
}