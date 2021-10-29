import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvi/core/intent/base_intent.dart';
import 'package:mvi/core/model/base_model.dart';

abstract class BaseView<T extends BaseAction> extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  T get action => Get.find<T>();

  T get init;

  Widget render(BaseState state);

  @override
  Widget build(BuildContext context) {
    Get.put(init);
    return GetBuilder<T>(
        builder: (controller) => Obx(() => render(action.state.value)));
  }
}
