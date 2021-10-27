import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvi/feature/intent/home_intent.dart';
import 'package:mvi/feature/state/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  HomeAction get action => Get.find<HomeAction>();

  Widget render(HomeState state) {
    switch (state.to) {
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

  @override
  Widget build(BuildContext context) {
    Get.put(HomeAction());
    return GetBuilder<HomeAction>(
      builder: (controller) {
        return Obx(() => render(controller.state.value));
      },
    );
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
