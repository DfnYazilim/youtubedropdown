class CountyModel {
  CountyModel({
      this.id, 
      this.name, 
      this.order, 
      this.isActive, 
      this.createdTime, 
      this.v,});

  CountyModel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    order = json['order'];
    isActive = json['isActive'];
    createdTime = json['createdTime'];
    v = json['__v'];
  }
  String? id;
  String? name;
  num? order;
  bool? isActive;
  String? createdTime;
  num? v;
CountyModel copyWith({  String? id,
  String? name,
  num? order,
  bool? isActive,
  String? createdTime,
  num? v,
}) => CountyModel(  id: id ?? this.id,
  name: name ?? this.name,
  order: order ?? this.order,
  isActive: isActive ?? this.isActive,
  createdTime: createdTime ?? this.createdTime,
  v: v ?? this.v,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['order'] = order;
    map['isActive'] = isActive;
    map['createdTime'] = createdTime;
    map['__v'] = v;
    return map;
  }

}