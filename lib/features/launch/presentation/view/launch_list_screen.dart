import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/common/widgets/app_scaffold.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_cubit.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_state.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/launch_card.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/search_field.dart';
import 'package:space_launches/l10n/app_localizations.dart';

class LaunchListScreen extends StatelessWidget {
  const LaunchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SearchField(
              onChanged: context.read<LaunchListCubit>().search,
            ),
          ),
          Expanded(
            child: BlocBuilder<LaunchListCubit, LaunchListState>(
              builder: (context, state) {
                if (state.items.isEmpty && state.query.isNotEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context).searchNotFound(state.query),
                    ),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final launch = state.items[index];
                    return LaunchCard(key: ValueKey(launch.id), launch: launch);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
