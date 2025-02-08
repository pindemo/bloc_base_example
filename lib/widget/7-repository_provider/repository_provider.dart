import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'counter_repository.dart';

class RepositoryProviderWidget extends StatefulWidget {
  const RepositoryProviderWidget({super.key});

  @override
  State<RepositoryProviderWidget> createState() =>
      _RepositoryProviderWidgetState();
}

class _RepositoryProviderWidgetState extends State<RepositoryProviderWidget> {
  @override
  Widget build(BuildContext context) {
    // RepositoryProvider 用于提供repository实例
    return RepositoryProvider(
      // 创建repository实例
      create: (context) => CounterRepository(),
      child: BlocProvider(
        // 使用context.read<CounterRepository>()来获取repository实例
        create: (context) => CounterBloc(
          // repository: context.read<CounterRepository>(),
          // 等价
          repository: RepositoryProvider.of<CounterRepository>(context),
        )..add(CounterInitializePressed()), // 初始化时加载数据
        child: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<CounterBloc>()
                              .add(CounterRemovePressed());
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
      ),
    );
  }
}
