import 'package:obour/features/auth/add_supplier/domain/entities/add_supplier_entity.dart';

class AddSupplierModel extends AddSupplierEntity {
  const AddSupplierModel({
    super.status,
    super.data,
  });

  factory AddSupplierModel.fromJson(Map<String, dynamic> json) {
    return AddSupplierModel(
      status: json['status'] as String?,
      data: json['data'] != null
          ? AddSupplierModelData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      if (data != null && data is AddSupplierModelData)
        'data': (data as AddSupplierModelData).toJson(),
    };
  }
}

class AddSupplierModelData extends AddSupplierEntityData {
  const AddSupplierModelData({
    super.supplier,
  });

  factory AddSupplierModelData.fromJson(Map<String, dynamic> json) {
    return AddSupplierModelData(
      supplier: json['supplier'] != null
          ? SupplierModel.fromJson(json['supplier'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (supplier != null && supplier is SupplierModel)
        'supplier': (supplier as SupplierModel).toJson(),
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
      id: json['id'] as int?,
      name: json['name'] as String?,
      supplierType: json['supplier_type'] as String?,
      identificationNumber: json['identification_number'] as String?,
      identificationType: json['identification_type'] as String?,
      jwal: json['jwal'] as String?,
      address: json['address'] as String?,
      regionId: json['region_id'] as int?,
      active: json['active']?.toString(),
      createdAt: json['createdAt'] ?? json['created_at'],
      updatedAt: json['updatedAt'] ?? json['updated_at'],
      region: json['Region'] != null
          ? RegionModel.fromJson(json['Region'])
          : null,
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
      if (region != null && region is RegionModel)
        'Region': (region as RegionModel).toJson(),
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
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

