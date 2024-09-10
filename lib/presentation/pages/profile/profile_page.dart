import 'package:flix_id/presentation/pages/profile/method/generals_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../misc/constants.dart';
import '../../misc/method.dart';
import '../../providers/user_data_provider/user_data_provider.dart';
import '../../widgets/button/elevated_button_extra_lage.dart';
import 'method/account_items.dart';
import 'method/more_items.dart';
import 'method/user_info.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ListView(
        children: [
          ...userInfo(ref, theme),
          verticalSpace(20),
          verticalSpace(20),
          accountItems(ref),
          verticalSpace(20),
          genenralItems(ref),
          verticalSpace(20),
          moreItems(ref),
          verticalSpace(30),
          switch (ref.watch(userDataProvider)) {
            AsyncData(:final value) => value != null
                ? SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      buttonType: ButtonType.extraLarge,
                      text: 'Logout',
                      buttonColor: ThemeColor.red,
                      onPressed: () {
                        // ref.invalidate(transactioDataProvider);
                        ref.read(userDataProvider.notifier).logout();
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          },
          verticalSpace(20),
          const Text(
            'version 0.1',
            style: TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(100)
        ],
      ),
    );
  }
}
