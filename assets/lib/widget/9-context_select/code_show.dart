import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';

class ContextSelectWidget extends StatefulWidget {
  const ContextSelectWidget({super.key});

  @override
  State<ContextSelectWidget> createState() => _ContextSelectWidgetState();
}

class _ContextSelectWidgetState extends State<ContextSelectWidget> {
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
    // 这里不使用 context.watch，因为我们不需要监听整个状态
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 使用 CountDisplay 组件显示计数
        const CountDisplay(),
        const SizedBox(height: 20),
        // 使用 CounterButtons 组件显示按钮
        const CounterButtons(),
        const SizedBox(height: 20),
        // 使用 RangeDisplay 组件显示范围
        const RangeDisplay(),
      ],
    );
  }
}

/// 只显示计数的组件
class CountDisplay extends StatelessWidget {
  const CountDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 context.select 只选择并监听 count 字段
    // 当其他字段（如min、max）变化时，此组件不会重建
    final count = context.select<CounterBloc, int>(
      (bloc) => bloc.state.count,
    );

    return Text(
      '当前计数: $count',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

/// 显示按钮的组件
class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CounterBloc>().add(CounterRemovePressed());
      },
      child: const Icon(Icons.remove),
    );
  }
}

/// 显示范围的组件
class RangeDisplay extends StatelessWidget {
  const RangeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 context.select 只选择并监听 min 和 max 字段
    // 当 count 变化时，此组件不会重建
    final min = context.select<CounterBloc, int>((bloc) => bloc.state.min);
    final max = context.select<CounterBloc, int>((bloc) => bloc.state.max);

    return Text(
      '范围: $min - $max',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
