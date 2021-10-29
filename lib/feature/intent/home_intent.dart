import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvi/core/intent/base_intent.dart';
import 'package:mvi/feature/state/home_state.dart';

String LINK = 'https://thecatapi.com/api/images/get?format=src&type=gif';

class HomeAction extends BaseAction<HomeState> {
  void onClick() {
    state.value = HomeLoadingState();
    Future.delayed(const Duration(seconds: 2), () async {
      state.value = HomeCompleteState(Image.asset('assets/ic_launcher.png'));
    });
  }

  @override
  HomeState get initState => HomeUnloadState();
}
