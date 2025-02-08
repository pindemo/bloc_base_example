import 'package:base/util/console.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class BlocListenerWidget extends StatefulWidget {
  const BlocListenerWidget({super.key});

  @override
  State<BlocListenerWidget> createState() => _BlocListenerWidgetState();
}

class _BlocListenerWidgetState extends State<BlocListenerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(
        builder: (context) {
          return BlocListener<CounterBloc, CounterInitial>(
            // 无法访问的 bloc 的情况时，才指定 bloc。
            // bloc: CounterBloc(),
            // 监听器，当状态变化时触发
            listener: (context, state) {
              if (state.count >= state.max) {
                console.e('已达到最大值！');
              }
              if (state.count <= state.min) {
                console.w('已达到最小值！');
              }
            },
            child: Center(
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
            ),
            // stenWhen 接受先前的 bloc 状态和当前的 bloc 状态，并返回一个布尔值。
            //如果 listenWhen 返回 true，则会用 state 调用 listener。如果 listenWhen 返回 false，则不会用 state 调用 listener。
            listenWhen: (previous, current) {
              return previous.count != current.count;
            },
          );
        },
      ),
    );
  }
}
