import 'package:base/console.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../counter_repository.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterInitial> {
  final CounterRepository repository;

  CounterBloc({required this.repository}) : super(CounterInitial()) {
    // 初始化时从repository获取数据
    on<CounterInitializePressed>((event, emit) async {
      final initialCount = await repository.fetchInitialCount();
      emit(state.copyWith(count: initialCount));
    });

    on<CounterAddPressed>((event, emit) async {
      final newCount = state.count + 1;
      final clampedCount = newCount.clamp(state.min, state.max);
      emit(state.copyWith(count: clampedCount));
      // 保存到repository
      await repository.saveCount(clampedCount);
    });

    on<CounterRemovePressed>((event, emit) async {
      final newCount = state.count - 1;
      final clampedCount = newCount.clamp(state.min, state.max);
      emit(state.copyWith(count: clampedCount));
      // 保存到repository
      await repository.saveCount(clampedCount);
    });

    on<CounterResetPressed>((event, emit) async {
      emit(state.copyWith(count: state.min));
      // 保存到repository
      await repository.saveCount(state.min);
    });
  }

  /// 当状态发生变化时被调用
  /// [change] 包含变化前后的状态
  @override
  void onChange(Change<CounterInitial> change) {
    super.onChange(change);
    console.e(
        'Counter changed from ${change.currentState.count} to ${change.nextState.count}');
  }
}
