import 'package:base/util/console.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class BlocBuilderWidget extends StatelessWidget {
  const BlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _BlocBuilderContent();
  }
}

class _BlocBuilderContent extends StatelessWidget {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterInitial>(
      bloc: _counterBloc,
      builder: (context, state) {
        console.w('BlocBuilder rebuild with count: ${state.count}');
        return Column(
          children: [
            Text('计数: ${state.count}'),
            IconButton(
              onPressed: () {
                _counterBloc.add(CounterAddPressed());
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                _counterBloc.add(CounterRemovePressed());
              },
              icon: Icon(Icons.remove),
            ),
            IconButton(
              onPressed: () {
                _counterBloc.add(CounterResetPressed());
              },
              icon: Icon(Icons.refresh),
            ),
          ],
        );
      },
    );
  }
}
