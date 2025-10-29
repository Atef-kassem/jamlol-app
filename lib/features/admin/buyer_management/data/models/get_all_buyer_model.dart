import 'package:obour/features/admin/buyer_management/domain/entities/get_all_buyers_entity.dart';

class GetAllBuyerModel extends GetAllBuyersEntity {
  const GetAllBuyerModel({
    super.status,
    super.results,
    super.pagination,
    super.clients,
  });

  factory GetAllBuyerModel.fromJson(Map<String, dynamic> json) {
    return GetAllBuyerModel(
      status: json['status'],
      results: json['results'],
      pagination: json['pagination'] != null
          ? PaginationModel.fromJson(json['pagination'])
          : null,
      clients: (json['clients'] as List<dynamic>?)
          ?.map((v) => ClientModel.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'results': results,
      if (pagination != null)
        'pagination': (pagination as PaginationModel).toJson(),
      if (clients != null)
        'clients': clients?.map((v) => (v as ClientModel).toJson()).toList(),
    };
  }
}

class ClientModel extends GetAllBuyersClientsEntity {
  const ClientModel({
    super.id,
    super.name,
    super.jwal,
    super.address,
    super.regionId,
    super.active,
    super.createdAt,
    super.updatedAt,
    super.region,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      name: json['name'],
      jwal: json['jwal'],
      address: json['address'],
      regionId: json['region_id'],
      active: json['active'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      region: json['Region'] != null
          ? RegionModel.fromJson(json['Region'])
          : null,
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
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      if (region != null) 'Region': (region as RegionModel).toJson(),
    };
  }
}

class RegionModel extends GetAllBuyersRegionEntity {
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

class PaginationModel extends GerAllBuyersPaginationEntity{
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