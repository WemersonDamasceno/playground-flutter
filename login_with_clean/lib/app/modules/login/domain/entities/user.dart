import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String name;
  final String email;

  User({this.uid, this.name, this.email});

  @override
  List<Object> get props => [uid, name, email];
}