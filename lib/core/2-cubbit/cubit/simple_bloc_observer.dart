import 'package:base/util/console.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// SimpleBlocObserver 用于全局监听所有 Bloc/Cubit 的状态变化和错误
/// 继承自 BlocObserver 以实现观察者功能
class SimpleBlocObserver extends BlocObserver {
  /// 当任何 Bloc/Cubit 发生状态变化时被调用
  /// 先会被调用
  /// [bloc] 发生变化的 Bloc/Cubit 实例
  /// [change] 包含变化前后的状态信息
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // 打印 Bloc/Cubit 的类型和状态变化信息
    console.e('${bloc.runtimeType} $change');
  }

  /// 当任何 Bloc/Cubit 发生错误时被调用
  /// [bloc] 发生错误的 Bloc/Cubit 实例
  /// [error] 错误对象
  /// [stackTrace] 错误堆栈跟踪
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // 打印 Bloc/Cubit 的类型、错误信息和堆栈跟踪
    console.e('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
