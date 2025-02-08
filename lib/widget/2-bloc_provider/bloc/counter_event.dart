part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class CounterAddPressed extends CounterEvent {}

final class CounterRemovePressed extends CounterEvent {}

final class CounterResetPressed extends CounterEvent {}
