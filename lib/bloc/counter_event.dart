part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  final int amount;

  CounterEvent(this.amount);
}

class Add extends CounterEvent {
  Add(int amount) : super(amount);
}

class Subtract extends CounterEvent {
  Subtract(int amount) : super(amount);
}

class DoingNothing extends CounterEvent {
  DoingNothing() : super(null);
}
