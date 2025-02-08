import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

/// 传递 bloc 和 BlocBuilder 基本一样

///  不传递 bloc
class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      // 使用 Builder 原因是 context 会出现问题
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 使用 BlocSelector 只监听计数值是否为偶数
              // 当且仅当奇偶性发生变化时才会重建
              BlocSelector<CounterBloc, CounterInitial, bool>(
                selector: (state) {
                  // 从状态中选择一个布尔值：是否为偶数
                  return state.count % 2 == 0;
                },
                builder: (context, isEven) {
                  return Text(
                    isEven ? '当前是偶数' : '当前是奇数',
                  );
                },
              ),
              const SizedBox(height: 20),
              // 使用 BlocSelector 监听完整计数值
              // 当计数值发生变化时才会重建
              BlocSelector<CounterBloc, CounterInitial, int>(
                selector: (state) => state.count,
                builder: (context, count) {
                  return Text(
                    '计数: $count',
                  );
                },
              ),
              IconButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterAddPressed()),
                icon: const Icon(Icons.add),
              ),
            ],
          );
        },
      ),
    );
  }
}
