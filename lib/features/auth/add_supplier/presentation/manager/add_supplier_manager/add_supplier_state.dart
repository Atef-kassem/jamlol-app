part of 'add_supplier_cubit.dart';

@immutable
sealed class AddSupplierState {}

final class AddSupplierInitial extends AddSupplierState {}

class AddSupplierLoading extends AddSupplierState {}

class AddSupplierSuccess extends AddSupplierState{
  AddSupplierEntity data;
  AddSupplierSuccess(this.data);
}

class AddSupplierFailure extends AddSupplierState{
  Failures failures;
  AddSupplierFailure(this.failures);
}
