part of 'get_buyers_cubit.dart';

@immutable
sealed class GetBuyersState {}

final class GetBuyersInitial extends GetBuyersState {}
class GetAllBuyersLoading extends GetBuyersState{}

class GetAllBuyersSuccess extends GetBuyersState{
  GetAllBuyersEntity data;
  GetAllBuyersSuccess(this.data);
}

class GetAllBuyersFailure extends GetBuyersState{
  Failures failures;
  GetAllBuyersFailure(this.failures);
}

