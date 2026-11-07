import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/common/widgets/app_scaffold.dart';
import 'package:space_launches/common/widgets/load_error_view.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_bloc.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_event.dart';
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
              onChanged: (query) => context.read<LaunchListBloc>().add(
                LaunchListQueryChanged(query),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<LaunchListBloc, LaunchListState>(
              builder: (context, state) => switch (state) {
                LaunchListLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                LaunchListFailure(:final error) => Center(
                  child: LoadErrorView(
                    error: error,
                    onRetry: () => context.read<LaunchListBloc>().add(
                      const LaunchListRetried(),
                    ),
                  ),
                ),
                LaunchListLoaded(:final items, :final query)
                    when items.isEmpty && query.isNotEmpty =>
                  Center(
                    child: Text(
                      AppLocalizations.of(context).searchNotFound(query),
                    ),
                  ),
                LaunchListLoaded(:final items) => ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final launch = items[index];
                    return LaunchCard(key: ValueKey(launch.id), launch: launch);
                  },
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
