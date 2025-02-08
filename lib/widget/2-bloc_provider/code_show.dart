import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // 默认情况下，BlocProvider 将延迟创建 bloc 实例，这意味着当通过 BlocProvider.of<BlocA>(context) 查找该 bloc 时，create 方法才会被执行。
      // 为了覆盖这种行为并强制立即运行 create 方法，可以将 lazy 设置为 false。
      lazy: true,
      create: (context) => CounterBloc(),
      // 保证context正确性
      child: _Example1Content(),
    );
  }
}

class _Example1Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CounterBloc, CounterInitial>(
          builder: (context, state) {
            return Text(
              '计数: ${state.count}',
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            // context.read<CounterBloc>().add(CounterRemovePressed());
            // 等价
            BlocProvider.of<CounterBloc>(context).add(CounterRemovePressed());
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _ParentWidget(),
    );
  }
}

//  父级 Widget
class _ParentWidget extends StatelessWidget {
  const _ParentWidget();

  @override
  Widget build(BuildContext context) {
    // 获取上层提供的 CounterBloc 实例
    final counterBloc = context.read<CounterBloc>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 使用 BlocProvider.value 将已存在的 bloc 传递给子组件
        BlocProvider.value(
          value: counterBloc,
          child: const _ChildCounter(),
        ),
        const SizedBox(height: 20),
        // 使用相同的 bloc 实例
        BlocProvider.value(
          value: counterBloc,
          child: const _ChildButtons(),
        ),
      ],
    );
  }
}

// 拆分出显示计数的组件
class _ChildCounter extends StatelessWidget {
  const _ChildCounter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterInitial>(
      builder: (context, state) {
        return Text(
          '当前计数: ${state.count}',
        );
      },
    );
  }
}

// 拆分出按钮组件
class _ChildButtons extends StatelessWidget {
  const _ChildButtons();

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
