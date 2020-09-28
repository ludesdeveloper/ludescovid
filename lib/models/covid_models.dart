import 'dart:convert';

CovidModel covidModelFromJson(String str) =>
    CovidModel.fromJson(json.decode(str));

String covidModelToJson(CovidModel data) => json.encode(data.toJson());

class CovidModel {
  CovidModel({
    this.objectIdFieldName,
    this.uniqueIdField,
    this.globalIdFieldName,
    this.geometryType,
    this.spatialReference,
    this.fields,
    this.features,
  });

  String objectIdFieldName;
  UniqueIdField uniqueIdField;
  String globalIdFieldName;
  String geometryType;
  SpatialReference spatialReference;
  List<Field> fields;
  List<Feature> features;

  factory CovidModel.fromJson(Map<String, dynamic> json) => CovidModel(
        objectIdFieldName: json["objectIdFieldName"],
        uniqueIdField: UniqueIdField.fromJson(json["uniqueIdField"]),
        globalIdFieldName: json["globalIdFieldName"],
        geometryType: json["geometryType"],
        spatialReference: SpatialReference.fromJson(json["spatialReference"]),
        fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "objectIdFieldName": objectIdFieldName,
        "uniqueIdField": uniqueIdField.toJson(),
        "globalIdFieldName": globalIdFieldName,
        "geometryType": geometryType,
        "spatialReference": spatialReference.toJson(),
        "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
      };
}

class Feature {
  Feature({
    this.attributes,
    this.geometry,
  });

  Attributes attributes;
  Geometry geometry;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        attributes: Attributes.fromJson(json["attributes"]),
        geometry: Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
        "geometry": geometry.toJson(),
      };
}

class Attributes {
  Attributes({
    this.provinsi,
    this.kasusPosi,
    this.kasusMeni,
    this.kasusSemb,
  });

  String provinsi;
  int kasusPosi;
  int kasusMeni;
  int kasusSemb;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        provinsi: json["Provinsi"],
        kasusPosi: json["Kasus_Posi"],
        kasusMeni: json["Kasus_Meni"],
        kasusSemb: json["Kasus_Semb"],
      );

  Map<String, dynamic> toJson() => {
        "Provinsi": provinsi,
        "Kasus_Posi": kasusPosi,
        "Kasus_Meni": kasusMeni,
        "Kasus_Semb": kasusSemb,
      };
}

class Geometry {
  Geometry({
    this.x,
    this.y,
  });

  double x;
  double y;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

class Field {
  Field({
    this.name,
    this.type,
    this.alias,
    this.sqlType,
    this.length,
    this.domain,
    this.defaultValue,
  });

  String name;
  String type;
  String alias;
  String sqlType;
  int length;
  dynamic domain;
  dynamic defaultValue;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        type: json["type"],
        alias: json["alias"],
        sqlType: json["sqlType"],
        length: json["length"] == null ? null : json["length"],
        domain: json["domain"],
        defaultValue: json["defaultValue"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "alias": alias,
        "sqlType": sqlType,
        "length": length == null ? null : length,
        "domain": domain,
        "defaultValue": defaultValue,
      };
}

class SpatialReference {
  SpatialReference({
    this.wkid,
    this.latestWkid,
  });

  int wkid;
  int latestWkid;

  factory SpatialReference.fromJson(Map<String, dynamic> json) =>
      SpatialReference(
        wkid: json["wkid"],
        latestWkid: json["latestWkid"],
      );

  Map<String, dynamic> toJson() => {
        "wkid": wkid,
        "latestWkid": latestWkid,
      };
}

class UniqueIdField {
  UniqueIdField({
    this.name,
    this.isSystemMaintained,
  });

  String name;
  bool isSystemMaintained;

  factory UniqueIdField.fromJson(Map<String, dynamic> json) => UniqueIdField(
        name: json["name"],
        isSystemMaintained: json["isSystemMaintained"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isSystemMaintained": isSystemMaintained,
      };
}
