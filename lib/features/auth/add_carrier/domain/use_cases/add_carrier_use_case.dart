import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_carrier/domain/entities/add_carrier_entity.dart';
import 'package:obour/features/auth/add_carrier/domain/repositories/add_carrier_repo.dart';

class AddCarrierUseCase {
  AddCarrierRepo repo;

  AddCarrierUseCase(this.repo);

  Future<Either<Failures, AddCarrierEntity>> call({
    required String name,
    required String phone,
    required String idNum,
    required String address,
    required String carrierType,
    required String status,
    required int regionId,
  }) {
    return repo.addCarrier(
      name: name,
      phone: phone,
      idNum: idNum,
      address: address,
      carrierType: carrierType,
      status: status,
      regionId: regionId,
    );
  }
}
