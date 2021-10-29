import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvi/feature/state/home_state.dart';

String LINK =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/00_210_Bw_Angerbr%C3%BCcke%2C_ET_5084.jpg/1024px-00_210_Bw_Angerbr%C3%BCcke%2C_ET_5084.jpg';

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

class HomeAction extends BaseAction<HomeState> {
  void onClick() {
    state.value = HomeLoadingState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Image(
              image: NetworkImage(LINK),
            )).then((value) {
      state.value = HomeCompleteState(value);
    }, onError: (e) {
      if (e is NetworkImageLoadException) {
        state.value = HomeUnloadState();
      } else {
        state.value = HomeErrorState(e);
      }
    });
  }

  @override
  HomeState get initState => HomeUnloadState();
}
