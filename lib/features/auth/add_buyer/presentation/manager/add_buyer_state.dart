part of 'add_buyer_cubit.dart';

@immutable
sealed class AddBuyerState {}

final class AddBuyerInitial extends AddBuyerState {}

class AddBuyerLoading extends AddBuyerState {}

class AddBuyerSuccess extends AddBuyerState{
  AddBuyerEntity data;
  AddBuyerSuccess(this.data);
}

class AddBuyerFailure extends AddBuyerState{
  Failures failures;
  AddBuyerFailure(this.failures);
}

