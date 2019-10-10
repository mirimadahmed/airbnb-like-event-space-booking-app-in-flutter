



class Entity{

  final String name, permalink, description, featured_image, address, phone_1, phone_2, status;
  final int entity_id, company_id, type_id;
  final double longitude, latitude;

  Entity({
    this.name,
    this.permalink,
    this.description,
    this.featured_image,
    this.address,
    this.phone_1,
    this.phone_2,
    this.status,
    this.entity_id,
    this.company_id,
    this.type_id,
    this.latitude,
    this.longitude,
});

   factory Entity.fromJson(Map map){
     return Entity(
       name: map["name"],
       permalink: map["permalink"],
       description: map["description"],
       featured_image: map["featured_image"],
       address: map["address"],
       phone_1: map["phone_1"],
       phone_2: map["phone_2"],
       status: map["status"],
       entity_id: map["entity_id"],
       company_id: map["company_id"],
       type_id: map["type_id"],
       latitude: map["latitude"],
       longitude: map["longitude"],
     );
   }

}

