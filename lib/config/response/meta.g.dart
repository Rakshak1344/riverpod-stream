// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meta _$$_MetaFromJson(Map<String, dynamic> json) => _$_Meta(
      currentPage: json['currentPage'] as int,
      lastPage: json['lastPage'] as int,
      perPage: json['perPage'] as int,
      path: json['path'] as String,
      from: json['from'] as int?,
      to: json['to'] as int?,
      total: json['total'] as int,
      metaLinks: (json['metaLinks'] as List<dynamic>?)
          ?.map((e) => MetaLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MetaToJson(_$_Meta instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'lastPage': instance.lastPage,
      'perPage': instance.perPage,
      'path': instance.path,
      'from': instance.from,
      'to': instance.to,
      'total': instance.total,
      'metaLinks': instance.metaLinks,
    };
