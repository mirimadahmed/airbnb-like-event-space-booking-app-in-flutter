// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse(
    json['Entity'] == null
        ? null
        : SingleEntity.fromJson(json['Entity'] as Map<String, dynamic>),
    json['CustomFields'] == null
        ? null
        : CustomField.fromJson(json['CustomFields'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'Entity': instance.singleEntity,
      'CustomFields': instance.customField,
    };

SingleEntity _$SingleEntityFromJson(Map<String, dynamic> json) {
  return SingleEntity(
    json['name'] as String,
    json['permalink'] as String,
    json['entity_id'] as int,
    json['description'] as String,
    json['featured_image'] as String,
    json['address'] as String,
    json['phone_1'] as String,
    json['phone_2'] as String,
    (json['longitude'] as num)?.toDouble(),
    (json['latitude'] as num)?.toDouble(),
    json['company_id'] as int,
    json['type_id'] as int,
    json['status'] as String,
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    json['time_start'] as String,
    json['time_end'] as String,
    json['slot'] as String,
    json['hours_per_shift'] as int,
    json['is_active'] as bool,
    (json['timings_conf'] as List)
        ?.map((e) =>
            e == null ? null : TimingConfs.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SingleEntityToJson(SingleEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'permalink': instance.permalink,
      'entity_id': instance.entity_id,
      'description': instance.description,
      'featured_image': instance.featured_image,
      'address': instance.address,
      'phone_1': instance.phone_1,
      'phone_2': instance.phone_2,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'company_id': instance.company_id,
      'type_id': instance.type_id,
      'status': instance.status,
      'images': instance.images,
      'time_start': instance.time_start,
      'time_end': instance.time_end,
      'slot': instance.slot,
      'hours_per_shift': instance.hours_per_shift,
      'is_active': instance.is_active,
      'timings_conf': instance.timings_conf,
    };

TimingConfs _$TimingConfsFromJson(Map<String, dynamic> json) {
  return TimingConfs(
    json['timings_conf_id'] as int,
    json['slot'] as String,
    json['time_start'] as String,
    json['time_end'] as String,
    json['hours_per_shift'] as int,
    json['is_active'] as bool,
  );
}

Map<String, dynamic> _$TimingConfsToJson(TimingConfs instance) =>
    <String, dynamic>{
      'timings_conf_id': instance.timings_conf_id,
      'slot': instance.slot,
      'time_start': instance.time_start,
      'time_end': instance.time_end,
      'hours_per_shift': instance.hours_per_shift,
      'is_active': instance.is_active,
    };

CustomField _$CustomFieldFromJson(Map<String, dynamic> json) {
  return CustomField(
    (json['Amenities'] as List)
        ?.map((e) =>
            e == null ? null : ModelData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['Activities'] as List)
        ?.map((e) =>
            e == null ? null : ModelData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['SEO Metatags'] as List)
        ?.map((e) =>
            e == null ? null : ModelData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CustomFieldToJson(CustomField instance) =>
    <String, dynamic>{
      'Amenities': instance.amenitiesList,
      'Activities': instance.activitiesList,
      'SEO Metatags': instance.seoMetatagsList,
    };

ModelData _$ModelDataFromJson(Map<String, dynamic> json) {
  return ModelData(
    json['cfd_id'] as int,
    json['name'] as String,
    json['field_type'] as String,
    json['value'],
    json['form_placeholder'] as String,
    json['form_name'],
    json['form_message'],
    json['list_id'],
  );
}

Map<String, dynamic> _$ModelDataToJson(ModelData instance) => <String, dynamic>{
      'cfd_id': instance.cfd_id,
      'name': instance.name,
      'field_type': instance.field_type,
      'value': instance.value,
      'form_placeholder': instance.form_placeholder,
      'form_name': instance.form_name,
      'form_message': instance.form_message,
      'list_id': instance.list_id,
    };
