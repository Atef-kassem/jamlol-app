import 'package:obour/features/admin/supplier_management/domain/entities/get_all_suppliers_entity.dart';

class GetAllSuppliersModel extends GetAllSuppliersEntity {
  const GetAllSuppliersModel({
    super.status,
    super.data,
  });

  factory GetAllSuppliersModel.fromJson(Map<String, dynamic> json) {
    return GetAllSuppliersModel(
      status: json['status'],
      data: json['data'] != null
          ? SupplierDataModel.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      if (data != null) 'data': (data as SupplierDataModel).toJson(),
    };
  }
}

class SupplierDataModel extends SupplierDataEntity {
  const SupplierDataModel({
    super.suppliers,
    super.pagination,
  });

  factory SupplierDataModel.fromJson(Map<String, dynamic> json) {
    return SupplierDataModel(
      suppliers: (json['suppliers'] as List<dynamic>?)
          ?.map((v) => SupplierModel.fromJson(v))
          .toList(),
      pagination: json['pagination'] != null
          ? PaginationModel.fromJson(json['pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (suppliers != null)
        'suppliers': suppliers?.map((v) => (v as SupplierModel).toJson()).toList(),
      if (pagination != null)
        'pagination': (pagination as PaginationModel).toJson(),
    };
  }
}

class SupplierModel extends SupplierEntity {
  const SupplierModel({
    super.id,
    super.name,
    super.supplierType,
    super.identificationNumber,
    super.identificationType,
    super.jwal,
    super.address,
    super.regionId,
    super.active,
    super.createdAt,
    super.updatedAt,
    super.region,
  });

  factory SupplierModel.fromJson(Map<String, dynamic> json) {
    return SupplierModel(
      id: json['id'],
      name: json['name'],
      supplierType: json['supplier_type'],
      identificationNumber: json['identification_number'],
      identificationType: json['identification_type'],
      jwal: json['jwal'],
      address: json['address'],
      regionId: json['region_id'],
      active: json['active'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      region:
      json['Region'] != null ? RegionModel.fromJson(json['Region']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'supplier_type': supplierType,
      'identification_number': identificationNumber,
      'identification_type': identificationType,
      'jwal': jwal,
      'address': address,
      'region_id': regionId,
      'active': active,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      if (region != null) 'Region': (region as RegionModel).toJson(),
    };
  }
}

class RegionModel extends RegionEntity {
  const RegionModel({
    super.id,
    super.name,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}

class PaginationModel extends PaginationEntity {
  const PaginationModel({
    super.currentPage,
    super.totalPages,
    super.totalItems,
    super.itemsPerPage,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      totalItems: json['totalItems'],
      itemsPerPage: json['itemsPerPage'],
    );
  }

  Map<String, dynamic> toJson() => {
    'currentPage': currentPage,
    'totalPages': totalPages,
    'totalItems': totalItems,
    'itemsPerPage': itemsPerPage,
  };
}