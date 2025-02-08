part of 'counter_bloc.dart';

/// 计数器事件的基类
/// sealed 关键字确保所有可能的事件类型都在同一个文件中定义
@immutable
sealed class CounterEvent {}

/// 表示增加计数的事件
final class CounterIncrementPressed extends CounterEvent {}