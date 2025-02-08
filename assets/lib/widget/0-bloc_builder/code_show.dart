import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

/// 传递 bloc
class Example1 extends StatelessWidget {
  final _counterBloc = CounterBloc();

  Example1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterInitial>(
      bloc: _counterBloc,
      builder: (context, state) {
        return Column(
          children: [
            Text('计数: ${state.count}'),
            IconButton(
              onPressed: () {
                _counterBloc.add(CounterAddPressed());
              },
              icon: Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }
}

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
          return BlocBuilder<CounterBloc, CounterInitial>(
            // 如果省略了 bloc 参数，则 BlocBuilder 会自动通过 BlocProvider 和当前的 BuildContext 进行查找。
            builder: (context, state) {
              return Column(
                children: [
                  Text('计数: ${state.count}'),
                  IconButton(
                    onPressed: () {
                      // context.read<CounterBloc>().add(CounterAddPressed());
                      // 等价于
                      BlocProvider.of<CounterBloc>(context)
                          .add(CounterAddPressed());
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              );
            },
            // 接受前一个 bloc 状态和当前 bloc 状态，并返回一个布尔值
            // buildWhen 返回 true，则 builder 函数将被调用并使用当前 state 进行widget重建。
            // 如果 buildWhen 返回 false，则 builder 将不会被使用当前 state 调用，且不会进行重建。
            buildWhen: (previous, current) {
              return previous.count != current.count;
            },
          );
        },
      ),
    );
  }
}
