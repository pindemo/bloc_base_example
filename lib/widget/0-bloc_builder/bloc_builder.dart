import 'package:base/console.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class BlocBuilderWidget extends StatelessWidget {
  const BlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: _BlocBuilderContent(),
    );
  }
}

class _BlocBuilderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterInitial>(
      // 如果省略了 bloc 参数，则 BlocBuilder 会自动通过 BlocProvider 和当前的 BuildContext 进行查找。
      builder: (context, state) {
        console.w('BlocBuilder rebuild with count: ${state.count}');
        return Column(
          children: [
            Text('计数: ${state.count}'),
            IconButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterAddPressed());
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterRemovePressed());
              },
              icon: Icon(Icons.remove),
            ),
            IconButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterResetPressed());
              },
              icon: Icon(Icons.refresh),
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
  }
}
