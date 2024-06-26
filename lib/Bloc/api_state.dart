part of 'api_bloc.dart';

@immutable
sealed class ApiState {}

final class ApiInitial extends ApiState {}
class AnimeblocLoading extends ApiState {}
class AnimeblocLoaded extends ApiState {}
class AnimeblocError extends ApiState{}