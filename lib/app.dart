import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_launches/common/navigation/app_router.dart';
import 'package:space_launches/common/theme/app_theme.dart';
import 'package:space_launches/common/theme/theme_cubit.dart';
import 'package:space_launches/features/launch/data/launch_repository.dart';
import 'package:space_launches/features/launch/domain/i_launch_repository.dart';
import 'package:space_launches/features/launch/presentation/bloc/list/launch_list_cubit.dart';
import 'package:space_launches/l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key, this.locale});

  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ILaunchRepository>(
      create: (_) => const LaunchRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                LaunchListCubit(context.read<ILaunchRepository>())..load(),
          ),
          BlocProvider(create: (_) => ThemeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) => MaterialApp.router(
            routerConfig: AppRouter.router,
            onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            locale: locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        ),
      ),
    );
  }
}
