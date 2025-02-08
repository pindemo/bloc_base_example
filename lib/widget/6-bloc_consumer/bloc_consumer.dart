import 'package:base/util/console.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class BlocConsumerWidget extends StatefulWidget {
  const BlocConsumerWidget({super.key});

  @override
  State<BlocConsumerWidget> createState() => _BlocConsumerWidgetState();
}

class _BlocConsumerWidgetState extends State<BlocConsumerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 使用 BlocConsumer 同时处理状态构建和监听
                // blocConsumer 类似于嵌套的 BlocListener 和 BlocBuilder
                BlocConsumer<CounterBloc, CounterInitial>(
                  // listener 用于处理副作用，比如显示提示信息
                  listener: (context, state) {
                    if (state.count >= state.max) {
                      console.e('计数已达到最大值：${state.max}！');
                    }
                    if (state.count <= state.min) {
                      console.w('计数已达到最小值：${state.min}！');
                    }
                  },
                  // builder 用于构建UI
                  builder: (context, state) {
                    return Text(
                      '当前计数: ${state.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                  // 可选参数 listenWhen 和 buildWhen 可以用来更精细地控制 listener 和 builder 何时被调用。
                  // listenWhen 和 buildWhen 将在每个 bloc 的 state 更改时被调用。
                  // 它们都接受先前的 state 和当前的 state，且必须返回一个布尔值，用于确定是否调用 builder 和/或 listener 函数。
                  // 当 BlocConsumer 初始化时，先前的 state 将初始化为 bloc 的 state。由于 listenWhen 和 buildWhen 是可选的，因此不实现它们时，默认为 true。
                  buildWhen: (previous, current) {
                    return true;
                  },
                  listenWhen: (previous, current) {
                    return true;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(CounterRemovePressed());
                      },
                      child: const Text('-'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(CounterAddPressed());
                      },
                      child: const Text('+'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterResetPressed());
                  },
                  child: const Text('重置'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
