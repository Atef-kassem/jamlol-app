import 'package:equatable/equatable.dart';

class GetAllBuyersEntity extends Equatable{
 const GetAllBuyersEntity({
      this.status, 
      this.results, 
      this.pagination, 
      this.clients,});

 final String? status;
 final int? results;
 final GerAllBuyersPaginationEntity? pagination;
 final List<GetAllBuyersClientsEntity>? clients;


  @override
  List<Object?> get props => [status,results,pagination,clients];

}

class GetAllBuyersClientsEntity extends Equatable{
 const GetAllBuyersClientsEntity({
      this.id, 
      this.name, 
      this.jwal, 
      this.address, 
      this.regionId, 
      this.active, 
      this.createdAt, 
      this.updatedAt, 
      this.region,});

 final int? id;
 final String? name;
 final String? jwal;
 final String? address;
 final int? regionId;
 final String? active;
 final String? createdAt;
 final String? updatedAt;
 final  GetAllBuyersRegionEntity? region;

  @override
  List<Object?> get props => [id,name,jwal,address,regionId,active,createdAt,updatedAt,region];


}

class GetAllBuyersRegionEntity extends Equatable{
 const GetAllBuyersRegionEntity({
      this.id, 
      this.name,});

  final int? id;
  final String? name;

  @override
  List<Object?> get props => [id,name];


}

class GerAllBuyersPaginationEntity extends Equatable{
 const GerAllBuyersPaginationEntity({
      this.currentPage, 
      this.totalPages, 
      this.totalItems, 
      this.itemsPerPage,});

 final int? currentPage;
 final int? totalPages;
 final int? totalItems;
 final int? itemsPerPage;


  @override
  List<Object?> get props => [currentPage,totalPages,totalItems,itemsPerPage];

}