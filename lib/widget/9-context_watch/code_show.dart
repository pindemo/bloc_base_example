import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';

class ContextWatchWidget extends StatefulWidget {
  const ContextWatchWidget({super.key});

  @override
  State<ContextWatchWidget> createState() => _ContextWatchWidgetState();
}

class _ContextWatchWidgetState extends State<ContextWatchWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _CounterView(),
    );
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context) {
    // 使用 context.watch 监听 CounterBloc 的状态变化
    // 当 CounterBloc 的状态发生变化时，build 方法会被重新调用
    // context.watch<T>() 提供最接近祖先类型为 T 的实例，并且同时还会监听该实例的变化。
    //它的功能等同于 BlocProvider.of<T>(context, listen: true)。
    final state = context.watch<CounterBloc>().state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '当前计数: ${state.count}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // 使用 context.read 发送事件，因为我们不需要监听变化
            context.read<CounterBloc>().add(CounterRemovePressed());
          },
          child: const Icon(Icons.remove),
        ),
        const SizedBox(height: 20),
        Text(
          '范围: ${state.min} - ${state.max}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
