part of 'get_regions_cubit.dart';

@immutable
sealed class GetRegionsState {}

final class GetRegionsInitial extends GetRegionsState {}
class GetRegionsLoading extends GetRegionsState  {}

class GetRegionsSuccess extends GetRegionsState {
  GetRegionsEntity data;
  GetRegionsSuccess(this.data);
}

class GetRegionsFailure extends GetRegionsState {
  Failures failures;
  GetRegionsFailure(this.failures);
}
