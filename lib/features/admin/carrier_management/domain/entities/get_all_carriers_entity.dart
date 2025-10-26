import 'package:equatable/equatable.dart';

class GetAllCarriersEntity extends Equatable {
  const GetAllCarriersEntity({
    this.status,
    this.naqleen,
  });

  final String? status;
  final List<NaqleenEntity>? naqleen;

  @override
  List<Object?> get props => [status, naqleen];
}

class NaqleenEntity extends Equatable {
  const NaqleenEntity({
    this.id,
    this.name,
    this.naqlenType,
    this.identificationNumber,
    this.identificationType,
    this.jwal,
    this.address,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.regions,
  });

  final int? id;
  final String? name;
  final String? naqlenType;
  final String? identificationNumber;
  final String? identificationType;
  final String? jwal;
  final String? address;
  final String? active;
  final String? createdAt;
  final String? updatedAt;
  final List<RegionEntity>? regions;

  @override
  List<Object?> get props => [
    id,
    name,
    naqlenType,
    identificationNumber,
    identificationType,
    jwal,
    address,
    active,
    createdAt,
    updatedAt,
    regions,
  ];
}

class RegionEntity extends Equatable {
  const RegionEntity({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}