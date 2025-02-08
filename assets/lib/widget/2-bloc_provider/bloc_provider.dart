import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';

class BlocProviderWidget extends StatelessWidget {
  const BlocProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // 默认情况下，BlocProvider 将延迟创建 bloc 实例，这意味着当通过 BlocProvider.of<BlocA>(context) 查找该 bloc 时，create 方法才会被执行。
      // 为了覆盖这种行为并强制立即运行 create 方法，可以将 lazy 设置为 false。
      lazy: true,
      create: (context) => CounterBloc(),
      // 保证context正确性
      child: _BlocProviderContent(),
    );
  }
}

class _BlocProviderContent extends StatelessWidget {
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
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // context.read<CounterBloc>().add(CounterRemovePressed());
                // 等价
                BlocProvider.of<CounterBloc>(context)
                    .add(CounterRemovePressed());
              },
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                // context.read<CounterBloc>().add(CounterResetPressed());
                BlocProvider.of<CounterBloc>(context)
                    .add(CounterResetPressed());
              },
              child: const Icon(Icons.refresh),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                // context.read<CounterBloc>().add(CounterAddPressed());
                BlocProvider.of<CounterBloc>(context).add(CounterAddPressed());
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
