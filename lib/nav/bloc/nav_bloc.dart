import 'dart:async';

import 'package:bloc/bloc.dart';
import '/enums/enums.dart';
import 'package:equatable/equatable.dart';

part 'nav_event.dart';

class NavBloc extends Bloc<NavEvent, NavItem> {
  NavBloc() : super(NavItem.dashboard);

  @override
  Stream<NavItem> mapEventToState(
    NavEvent event,
  ) async* {
    if (event is UpdateNavItem) {
      yield event.item;
    }
  }
}
