import 'package:base/util/console.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class BlocSelectorWidget extends StatefulWidget {
  const BlocSelectorWidget({super.key});

  @override
  State<BlocSelectorWidget> createState() => _BlocSelectorWidgetState();
}

class _BlocSelectorWidgetState extends State<BlocSelectorWidget> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 使用 BlocSelector 只监听计数值是否为偶数
        // 当且仅当奇偶性发生变化时才会重建
        BlocSelector<CounterBloc, CounterInitial, bool>(
          bloc: _counterBloc,
          selector: (state) {
            // 从状态中选择一个布尔值：是否为偶数
            return state.count % 2 == 0;
          },
          builder: (context, isEven) {
            console.i('重新构建1');
            return Text(
              isEven ? '当前是偶数' : '当前是奇数',
            );
          },
        ),
        const SizedBox(height: 20),
        // 使用 BlocSelector 监听完整计数值
        // 当计数值发生变化时才会重建
        BlocSelector<CounterBloc, CounterInitial, int>(
          bloc: _counterBloc,
          selector: (state) => state.count,
          builder: (context, count) {
            console.i('重新构建2');
            return Text(
              '计数: $count',
            );
          },
        ),
        IconButton(
          onPressed: () => _counterBloc.add(CounterAddPressed()),
          icon: const Icon(Icons.add),
        ),
        IconButton(
          onPressed: () => _counterBloc.add(CounterRemovePressed()),
          icon: const Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () => _counterBloc.add(CounterResetPressed()),
          icon: const Icon(Icons.refresh),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }
}
