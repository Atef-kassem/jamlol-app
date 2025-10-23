import 'package:equatable/equatable.dart';

class AddSupplierEntity extends Equatable{
 const AddSupplierEntity({
      this.status, 
      this.data,});

  final String? status;
  final AddSupplierEntityData? data;

  @override

  List<Object?> get props => [status,data];

}

class AddSupplierEntityData extends Equatable{
 const AddSupplierEntityData({
      this.supplier,});


  final SupplierEntity ? supplier;

  @override
  // TODO: implement props
  List<Object?> get props => [supplier];


}

class SupplierEntity extends Equatable{
const  SupplierEntity ({
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
      this.region,});

final int? id;
final String? name;
final String? supplierType;
final String? identificationNumber;
final  String? identificationType;
final String? jwal;
final String? address;
final int? regionId;
final String? active;
final  String? createdAt;
final  String? updatedAt;
final RegionEntity? region;

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,supplierType,identificationNumber,identificationNumber,jwal,address,regionId,active,createdAt
  ,updatedAt,region];

}

class RegionEntity extends Equatable{
 const  RegionEntity({
      this.id, 
      this.name,});

  final int? id;
  final  String? name;



  @override
  List<Object?> get props => [id,name];

}