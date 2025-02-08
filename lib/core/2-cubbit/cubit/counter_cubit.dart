import 'package:base/util/console.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

/// CounterCubit 类用于管理计数器的状态
/// 继承自 Cubit<int>，表示状态类型为整数
class CounterCubit extends Cubit<int> {
  /// 构造函数
  /// 初始化状态值为 0
  CounterCubit() : super(0);

  /// 增加计数的方法
  /// 模拟一个错误并发出新的状态
  void increment() {
    // 添加一个测试用的错误
    addError(Exception('increment error!'), StackTrace.current);
    // 发出新状态：当前值加1
    // emit 是保护方法，意味着它只能在 Cubit 内部被调用。
    emit(state + 1);
  }

  /// 重写 onChange 方法以监听状态变化
  /// Change 发生在 Cubit 状态更新之前。Change 包括 currentState 和 nextState。
  /// [change] 包含当前状态和下一个状态
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    // 打印状态变化信息
    console.e(change);
  }

  /// 重写 onError 方法以处理错误
  /// [error] 错误对象
  /// [stackTrace] 错误堆栈跟踪
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    // 打印错误信息和堆栈跟踪
    console.e('$error, $stackTrace');
  }
}
