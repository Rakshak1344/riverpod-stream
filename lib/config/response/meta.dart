import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpodstream/config/response/meta_link.dart';

part 'meta.g.dart';

part 'meta.freezed.dart';

@freezed
class Meta with _$Meta {
  factory Meta({
    required int currentPage,
    required int lastPage,
    required int perPage,
    required String path,
    int? from,
    int? to,
    required int total,
    List<MetaLink>? metaLinks,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
