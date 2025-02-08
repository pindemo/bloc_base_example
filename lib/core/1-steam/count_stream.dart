import 'package:base/util/console.dart';

void fn() async {
  // 将函数标记为 async* ，可以使用 yield 关键字并返回 Stream 数据。
  Stream<int> countStream(int max) async* {
    for (var i = 0; i < max; i++) {
      yield i;
    }
  }

  Future<int> sumStream(Stream<int> stream) async {
    int sum = 0;
    // 将上述函数标记为 async ，可以使用 await 关键字并返回一个 Future 整数
    await for (int value in stream) {
      sum += value;
    }
    return sum;
  }

  Stream<int> stream = countStream(10);
  int sum = await sumStream(stream);
  console.d(sum); // 45
}
