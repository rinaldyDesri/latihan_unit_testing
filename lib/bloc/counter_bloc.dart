import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is Add) {
      yield state + event.amount;
    } else if (event is Subtract) {
      yield state - event.amount;
    } else {
      yield state;
    }
  }
}
