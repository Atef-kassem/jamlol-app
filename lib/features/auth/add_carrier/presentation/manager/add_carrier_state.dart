part of 'add_carrier_cubit.dart';

@immutable
sealed class AddCarrierState {}

final class AddCarrierInitial extends AddCarrierState {}

class AddCarrierLoading extends AddCarrierState {}

class AddCarrierSuccess extends AddCarrierState{
  AddCarrierEntity data;
  AddCarrierSuccess(this.data);
}

class AddCarrierFailure extends AddCarrierState{
  Failures failures;
  AddCarrierFailure(this.failures);
}
