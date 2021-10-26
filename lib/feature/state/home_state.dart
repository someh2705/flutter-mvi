import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeState {
  HomeState._();

  factory HomeState.loading() = HomeLoadingState;
  factory HomeState.unload() = HomeUnloadState;
  factory HomeState.complete(Image image) = HomeCompleteState;
  factory HomeState.error(String error) = HomeErrorState;
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
