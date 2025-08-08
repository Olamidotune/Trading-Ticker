import 'package:cointicker/bloc/auth/auth_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/screens/auth/sign_in_screen.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:cointicker/services/toast_service.dart';
import 'package:cointicker/widgets/button.dart';
import 'package:cointicker/widgets/custom_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';

class ForgotPasswordScreen extends HookWidget {
  const ForgotPasswordScreen({super.key});

  static const routeName = '/forgot_password';

  @override
  Widget build(BuildContext context) {
    final emailNode = useFocusNode();
    final formKey = useMemoized(GlobalKey<FormState>.new);

    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) =>
            _forgotPasswordBuildWhen(context, current, previous),
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.verticalSpaceMassive,
                    Row(
                      children: [
                        Image.asset(
                          'assets/png/logo.png',
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          'CoinStalk',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.yellowWarningIconColor,
                              ),
                        ),
                      ],
                    ),
                    AppSpacing.verticalSpaceMassive,
                    Text('Reset Your Password',
                        style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: 10),
                    Text(
                      "Enter the email address linked to your CoinStalk account and we'll send you a password reset link.",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                    AppSpacing.verticalSpaceHuge,
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            textInputAction: TextInputAction.next,
                            focusNode: emailNode,
                            title: 'Email Address',
                            hintText: 'Enter your registered email address',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) => context.read<AuthBloc>().add(
                                  AuthEvent.forgotPasswordEmailChanged(value),
                                ),
                            onFieldSubmitted: () {
                              if (formKey.currentState?.validate() ?? false) {
                                context.read<AuthBloc>().add(
                                      const AuthEvent.forgotPassword(),
                                    );

                                logInfo(
                                    "Here: ${state.forgotPasswordEmail.value}");
                              }
                            },
                            prefixIcon: 'email',
                            validator: (value) {
                              if (EmailValidator.validate(
                                  value?.trim() ?? '')) {
                                return null;
                              }
                              return 'Please enter a valid email address';
                            },
                          ),
                          AppSpacing.verticalSpaceLarge,
                          Button(
                            'Send Link',
                            busy: state.forgotPasswordStatus ==
                                FormzSubmissionStatus.inProgress,
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                context.read<AuthBloc>().add(
                                      const AuthEvent.forgotPassword(),
                                    );
                              }
                            },
                          ),
                          AppSpacing.verticalSpaceMedium,
                          Text(
                            "Didn’t get the email? Check your spam/junk folder or try again.",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Remember Password? ',
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    SignInScreen.routeName,
                                    (_) => false,
                                  );
                                },
                              text: 'Sign in',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _forgotPasswordBuildWhen(
      BuildContext context, AuthState current, AuthState previous) {
    if (previous.forgotPasswordStatus.isInProgress &&
        current.forgotPasswordStatus.isSuccess) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        SignInScreen.routeName,
        (_) => false,
      );
      ToastService.toast('A password reset link has been sent to your email');
    } else if (previous.errorMessage != current.errorMessage &&
        current.errorMessage != null) {
      ToastService.toast('${current.errorMessage}', ToastType.error);
      context.read<AuthBloc>().add(const AuthEvent.errorMessage(null));
      return false;
    }
    return true;
  }
}
