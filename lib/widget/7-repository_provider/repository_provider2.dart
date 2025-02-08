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
  // 创建一个 repository 实例
  final counterRepository = CounterRepository();

  @override
  Widget build(BuildContext context) {
    // 使用 RepositoryProvider.value 提供已存在的 repository 实例
    return RepositoryProvider.value(
      // 直接使用已创建的 repository 实例
      value: counterRepository,
      child: BlocProvider(
        create: (context) => CounterBloc(
          repository: context.read<CounterRepository>(),
        )..add(CounterInitializePressed()),
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
