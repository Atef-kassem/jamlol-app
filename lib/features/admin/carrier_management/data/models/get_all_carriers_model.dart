import 'package:obour/features/admin/carrier_management/domain/entities/get_all_carriers_entity.dart';

class GetAllCarriersModel extends GetAllCarriersEntity {
  const GetAllCarriersModel({
    super.status,
    super.naqleen,
  });

  factory GetAllCarriersModel.fromJson(Map<String, dynamic> json) {
    return GetAllCarriersModel(
      status: json['status'],
      naqleen: (json['naqleen'] as List<dynamic>?)
          ?.map((v) => NaqleenModel.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      if (naqleen != null)
        'naqleen': naqleen?.map((v) => (v as NaqleenModel).toJson()).toList(),
    };
  }
}

class NaqleenModel extends NaqleenEntity {
  const NaqleenModel({
    super.id,
    super.name,
    super.naqlenType,
    super.identificationNumber,
    super.identificationType,
    super.jwal,
    super.address,
    super.active,
    super.createdAt,
    super.updatedAt,
    super.regions,
  });

  factory NaqleenModel.fromJson(Map<String, dynamic> json) {
    return NaqleenModel(
      id: json['id'],
      name: json['name'],
      naqlenType: json['naqlen_type'],
      identificationNumber: json['identification_number'],
      identificationType: json['identification_type'],
      jwal: json['jwal'],
      address: json['address'],
      active: json['active'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      regions: (json['Regions'] as List<dynamic>?)
          ?.map((v) => RegionModel.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'naqlen_type': naqlenType,
      'identification_number': identificationNumber,
      'identification_type': identificationType,
      'jwal': jwal,
      'address': address,
      'active': active,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      if (regions != null)
        'Regions': regions?.map((v) => (v as RegionModel).toJson()).toList(),
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