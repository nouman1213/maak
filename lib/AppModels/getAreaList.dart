class GetAreaList {
  final int? status;
  final String? message;
  final List<AreaList>? areaList;

  GetAreaList({
    this.status,
    this.message,
    this.areaList,
  });

  GetAreaList.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        areaList = (json['area_list'] as List?)
            ?.map((dynamic e) => AreaList.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'area_list': areaList?.map((e) => e.toJson()).toList()
      };
}

class AreaList {
  final int? id;
  final String? name;

  AreaList({
    this.id,
    this.name,
  });

  AreaList.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
