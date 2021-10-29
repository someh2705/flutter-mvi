import 'package:get/get.dart';
import 'package:mvi/core/model/base_model.dart';

abstract class BaseAction<T extends BaseState> extends GetxController {
  late final Rx<T> _state;

  Rx<T> get state => _state;

  @override
  void onInit() {
    _state = Rx<T>(initState);
    super.onInit();
  }

  T get initState;
}
