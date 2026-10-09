import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_launches/common/widgets/app_scaffold.dart';
import 'package:space_launches/features/launch/presentation/view/launch_detail_screen.dart';
import 'package:space_launches/features/launch/presentation/view/launch_list_screen.dart';
import 'package:space_launches/l10n/app_localizations.dart';

abstract final class AppRoutes {
  static const String list = '/';

  static String launch(String id) => '/launch/$id';
}

abstract final class AppRouter {
  static const Duration _transition = Duration(milliseconds: 300);

  static final GoRouter router = _create();

  static GoRouter _create() {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    return GoRouter(
      initialLocation: AppRoutes.list,
      routes: [
        GoRoute(
          path: AppRoutes.list,
          pageBuilder: (context, state) =>
              _page(state, const LaunchListScreen()),
          routes: [
            GoRoute(
              path: 'launch/:id',
              pageBuilder: (context, state) => _page(
                state,
                LaunchDetailScreen(id: state.pathParameters['id']!),
              ),
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => const NotFoundScreen(),
    );
  }

  static Page<void> _page(GoRouterState state, Widget child) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionDuration: _transition,
      reverseTransitionDuration: _transition,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = animation.drive(CurveTween(curve: Curves.easeOutCubic));
        return SlideTransition(
          position: Tween(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(curved),
          child: SlideTransition(
            position: Tween(
              begin: Offset.zero,
              end: const Offset(-0.3, 0),
            ).animate(secondaryAnimation),
            child: FadeTransition(opacity: curved, child: child),
          ),
        );
      },
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(child: Text(AppLocalizations.of(context).pageNotFound)),
    );
  }
}
