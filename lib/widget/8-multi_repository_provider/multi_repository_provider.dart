import 'package:base/util/console.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_repository.dart';
import 'settings_repository.dart';

class MultiRepositoryProviderWidget extends StatefulWidget {
  const MultiRepositoryProviderWidget({super.key});

  @override
  State<MultiRepositoryProviderWidget> createState() =>
      _MultiRepositoryProviderWidgetState();
}

class _MultiRepositoryProviderWidgetState
    extends State<MultiRepositoryProviderWidget> {
  @override
  Widget build(BuildContext context) {
    // MultiRepositoryProvider 允许我们一次性提供多个 Repository
    return MultiRepositoryProvider(
      providers: [
        // 提供 UserRepository
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(),
        ),
        // 提供 SettingsRepository
        RepositoryProvider<SettingsRepository>(
          create: (context) => SettingsRepository(),
        ),
      ],
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 使用 UserRepository
        ElevatedButton(
          onPressed: () async {
            // 通过 context 获取 UserRepository
            final userRepository = context.read<UserRepository>();
            final username = await userRepository.getUsername();
            if (context.mounted) {
              console.i('用户名: $username');
            }
          },
          child: const Text('获取用户名'),
        ),
        const SizedBox(height: 20),
        // 使用 SettingsRepository
        ElevatedButton(
          onPressed: () async {
            // 通过 context 获取 SettingsRepository
            final settingsRepository = context.read<SettingsRepository>();
            final isDarkMode = await settingsRepository.isDarkMode();
            if (context.mounted) {
              console.i('深色模式: ${isDarkMode ? "开启" : "关闭"}');
            }
          },
          child: const Text('检查主题模式'),
        ),
      ],
    );
  }
}
