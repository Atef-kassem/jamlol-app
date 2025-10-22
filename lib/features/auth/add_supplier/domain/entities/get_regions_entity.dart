import 'package:equatable/equatable.dart';

class GetRegionsEntity extends Equatable{
 const GetRegionsEntity({
      this.status, 
      this.regions,});

 final String? status;
 final List<Regions>? regions;


  @override
  // TODO: implement props
  List<Object?> get props =>[status, regions];

}

class Regions extends Equatable{
  const Regions({
      this.id, 
      this.name, 
      this.cityId, 
      this.createdAt, 
      this.updatedAt,});


 final int? id;
 final String? name;
 final int? cityId;
 final String? createdAt;
 final String? updatedAt;



  @override
  // TODO: implement props
  List<Object?> get props => [id,name,cityId,createdAt,updatedAt];

}