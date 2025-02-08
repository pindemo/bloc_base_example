import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';

import 'widget/0-bloc_builder/bloc_builder.dart' as bloc_builder;
import 'widget/0-bloc_builder/bloc_builder2.dart' as bloc_builder2;
import 'widget/1-bloc_selector/bloc_selector.dart';
import 'widget/2-bloc_provider/bloc_provider.dart' as bloc_provider;
import 'widget/2-bloc_provider/bloc_provider2.dart' as bloc_provider2;
import 'widget/3-multi_bloc_provider/multi_bloc_provider.dart';
import 'widget/4-bloc_listener/bloc_listener.dart';
import 'widget/5-multi_bloc_listener/multi_bloc_listener.dart';
import 'widget/6-bloc_consumer/bloc_consumer.dart';
import 'widget/7-repository_provider/repository_provider.dart'
    as repository_provider;
import 'widget/7-repository_provider/repository_provider2.dart'
    as repository_provider2;
import 'widget/8-multi_repository_provider/multi_repository_provider.dart';
import 'widget/9-context_read/context_read.dart';
import 'widget/9-context_select/context_select.dart';
import 'widget/9-context_watch/context_watch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DynamicTabExample(),
    );
  }
}

class DynamicTabExample extends StatefulWidget {
  const DynamicTabExample({super.key});
  @override
  State<DynamicTabExample> createState() => _DynamicTabExampleState();
}

class _DynamicTabExampleState extends State<DynamicTabExample> {
  final List<TabData> tabs = [
    TabData(
      index: 0,
      title: const Tab(child: Text('BlocBuilder')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: '省略 bloc 参数',
              child: bloc_builder.BlocBuilderWidget(),
            ),
            CardWidget(
              title: '添加 bloc 参数',
              child: bloc_builder2.BlocBuilderWidget(),
            ),
          ],
        ),
      ),
    ),
    TabData(
      index: 1,
      title: const Tab(child: Text('BlocSelector')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: 'BlocSelector 示例',
              child: const BlocSelectorWidget(),
            ),
          ],
        ),
      ),
    ),
    TabData(
      index: 2,
      title: const Tab(child: Text('BlocProvider')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: 'BlocProvider 示例',
              child: const bloc_provider.BlocProviderWidget(),
            ),
            CardWidget(
              title: 'BlocProvider.value 示例',
              child: const bloc_provider2.BlocProviderWidget(),
            ),
          ],
        ),
      ),
    ),
    TabData(
      index: 3,
      title: const Tab(child: Text('MultiBlocProvider')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: 'MultiBlocProvider 示例',
              child: const MultiBlocProviderWidget(),
            ),
          ],
        ),
      ),
    ),
    TabData(
      index: 4,
      title: const Tab(child: Text('BlocListener')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: 'BlocListener 示例',
              child: const BlocListenerWidget(),
            ),
          ],
        ),
      ),
    ),
    TabData(
      index: 5,
      title: const Tab(child: Text('MultiBlocListener')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: 'MultiBlocListener 示例',
              child: const MultiBlocListenerWidget(),
            ),
          ],
        ),
      ),
    ),
    TabData(
      index: 6,
      title: const Tab(child: Text('BlocConsumer')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: 'BlocConsumer 示例',
              child: const BlocConsumerWidget(),
            ),
          ],
        ),
      ),
    ),
    TabData(
      index: 7,
      title: const Tab(child: Text('RepositoryProvider')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: 'RepositoryProvider 示例',
              child: const repository_provider.RepositoryProviderWidget(),
            ),
            CardWidget(
              title: 'RepositoryProvider.value 示例',
              child: const repository_provider2.RepositoryProviderWidget(),
            ),
          ],
        ),
      ),
    ),
    TabData(
      index: 8,
      title: const Tab(child: Text('MultiRepositoryProvider')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: 'MultiRepositoryProvider 示例',
              child: const MultiRepositoryProviderWidget(),
            ),
          ],
        ),
      ),
    ),
    TabData(
      index: 9,
      title: const Tab(child: Text('context.read')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: 'context.read 示例',
              child: const ContextReadWidget(),
            ),
          ],
        ),
      ),
    ),
    TabData(
      index: 10,
      title: const Tab(child: Text('context.select')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: 'context.select 示例',
              child: const ContextSelectWidget(),
            ),
          ],
        ),
      ),
    ),
    TabData(
      index: 11,
      title: const Tab(child: Text('context.watch')),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              title: 'context.watch 示例',
              child: const ContextWatchWidget(),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: DynamicTabBarWidget(
              dynamicTabs: tabs,
              isScrollable: true,
              onTabControllerUpdated: (controller) {
                controller.index = 0;
              },
              onTabChanged: (index) {},
              showBackIcon: true,
              showNextIcon: true,
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  String title;
  Widget child;

  CardWidget({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          child,
        ],
      ),
    );
  }
}
