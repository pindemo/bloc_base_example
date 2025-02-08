part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {
  final int count;
  final int min;
  final int max;

  CounterInitial({
    this.count = 0,
    this.min = 0,
    this.max = 50,
  });

  // 创建新状态的方法
  CounterInitial copyWith({
    int? count,
    int? min,
    int? max,
  }) {
    return CounterInitial(
      count: count ?? this.count,
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }
}
