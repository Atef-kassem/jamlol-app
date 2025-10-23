import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_buyer/domain/entities/add_buyer_entity.dart';
import 'package:obour/features/auth/add_buyer/domain/repositories/add_buyer_repo.dart';

class AddBuyerUseCase {
  AddBuyerRepo repo;

  AddBuyerUseCase(this.repo);

  Future<Either<Failures, AddBuyerEntity>> call({
    required String name,
    required String phone,
    required String address,
    required String status,
    required int regionId,
  }) {
    return repo.addBuyer(
      name: name,
      phone: phone,
      address: address,
      status: status,
      regionId: regionId,
    );
  }
}
