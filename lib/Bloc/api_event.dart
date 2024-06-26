part of 'api_bloc.dart';

@immutable
sealed class ApiEvent {}
class  FetchanimeEvent extends ApiEvent{}