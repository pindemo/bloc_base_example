class CounterRepository {
  // 模拟从远程服务器获取初始计数
  Future<int> fetchInitialCount() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 1));
    return 5; // 假设服务器返回的初始值为5
  }

  // 模拟保存计数到远程服务器
  Future<void> saveCount(int count) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 500));
    // 实际应用中，这里会有真实的API调用
    print('保存计数到服务器: $count');
  }
} 