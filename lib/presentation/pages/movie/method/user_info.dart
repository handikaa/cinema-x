import 'dart:math';
import '../../../extensions/int_extension.dart';
import '../../../misc/method.dart';
import '../../../providers/user_data_provider/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../misc/assets.dart';
import '../../../providers/router/page_routes.dart';

List<String> photoList = [
  placeholder,
  pp1,
  pp2,
  pp3,
  pp4,
  pp5,
  pp6,
];

Widget userInfo(WidgetRef ref, BuildContext context) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 2),
      child: SizedBox(
        height: 90,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    ref.watch(userDataProvider).valueOrNull?.photoUrl != null
                        ? NetworkImage(
                            ref.watch(userDataProvider).valueOrNull!.photoUrl!)
                        : AssetImage(
                            photoList[Random().nextInt(photoList.length)],
                          ),
              ),
              horizontalSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${greetingText()}, ${ref.watch(userDataProvider).when(
                          data: (user) => user?.name.split(' ').last ?? '',
                          error: (error, stackTrace) => '',
                          loading: () => '',
                        )}!',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Let\'s book your favorite movies',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  verticalSpace(10),
                  GestureDetector(
                    onTap: () =>
                        ref.read(routerProvider).pushNamed('wallet-page'),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(
                            iconWallet,
                          ),
                          width: 20,
                        ),
                        horizontalSpace(10),
                        Text(
                          ref.watch(userDataProvider).when(
                                data: (user) =>
                                    user!.balance.toIdrCurrencyFormat(),
                                error: (error, stackTrace) => '',
                                loading: () => '',
                              ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );

String greetingText() {
  var hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
