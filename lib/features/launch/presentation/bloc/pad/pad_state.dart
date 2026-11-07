import 'package:space_launches/features/launch/domain/pad_model.dart';

sealed class PadState {
  const PadState();
}

final class PadLoading extends PadState {
  const PadLoading();
}

final class PadLoaded extends PadState {
  const PadLoaded(this.pad);

  final PadModel pad;
}

final class PadNotFound extends PadState {
  const PadNotFound(this.id);

  final int id;
}
