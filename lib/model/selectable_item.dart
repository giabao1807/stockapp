import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SelectableItem extends Equatable {
  final String id;
  String name;
  final String? tag;
  final String? icon;

  SelectableItem({
    required this.id,
    required this.name,
    this.tag,
    this.icon,
  });

  factory SelectableItem.unavailable() => SelectableItem(id: '', name: '');

  factory SelectableItem.fromJsonFavorite(Map<String, dynamic> json) =>
      SelectableItem(
        id: json["c1"],
        name: json["c2"],
        tag: 'FAV',
      );
  factory SelectableItem.fromJsonIndustries(Map<String, dynamic> json) =>
      SelectableItem(
        id: json["c0"],
        name: json["c1"],
      );
  factory SelectableItem.fromJson(Map<String, dynamic> json) => SelectableItem(
        id: json["c0"],
        name: json["c1"],
      );
  factory SelectableItem.fromBankJson(Map<String, dynamic> json) =>
      SelectableItem(
        id: json["c0"],
        name: '${json["c3"]} - ${json["c1"]}',
      );
  factory SelectableItem.fromBrokerAndRemisterJson(Map<String, dynamic> json) =>
      SelectableItem(
        id: json["c0"],
        name: json["c1"],
        tag: json["c2"],
      );
  factory SelectableItem.fromAccountListJson(Map<String, dynamic> json) =>
      SelectableItem(
        id: json["c2"],
        name: json["c3"],
      );
  factory SelectableItem.shinhanSecurities(String? lang) => SelectableItem(
        id: 'SX',
        name: 'SanXinHa',
      );

  bool get available => id.isNotEmpty && name.isNotEmpty;
  bool get unavailable => available == false;
  bool get isLO => id == '01' && name == 'LO';

  @override
  List<Object?> get props => [id];
}
