import 'package:equatable/equatable.dart';

class MaterialMdl extends Equatable {
  final String id;
  final String classId;
  final String nama;
  final String deskripsi;
  final String penjelasan;
  final bool isTask;
  final List<dynamic> jawaban;

  const MaterialMdl({
    required this.id,
    required this.classId,
    required this.nama,
    required this.deskripsi,
    required this.penjelasan,
    required this.isTask,
    this.jawaban = const [],
  });

  MaterialMdl copyWith({
    String? id,
    String? classId,
    String? nama,
    String? deskripsi,
    String? penjelasan,
    bool? isTask,
    List<dynamic>? jawaban,
  }) {
    return MaterialMdl(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      nama: nama ?? this.nama,
      deskripsi: deskripsi ?? this.deskripsi,
      penjelasan: penjelasan ?? this.penjelasan,
      isTask: isTask ?? this.isTask,
      jawaban: jawaban ?? this.jawaban,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classId': classId,
      'nama': nama,
      'deskripsi': deskripsi,
      'penjelasan': penjelasan,
      'isTask': isTask,
      'jawaban': jawaban,
    };
  }

  factory MaterialMdl.fromMap({
    required String id,
    required Map<String, dynamic> map,
  }) {
    return MaterialMdl(
      id: id,
      classId: map['classId'],
      nama: map['nama'],
      deskripsi: map['deskripsi'],
      penjelasan: map['penjelasan'],
      isTask: map['isTask'],
      jawaban: map['jawaban'] as List<dynamic>,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        id,
        classId,
        nama,
        deskripsi,
        penjelasan,
        isTask,
        jawaban,
      ];
}
