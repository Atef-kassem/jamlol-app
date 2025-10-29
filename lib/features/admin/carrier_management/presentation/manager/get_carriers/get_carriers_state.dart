part of 'get_carriers_cubit.dart';

@immutable
sealed class GetCarriersState {}

final class GetCarriersInitial extends GetCarriersState {}
class GetAllCarriersLoading extends GetCarriersState{}

class GetAllCarriersSuccess extends GetCarriersState{
  GetAllCarriersEntity data;
  GetAllCarriersSuccess(this.data);
}

class GetAllCarriersFailure extends GetCarriersState{
  Failures failures;
  GetAllCarriersFailure(this.failures);
}