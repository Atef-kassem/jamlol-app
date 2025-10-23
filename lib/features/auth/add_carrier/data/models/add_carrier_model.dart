import 'package:obour/features/auth/add_carrier/domain/entities/add_carrier_entity.dart';

class AddCarrierModel extends AddCarrierEntity {
  const AddCarrierModel({
    super.status,
    super.naqel,
  });

  factory AddCarrierModel.fromJson(Map<String, dynamic> json) {
    return AddCarrierModel(
      status: json['status'] as String?,
      naqel: json['naqel'] != null
          ? NaqelModel.fromJson(json['naqel'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      if (naqel != null && naqel is NaqelModel)
        'naqel': (naqel as NaqelModel).toJson(),
    };
  }
}

class NaqelModel extends NaqelEntity {
  const NaqelModel({
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

  factory NaqelModel.fromJson(Map<String, dynamic> json) {
    return NaqelModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      naqlenType: json['naqlen_type'] as String?,
      identificationNumber: json['identification_number'] as String?,
      identificationType: json['identification_type'] as String?,
      jwal: json['jwal'] as String?,
      address: json['address'] as String?,
      active: json['active']?.toString(),
      createdAt: json['createdAt'] ?? json['created_at'],
      updatedAt: json['updatedAt'] ?? json['updated_at'],
      regions: (json['Regions'] as List?)
          ?.map((v) => RegionsModel.fromJson(v))
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
        'Regions': regions!
            .map((region) =>
        region is RegionsModel ? region.toJson() : null)
            .whereType<Map<String, dynamic>>()
            .toList(),
    };
  }
}

class RegionsModel extends RegionsEntity {
  const RegionsModel({
    super.id,
    super.name,
  });

  factory RegionsModel.fromJson(Map<String, dynamic> json) {
    return RegionsModel(
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
