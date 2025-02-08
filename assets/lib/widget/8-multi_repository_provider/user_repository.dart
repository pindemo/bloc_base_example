class UserRepository {
  // 模拟获取用户名
  Future<String> getUsername() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 1));
    return "张三";
  }
} 