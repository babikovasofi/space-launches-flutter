import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_launches/common/navigation/app_router.dart';
import 'package:space_launches/features/launch/domain/launch_model.dart';
import 'package:space_launches/features/launch/presentation/utils/launch_format.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/card_surface.dart';
import 'package:space_launches/features/launch/presentation/view/widgets/status_chip.dart';

class LaunchCard extends StatelessWidget {
  const LaunchCard({super.key, required this.launch});

  final LaunchModel launch;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CardSurface(
      onTap: () => context.push(AppRoutes.launch(launch.id)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              launch.rocketImage,
              width: 96,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  launch.name,
                  style: theme.textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  launch.provider.name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  launch.launchTime,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                StatusChip(statusName: launch.status.name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
