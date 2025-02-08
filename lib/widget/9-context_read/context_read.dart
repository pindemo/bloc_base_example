import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';

class ContextReadWidget extends StatefulWidget {
  const ContextReadWidget({super.key});

  @override
  State<ContextReadWidget> createState() => _ContextReadWidgetState();
}

class _ContextReadWidgetState extends State<ContextReadWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(
        builder: (context) {
          return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 使用 BlocBuilder 监听状态变化并重建 UI
                  BlocBuilder<CounterBloc, CounterInitial>(
                    builder: (context, state) {
                      return Text(
                        '当前计数: ${state.count}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 使用 context.read 在按钮回调中获取 bloc 实例
                      ElevatedButton(
                        onPressed: () {
                          // context.read 不会触发重建，适合在事件回调中使用
                          context.read<CounterBloc>().add(CounterRemovePressed());
                        },
                        child: const Text('-'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          // 等同于 BlocProvider.of<CounterBloc>(context).add(CounterAddPressed())
                          context.read<CounterBloc>().add(CounterAddPressed());
                        },
                        child: const Text('+'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // 在事件处理中使用 context.read 获取 bloc
                      context.read<CounterBloc>().add(CounterResetPressed());
                    },
                    child: const Text('重置'),
                  ),
                ],
              );
        },
      ),
    );
  }
} 