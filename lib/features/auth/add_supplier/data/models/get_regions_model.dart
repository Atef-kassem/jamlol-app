import 'package:obour/features/auth/add_supplier/domain/entities/get_regions_entity.dart';

class GetRegionsModel extends GetRegionsEntity {
  const GetRegionsModel({
    super.status,
    super.regions,
  });

  factory GetRegionsModel.fromJson(Map<String, dynamic> json) {
    return GetRegionsModel(
      status: json['status'] as String?,
      regions: (json['regions'] as List<dynamic>?)
          ?.map((v) => RegionsModel.fromJson(v as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      if (regions != null)
        'regions': regions!.map((v) {
          if (v is RegionsModel) return v.toJson();
          return {
            'id': v.id,
            'name': v.name,
            'city_id': v.cityId,
            'createdAt': v.createdAt,
            'updatedAt': v.updatedAt,
          };
        }).toList(),
    };
  }
}

class RegionsModel extends Regions {
  const RegionsModel({
    super.id,
    super.name,
    super.cityId,
    super.createdAt,
    super.updatedAt,
  });

  factory RegionsModel.fromJson(Map<String, dynamic> json) {
    return RegionsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      cityId: json['city_id'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city_id': cityId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}