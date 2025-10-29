part of 'get_suppliers_cubit.dart';

@immutable
sealed class GetSuppliersState {}

final class GetSuppliersInitial extends GetSuppliersState {}
class GetAllSuppliersLoading extends GetSuppliersState{}

class GetAllSuppliersSuccess extends GetSuppliersState{
  GetAllSuppliersEntity data;
  GetAllSuppliersSuccess(this.data);
}

class GetAllSuppliersFailure extends GetSuppliersState{
  Failures failures;
  GetAllSuppliersFailure(this.failures);
}