import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id, nickname;

  const User({required this.id, required this.nickname});

  @override
  List<Object?> get props => [id, nickname];
}
