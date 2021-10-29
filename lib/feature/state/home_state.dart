import 'package:flutter/cupertino.dart';

class BaseState {}

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

class HomeState extends BaseState {
  HomeState();
}

class HomeLoadingState extends HomeState {
  HomeLoadingState() : super();
}

class HomeUnloadState extends HomeState {
  HomeUnloadState() : super();
}

class HomeErrorState extends HomeState {
  HomeErrorState(this.error) : super();

  final String error;
}

class HomeCompleteState extends HomeState {
  HomeCompleteState(this.image) : super();

  final Image image;
}
