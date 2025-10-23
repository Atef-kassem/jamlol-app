import 'package:obour/features/auth/add_buyer/domain/entities/add_buyer_entity.dart';

class AddBuyerModel extends AddBuyerEntity {
  const AddBuyerModel({
    super.status,
    super.data,
  });

  factory AddBuyerModel.fromJson(Map<String, dynamic> json) {
    return AddBuyerModel(
      status: json['status'],
      data: json['data'] != null
          ? AddBuyerModelData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      if (data != null) 'data': (data as AddBuyerModelData).toJson(),
    };
  }
}

class AddBuyerModelData extends AddBuyerEntityData {
  const AddBuyerModelData({
    super.client,
  });

  factory AddBuyerModelData.fromJson(Map<String, dynamic> json) {
    return AddBuyerModelData(
      client: json['client'] != null
          ? ClientModel.fromJson(json['client'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (client != null) 'client': (client as ClientModel).toJson(),
    };
  }
}

class ClientModel extends ClientEntity {
  const ClientModel({
    super.id,
    super.name,
    super.jwal,
    super.address,
    super.regionId,
    super.active,
    super.updatedAt,
    super.createdAt,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      name: json['name'],
      jwal: json['jwal'],
      address: json['address'],
      regionId: json['region_id'],
      active: json['active'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'jwal': jwal,
      'address': address,
      'region_id': regionId,
      'active': active,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }
}
