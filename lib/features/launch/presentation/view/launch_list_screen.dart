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
                final LaunchListLoaded loaded => _LaunchListView(state: loaded),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LaunchListView extends StatefulWidget {
  const _LaunchListView({required this.state});

  final LaunchListLoaded state;

  @override
  State<_LaunchListView> createState() => _LaunchListViewState();
}

class _LaunchListViewState extends State<_LaunchListView> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_controller.position.extentAfter < 400) {
      _requestNextPage();
    }
  }

  void _requestNextPage() {
    context.read<LaunchListBloc>().add(const LaunchListNextPageRequested());
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final showFooter = state.isLoadingMore || state.loadMoreError != null;
    return ListView.separated(
      controller: _controller,
      padding: const EdgeInsets.all(16),
      itemCount: state.items.length + (showFooter ? 1 : 0),
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == state.items.length) {
          final error = state.loadMoreError;
          return error == null
              ? const Center(child: CircularProgressIndicator())
              : LoadErrorView(error: error, onRetry: _requestNextPage);
        }
        final launch = state.items[index];
        return LaunchCard(key: ValueKey(launch.id), launch: launch);
      },
    );
  }
}
