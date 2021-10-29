import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvi/feature/intent/home_intent.dart';
import 'package:mvi/feature/state/home_state.dart';

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

class HomeView extends BaseView<HomeAction> {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeAction get action => Get.find<HomeAction>();

  @override
  HomeAction get init => HomeAction();

  @override
  Widget render(BaseState state) {
    switch ((state as HomeState).to) {
      case HomeEnum.loading:
        return renderLoadingState();
      case HomeEnum.unload:
        return renderUnloadingState();
      case HomeEnum.complete:
        return renderCompleteState((state as HomeCompleteState).image);
      case HomeEnum.error:
        return renderErrorState((state as HomeErrorState).error);
    }
  }

  Widget renderLoadingState() {
    return const CenterWidget(child: CircularProgressIndicator());
  }

  Widget renderUnloadingState() {
    return CenterWidget(
        child: TextButton(
            onPressed: () {
              action.onClick();
            },
            child: const Text('다시 시도')));
  }

  Widget renderCompleteState(Image image) {
    return CenterWidget(child: image);
  }

  Widget renderErrorState(String error) {
    Get.snackbar(error, '', duration: const Duration(microseconds: 1000));
    return renderUnloadingState();
  }
}

class CenterWidget extends StatelessWidget {
  const CenterWidget({Key? key, required this.child, this.width, this.height})
      : super(key: key);

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
          child: SizedBox(
        width: width,
        height: height,
        child: child,
      )),
    );
  }
}
