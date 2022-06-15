part of 'role_check_cubit.dart';

class RoleCheckState extends Equatable {
  final DataStatus loadStatus;
  final String role;

  const RoleCheckState({
    this.role = '',
    this.loadStatus = DataStatus.initial,
  });

  RoleCheckState copyWith({
    String? role,
    DataStatus? loadStatus,
  }) {
    return RoleCheckState(
      role: role ?? this.role,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }

  @override
  List<Object> get props => [role, loadStatus];
}
