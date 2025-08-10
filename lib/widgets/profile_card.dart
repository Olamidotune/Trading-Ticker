import 'package:cointicker/bloc/auth/auth_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.controller,
    this.email,
    this.username,
  });

  final AnimationController controller;
  final String? email;
  final String? username;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: AppColors.blackColor.withValues(alpha: .1)),
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).inputDecorationTheme.fillColor,
          ),
          child: ListTile(
            title: Lottie.asset(
                height: 180,
                'assets/lottie/profile2.json',
                controller: controller,
                repeat: false, onLoaded: (composition) {
              controller
                ..duration = composition.duration
                ..repeat();
            }),
            subtitle: Column(
              children: [
                Text(capitalizeWords(email ?? ''),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Text(capitalizeWords(username ?? ''),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      },
    );
  }
}

String capitalizeWords(String text) {
  if (text.isEmpty) return text;
  return text.split(' ').map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1);
  }).join(' ');
}
