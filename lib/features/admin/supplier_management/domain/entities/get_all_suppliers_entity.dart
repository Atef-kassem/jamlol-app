import 'package:equatable/equatable.dart';

class GetAllSuppliersEntity extends Equatable {
  const GetAllSuppliersEntity({
    this.status,
    this.data,
  });

  final String? status;
  final SupplierDataEntity? data;

  @override
  List<Object?> get props => [status, data];
}

class SupplierDataEntity extends Equatable {
  const SupplierDataEntity({
    this.suppliers,
    this.pagination,
  });

  final List<SupplierEntity>? suppliers;
  final PaginationEntity? pagination;

  @override
  List<Object?> get props => [suppliers, pagination];
}

class SupplierEntity extends Equatable {
  const SupplierEntity({
    this.id,
    this.name,
    this.supplierType,
    this.identificationNumber,
    this.identificationType,
    this.jwal,
    this.address,
    this.regionId,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.region,
  });

  final int? id;
  final String? name;
  final String? supplierType;
  final String? identificationNumber;
  final String? identificationType;
  final String? jwal;
  final String? address;
  final int? regionId;
  final String? active;
  final String? createdAt;
  final String? updatedAt;
  final RegionEntity? region;

  @override
  List<Object?> get props => [
    id,
    name,
    supplierType,
    identificationNumber,
    identificationType,
    jwal,
    address,
    regionId,
    active,
    createdAt,
    updatedAt,
    region,
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

class PaginationEntity extends Equatable {
  const PaginationEntity({
    this.currentPage,
    this.totalPages,
    this.totalItems,
    this.itemsPerPage,
  });

  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? itemsPerPage;

  @override
  List<Object?> get props =>
      [currentPage, totalPages, totalItems, itemsPerPage];
}