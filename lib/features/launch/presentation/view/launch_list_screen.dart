import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/common/widgets/app_scaffold.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_cubit.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_state.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/launch_card.dart';

class LaunchListScreen extends StatelessWidget {
  const LaunchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: BlocBuilder<LaunchListCubit, LaunchListState>(
        builder: (context, state) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: state.items.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final launch = state.items[index];
            return LaunchCard(key: ValueKey(launch.id), launch: launch);
          },
        ),
      ),
    );
  }
}
