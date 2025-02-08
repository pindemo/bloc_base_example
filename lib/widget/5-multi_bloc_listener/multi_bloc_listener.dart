import 'package:base/console.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/theme_bloc.dart';

class MultiBlocListenerWidget extends StatefulWidget {
  const MultiBlocListenerWidget({super.key});

  @override
  State<MultiBlocListenerWidget> createState() => _MultiBlocListenerWidgetState();
}

class _MultiBlocListenerWidgetState extends State<MultiBlocListenerWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocListener(
            listeners: [
              // 监听计数器状态
              BlocListener<CounterBloc, CounterInitial>(
                listener: (context, state) {
                  if (state.count >= state.max) {
                    console.e('计数已达到最大值：${state.max}！');
                  }
                  if (state.count <= state.min) {
                    console.w('计数已达到最小值：${state.min}！');
                  }
                },
              ),
              // 监听主题状态
              BlocListener<ThemeBloc, bool>(
                listener: (context, isDark) {
                  console.i('主题已切换为：${isDark ? "暗色" : "亮色"}');
                },
              ),
            ],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 显示主题状态
                  BlocBuilder<ThemeBloc, bool>(
                    builder: (context, isDark) {
                      return Text(
                        isDark ? '当前是暗色主题' : '当前是亮色主题',
                        style: Theme.of(context).textTheme.titleLarge,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ThemeBloc>().add(ThemeEvent.toggle);
                    },
                    child: const Text('切换主题'),
                  ),
                  const SizedBox(height: 40),
                  // 显示计数器状态
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
            ),
          );
        },
      ),
    );
  }
} 