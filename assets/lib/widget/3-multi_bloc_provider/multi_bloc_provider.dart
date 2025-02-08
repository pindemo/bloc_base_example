import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'bloc/theme_bloc.dart';

class MultiBlocProviderWidget extends StatefulWidget {
  const MultiBlocProviderWidget({super.key});

  @override
  State<MultiBlocProviderWidget> createState() =>
      _MultiBlocProviderWidgetState();
}

class _MultiBlocProviderWidgetState extends State<MultiBlocProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: Builder(
        builder: (context) {
          final isDark = context.watch<ThemeBloc>().state;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isDark ? 'Dark Theme' : 'Light Theme'),
                ElevatedButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(ThemeEvent.toggle);
                  },
                  child: const Text('切换主题'),
                ),
                SizedBox(height: 20),
                const Text('计数：'),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    if (state is CounterInitial) {
                      return Text(
                        '${state.count}',
                        style: const TextStyle(fontSize: 24),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(CounterAddPressed());
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(CounterRemovePressed());
                      },
                      icon: Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(CounterResetPressed());
                      },
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
