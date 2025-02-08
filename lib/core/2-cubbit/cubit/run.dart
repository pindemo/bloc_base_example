import 'package:base/console.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';
import 'simple_bloc_observer.dart';

fn() {
  // test();
  test1();
  // test2();
}

test() {
  final cubit = CounterCubit();
  console.w(cubit.state); // 0
  cubit.increment();
  console.w(cubit.state); // 1
  cubit.close();
}

void test1() {
  // 使用 SimpleBlocObserver
  Bloc.observer = SimpleBlocObserver();
  CounterCubit()
    //调用 increment 函数来触发状态变化
    ..increment()
    //调用 close 来关闭内部状态流
    ..close();
}

Future<void> test2() async {
  final cubit = CounterCubit();
  //Cubit 公开了一个 Stream 可以用于接收实时的状态更新：
  final subscription = cubit.stream.listen(print); // 1
  cubit.increment();
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await cubit.close();
}
