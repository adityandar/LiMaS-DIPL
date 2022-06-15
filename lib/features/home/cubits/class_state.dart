part of 'class_cubit.dart';

class ClassState extends Equatable {
  final List<ClassMdl> classes;
  final DataStatus loadStatus;

  const ClassState({
    this.classes = const [],
    this.loadStatus = DataStatus.initial,
  });

  ClassState copyWith({
    List<ClassMdl>? classes,
    DataStatus? loadStatus,
  }) {
    return ClassState(
      classes: classes ?? this.classes,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }

  @override
  List<Object> get props => [classes, loadStatus];
}
