import 'package:equatable/equatable.dart';

class AddCarrierEntity extends Equatable{
 const AddCarrierEntity({
      this.status, 
      this.naqel,});


final String? status;
 final NaqelEntity? naqel;

  @override
  // TODO: implement props
  List<Object?> get props => [status,naqel];


}

class NaqelEntity extends Equatable{
 const NaqelEntity({
      this.id, 
      this.name, 
      this.naqlenType, 
      this.identificationNumber, 
      this.identificationType, 
      this.jwal, 
      this.address, 
      this.active, 
      this.createdAt, 
      this.updatedAt, 
      this.regions,});

 final int? id;
 final String? name;
 final String? naqlenType;
 final String? identificationNumber;
 final String? identificationType;
 final String? jwal;
 final String? address;
 final String? active;
 final String? createdAt;
 final String? updatedAt;
 final List<RegionsEntity>? regions;

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,naqlenType,identificationNumber,identificationType,jwal,address,active,createdAt,updatedAt,regions];


}

class RegionsEntity extends Equatable{
 const RegionsEntity({
      this.id, 
      this.name,});

  final int? id;
  final String? name;

  @override
  // TODO: implement props
  List<Object?> get props => [id,name];

}