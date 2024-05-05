
import 'dart:convert';

class ChatMessageModel{
  final String role;
  final List parts;
  ChatMessageModel({required this.role, required this.parts});

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      role: json["role"],
      parts: List.of(json["parts"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "role": this.role,
      "parts": jsonEncode(this.parts),
    };
  }

}
class ChatPartModel{
final String text;
  ChatPartModel({required this.text});
}