import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';

class BlocProviderWidget extends StatelessWidget {
  const BlocProviderWidget({super.key});

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<CounterBloc>().add(CounterRemovePressed());
          },
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            context.read<CounterBloc>().add(CounterResetPressed());
          },
          child: const Icon(Icons.refresh),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            context.read<CounterBloc>().add(CounterAddPressed());
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
