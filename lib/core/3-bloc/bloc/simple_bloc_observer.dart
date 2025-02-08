import 'package:base/util/console.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// SimpleBlocObserver 用于全局监听所有 Bloc 的事件、状态变化和错误
/// 继承自 BlocObserver 以实现观察者功能
class SimpleBlocObserver extends BlocObserver {
  /// 当任何 Bloc 接收到事件时被调用
  /// [bloc] 接收事件的 Bloc 实例
  /// [event] 接收到的事件
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    console.e('${bloc.runtimeType} $event');
  }

  /// 当任何 Bloc/Cubit 发生状态变化时被调用
  /// [bloc] 发生变化的 Bloc/Cubit 实例
  /// [change] 包含变化前后的状态信息
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    console.e('${bloc.runtimeType} $change');
  }

  /// 当任何 Bloc 发生状态转换时被调用
  /// [bloc] 发生转换的 Bloc 实例
  /// [transition] 包含事件、当前状态和下一个状态
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    console.e('${bloc.runtimeType} $transition');
  }

  /// 当任何 Bloc/Cubit 发生错误时被调用
  /// [bloc] 发生错误的 Bloc/Cubit 实例
  /// [error] 错误对象
  /// [stackTrace] 错误堆栈跟踪
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    console.e('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
