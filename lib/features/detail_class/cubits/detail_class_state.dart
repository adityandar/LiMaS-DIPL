part of 'detail_class_cubit.dart';

class DetailClassState extends Equatable {
  final ClassMdl? classInfo;
  final List<MaterialMdl> materials;
  final DataStatus loadStatus;

  const DetailClassState({
    this.classInfo,
    this.materials = const [],
    this.loadStatus = DataStatus.initial,
  });

  DetailClassState copyWith({
    final ClassMdl? classInfo,
    final List<MaterialMdl>? materials,
    final DataStatus? loadStatus,
  }) {
    return DetailClassState(
      classInfo: classInfo ?? this.classInfo,
      materials: materials ?? this.materials,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }

  @override
  List<Object?> get props => [classInfo, loadStatus, materials];
}
