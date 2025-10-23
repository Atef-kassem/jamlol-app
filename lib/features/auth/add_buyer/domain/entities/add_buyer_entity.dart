import 'package:equatable/equatable.dart';

class AddBuyerEntity extends Equatable{
  const AddBuyerEntity({
      this.status, 
      this.data,});


  final String? status;
  final AddBuyerEntityData? data;

  @override
  // TODO: implement props
  List<Object?> get props => [status,data];

}

class AddBuyerEntityData extends Equatable{
 const AddBuyerEntityData({
      this.client,});

 final ClientEntity? client;

  @override
  // TODO: implement props
  List<Object?> get props => [client];



}

class ClientEntity extends Equatable{
 const ClientEntity({
      this.id, 
      this.name, 
      this.jwal, 
      this.address, 
      this.regionId, 
      this.active, 
      this.updatedAt, 
      this.createdAt,});


 final int? id;
 final String? name;
 final String? jwal;
 final String? address;
 final int? regionId;
 final String? active;
 final String? updatedAt;
 final String? createdAt;

  @override
  // TODO: implement props
  List<Object?> get props =>[id,name,address,regionId,active,createdAt,updatedAt];

}