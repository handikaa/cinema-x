import '../../misc/method.dart';
import 'method/profile_item.dart';
import 'method/user_info.dart';
import '../../providers/transaction_data_provider/transactio_data_provider.dart';
import '../../providers/user_data_provider/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/router/page_routes.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ListView(
        children: [
          ...userInfo(ref),
          const Divider(),
          verticalSpace(20),
          profileItem(
            'Update Profile',
            onTap: () => ref.read(routerProvider).pushNamed('update-profile'),
          ),
          verticalSpace(20),
          profileItem(
            'My Wallet',
            onTap: () => ref.read(routerProvider).pushNamed('wallet-page'),
          ),
          verticalSpace(20),
          profileItem('Change Password'),
          verticalSpace(20),
          profileItem('Change Language'),
          verticalSpace(20),
          const Divider(),
          verticalSpace(20),
          profileItem('Contact Us'),
          verticalSpace(20),
          profileItem('Privacy Policy'),
          verticalSpace(20),
          profileItem('Terms and Condition'),
          verticalSpace(60),
          switch (ref.watch(userDataProvider)) {
            AsyncData(:final value) => value != null
                ? SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          // ref.invalidate(transactioDataProvider);
                          ref.read(userDataProvider.notifier).logout();
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          },
          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //       onPressed: () {
          //         ref.invalidate(transactioDataProvider);
          //         ref.read(userDataProvider.notifier).logout();
          //       },
          //       child: const Text(
          //         'Logout',
          //         style: TextStyle(fontWeight: FontWeight.bold),
          //       )),
          // ),
          verticalSpace(20),
          const Text(
            'version 0.1',
            style: TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(50)
        ],
      ),
    );
  }
}
