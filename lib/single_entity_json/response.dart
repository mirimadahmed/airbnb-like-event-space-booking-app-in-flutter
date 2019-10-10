import 'package:json_annotation/json_annotation.dart';
part "response.g.dart";
// flutter packages pub run build_runner watch
@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "Entity")
  final SingleEntity singleEntity;
  @JsonKey(name: "CustomFields")
  final CustomField customField;
  BaseResponse(this.singleEntity, this.customField);
  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
}
@JsonSerializable()
class SingleEntity{
  final String name;
  final String permalink;
  final int entity_id;
  final String description;
  final String featured_image;
  final String address;
  final String phone_1;
  final String phone_2;
  final double longitude;
  final double latitude;
  final int company_id;
  final int type_id;
  final String status;
  final List<String> images;
  final String time_start;
  final String time_end;
  final String slot;
  final int hours_per_shift;
  final bool is_active;
  final List<TimingConfs> timings_conf;

  SingleEntity(
      this.name,
      this.permalink,
      this.entity_id,
      this.description,
      this.featured_image,
      this.address,
      this.phone_1,
      this.phone_2,
      this.longitude,
      this.latitude,
      this.company_id,
      this.type_id,
      this.status,
      this.images,
      this.time_start,
      this.time_end,
      this.slot,
      this.hours_per_shift,
      this.is_active,
      this.timings_conf
      );
  factory SingleEntity.fromJson(Map<String, dynamic> json) => _$SingleEntityFromJson(json);
}

@JsonSerializable()
class TimingConfs{
  final int timings_conf_id;
  final String slot;
  final String time_start;
  final String time_end;
  final int hours_per_shift;
  final bool is_active;

  TimingConfs(
      this.timings_conf_id,
      this.slot,
      this.time_start,
      this.time_end,
      this.hours_per_shift,
      this.is_active
      );
  factory TimingConfs.fromJson(Map<String, dynamic> json) => _$TimingConfsFromJson(json);

}
@JsonSerializable()
class CustomField{
  @JsonKey(name: "Amenities")
  final List<ModelData> amenitiesList;
  @JsonKey(name: "Activities")
  final List<ModelData> activitiesList;
  @JsonKey(name: "SEO Metatags")
  final List<ModelData> seoMetatagsList;

  CustomField(
      this.amenitiesList,
      this.activitiesList,
      this.seoMetatagsList
      );
  factory CustomField.fromJson(Map<String, dynamic> json) => _$CustomFieldFromJson(json);

}

@JsonSerializable()
class ModelData {
  final int cfd_id;
  final String name;
  final String field_type;
  @JsonKey(nullable: true)
  final dynamic value;
  final String form_placeholder;
  @JsonKey(nullable: true)
  final dynamic form_name;
  @JsonKey(nullable: true)
  final dynamic form_message;
  @JsonKey(nullable: true)
  final dynamic list_id;

  ModelData(
      this.cfd_id,
      this.name,
      this.field_type,
      this.value,
      this.form_placeholder,
      this.form_name,
      this.form_message,
      this.list_id
      );
  factory ModelData.fromJson(Map<String, dynamic> json) => _$ModelDataFromJson(json);

}


