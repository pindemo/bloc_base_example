class SettingsRepository {
  // 模拟获取主题模式
  Future<bool> isDarkMode() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
} 