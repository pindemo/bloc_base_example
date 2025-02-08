import 'package:base/console.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';
import 'simple_bloc_observer.dart';

fn() {
  // test();
  // test2();
  test3();
}

Future<void> test() async {
  // 创建了一个 CounterBloc
  final bloc = CounterBloc();
  console.w(bloc.state); // 0
  // 发送了一个 CounterIncrementPressed 事件
  bloc.add(CounterIncrementPressed());
  await Future.delayed(Duration.zero);
  console.w(bloc.state); // 1
  // 调用 close 关闭了内部的状态流
  await bloc.close();
}

Future<void> test2() async {
  final bloc = CounterBloc();
  // 订阅了 CounterBloc 并且在每次状态变更时进行打印
  final subscription = bloc.stream.listen(print); // 1
  // 发送了一个 CounterIncrementPressed 事件
  bloc.add(CounterIncrementPressed());
  await Future.delayed(Duration.zero);
  // 取消了订阅
  await subscription.cancel();
  // 关闭了内部的状态流
  await bloc.close();
}

void test3() {
  // 使用 SimpleBlocObserver 来观察 Bloc 的状态变化
  Bloc.observer = SimpleBlocObserver();
  CounterBloc()
    ..add(CounterIncrementPressed())
    ..close();
}
