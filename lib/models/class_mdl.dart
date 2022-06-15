import 'package:equatable/equatable.dart';

class ClassMdl extends Equatable {
  final String id;
  final String nama;
  final String deskripsi;

  const ClassMdl({
    required this.id,
    required this.nama,
    required this.deskripsi,
  });

  ClassMdl copyWith({
    String? id,
    String? nama,
    String? deskripsi,
  }) {
    return ClassMdl(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      deskripsi: deskripsi ?? this.deskripsi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'deskripsi': deskripsi,
    };
  }

  factory ClassMdl.fromMap({
    required Map<String, dynamic> map,
    required String id,
  }) {
    return ClassMdl(
      id: id,
      nama: map['nama'],
      deskripsi: map['deskripsi'],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, nama, deskripsi];
}
