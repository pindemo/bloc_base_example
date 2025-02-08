import 'package:base/util/console.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterInitial> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterAddPressed>((event, emit) {
      final newCount = state.count + 1;
      emit(
        state.copyWith(
          count: newCount.clamp(state.min, state.max),
        ),
      );
    });

    on<CounterRemovePressed>((event, emit) {
      final newCount = state.count - 1;
      emit(
        state.copyWith(
          count: newCount.clamp(state.min, state.max),
        ),
      );
    });

    on<CounterResetPressed>((event, emit) {
      emit(
        state.copyWith(count: state.min),
      );
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
