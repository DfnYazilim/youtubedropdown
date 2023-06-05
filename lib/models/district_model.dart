class DistrictModel {
  DistrictModel({
      this.id, 
      this.name, 
      this.county, 
      this.order, 
      this.isActive, 
      this.createdTime, 
      this.v,});

  DistrictModel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    county = json['county'];
    order = json['order'];
    isActive = json['isActive'];
    createdTime = json['createdTime'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? county;
  num? order;
  bool? isActive;
  String? createdTime;
  num? v;
DistrictModel copyWith({  String? id,
  String? name,
  String? county,
  num? order,
  bool? isActive,
  String? createdTime,
  num? v,
}) => DistrictModel(  id: id ?? this.id,
  name: name ?? this.name,
  county: county ?? this.county,
  order: order ?? this.order,
  isActive: isActive ?? this.isActive,
  createdTime: createdTime ?? this.createdTime,
  v: v ?? this.v,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['county'] = county;
    map['order'] = order;
    map['isActive'] = isActive;
    map['createdTime'] = createdTime;
    map['__v'] = v;
    return map;
  }

}