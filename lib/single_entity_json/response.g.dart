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

Products _$ProductsFromJson(Map<String, dynamic> json) {
  return Products(
    json['product_id'] as int,
    json['name'] as String,
    json['description'],
    json['is_waivable'] as bool,
    json['is_required'] as bool,
    json['applicable_on_less_than'] as int,
    json['product_type'] as String,
    json['entity_id'] as int,
    json['list_items_exist'] as bool,
    (json['Pricing'] as List)
        ?.map((e) =>
            e == null ? null : PricingModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'product_id': instance.product_id,
      'name': instance.name,
      'description': instance.description,
      'is_waivable': instance.is_waivable,
      'is_required': instance.is_required,
      'applicable_on_less_than': instance.applicable_on_less_than,
      'product_type': instance.product_type,
      'entity_id': instance.entity_id,
      'list_items_exist': instance.list_items_exist,
      'Pricing': instance.Pricing,
    };

Products1 _$Products1FromJson(Map<String, dynamic> json) {
  return Products1(
    json['product_id'] as int,
    json['name'] as String,
    json['description'],
    json['is_waivable'] as bool,
    json['is_required'] as bool,
    json['applicable_on_less_than'] as int,
    json['product_type'] as String,
    json['entity_id'] as int,
    json['list_items_exist'] as bool,
    (json['list_items'] as List)
        ?.map((e) => e == null
            ? null
            : ListItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['Pricing'] as List)
        ?.map((e) =>
            e == null ? null : PricingModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$Products1ToJson(Products1 instance) => <String, dynamic>{
      'product_id': instance.product_id,
      'name': instance.name,
      'description': instance.description,
      'is_waivable': instance.is_waivable,
      'is_required': instance.is_required,
      'applicable_on_less_than': instance.applicable_on_less_than,
      'product_type': instance.product_type,
      'entity_id': instance.entity_id,
      'list_items_exist': instance.list_items_exist,
      'list_items': instance.list_items,
      'Pricing': instance.Pricing,
    };

PricingModel _$PricingModelFromJson(Map<String, dynamic> json) {
  return PricingModel(
    json['pricing_id'] as int,
    json['rate'] as double,
    json['rate_calculation'] as String,
    json['monday'] as double,
    json['tuesday'] as double,
    json['wednesday'] as double,
    json['thursday'] as double,
    json['friday'] as double,
    json['saturday'] as double,
    json['sunday'] as double,
    json['effective_date'] as String,
    json['expiration_date'] as String,
    json['product_id'] as int,
  );
}

Map<String, dynamic> _$PricingModelToJson(PricingModel instance) =>
    <String, dynamic>{
      'pricing_id': instance.pricing_id,
      'rate': instance.rate,
      'rate_calculation': instance.rate_calculation,
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
      'effective_date': instance.effective_date,
      'expiration_date': instance.expiration_date,
      'product_id': instance.product_id,
    };

ListItemModel _$ListItemModelFromJson(Map<String, dynamic> json) {
  return ListItemModel(
    json['list_item_id'] as int,
    json['list_item'] as String,
  );
}

Map<String, dynamic> _$ListItemModelToJson(ListItemModel instance) =>
    <String, dynamic>{
      'list_item_id': instance.list_item_id,
      'list_item': instance.list_item,
    };
