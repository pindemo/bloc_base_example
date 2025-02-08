import 'package:base/util/console.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/transformers.dart';

part 'counter_event.dart';
part 'counter_state.dart';

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

/// CounterBloc 用于管理计数器的状态
/// 继承自 Bloc<CounterEvent, int>，表示接收 CounterEvent 类型的事件，管理 int 类型的状态
class CounterBloc extends Bloc<CounterEvent, int> {
  /// 构造函数
  /// 初始化状态值为 0，并注册事件处理器
  CounterBloc() : super(0) {
    /// 注册 CounterIncrementPressed 事件的处理逻辑
    on<CounterIncrementPressed>(
      (event, emit) {
        // 模拟一个错误
        addError(Exception('increment error!'), StackTrace.current);
        // 发出新状态：当前值加1
        emit(state + 1);
      },
      // 利用响应式操作符
      transformer: debounce(const Duration(milliseconds: 300)),
      // 使用预定义的事件转换器
      // transformer: sequential(),
    );
  }

  /// 当状态发生变化时被调用
  /// [change] 包含变化前后的状态
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    console.e(change);
  }

  /// 在状态转换期间被调用，发生在 onChange 之前
  /// [transition] 包含当前事件、当前状态和下一个状态
  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    console.e(transition);
  }

  /// 当接收到新事件时被调用
  /// [event] 接收到的事件
  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    console.e(event);
  }

  /// 当发生错误时被调用
  /// [error] 错误对象
  /// [stackTrace] 错误堆栈跟踪
  @override
  void onError(Object error, StackTrace stackTrace) {
    console.e('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
