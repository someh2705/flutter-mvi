import 'package:flutter/cupertino.dart';

enum HomeEnum { loading, unload, complete, error }

extension HomeEnumExtension on HomeEnum? {
  HomeState toState(dynamic param) {
    switch (this) {
      case HomeEnum.loading:
        return HomeLoadingState();
      case HomeEnum.unload:
        return HomeUnloadState();
      case HomeEnum.complete:
        return HomeCompleteState(param);
      default:
        return HomeErrorState(param);
    }
  }
}

extension HomeStateExtension on HomeState? {
  HomeEnum get to {
    switch (runtimeType) {
      case HomeLoadingState:
        return HomeEnum.loading;
      case HomeUnloadState:
        return HomeEnum.unload;
      case HomeCompleteState:
        return HomeEnum.complete;
      default:
        return HomeEnum.error;
    }
  }
}

class HomeState {
  HomeState._();
}

class HomeLoadingState extends HomeState {
  HomeLoadingState() : super._();
}

class HomeUnloadState extends HomeState {
  HomeUnloadState() : super._();
}

class HomeErrorState extends HomeState {
  HomeErrorState(this.error) : super._();

  final String error;
}

class HomeCompleteState extends HomeState {
  HomeCompleteState(this.image) : super._();

  final Image image;
}
