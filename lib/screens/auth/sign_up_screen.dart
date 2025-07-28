import 'package:cointicker/bloc/auth/auth_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/screens/auth/sign_in_screen.dart';
import 'package:cointicker/services/toast_service.dart';
import 'package:cointicker/widgets/bottom_nav_bar.dart';
import 'package:cointicker/widgets/button.dart';
import 'package:cointicker/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    final emailNode = useFocusNode();
    final passwordNode = useFocusNode();
    final confirmPasswordNode = useFocusNode();
    final fullNameNode = useFocusNode();
    final obscurePassword = useState(true);
    final obscureConfirmPassword = useState(true);
    final formKey = useMemoized(GlobalKey<FormState>.new);

    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) =>
            _signUpBuildWhen(context, current, previous),
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
                                fontFamily: 'HelveticaNeueRounded',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.yellowWarningIconColor,
                              ),
                        ),
                      ],
                    ),
                    AppSpacing.verticalSpaceMassive,
                    Text('Sign Up',
                        style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: 10),
                    Text(
                      'Welcome, we are delighted to have you here.',
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
                            hintText: 'Enter your preferred email address',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) => context.read<AuthBloc>().add(
                                  AuthEvent.emailChanged(value),
                                ),
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
                          CustomTextFormField(
                            textInputAction: TextInputAction.next,
                            focusNode: fullNameNode,
                            title: 'Full Name',
                            hintText: 'Enter your full name',
                            keyboardType: TextInputType.name,
                            prefixIcon: 'user',
                            onChanged: (value) {
                              context.read<AuthBloc>().add(
                                    AuthEvent.fullNameChanged(value),
                                  );
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              return null;
                            },
                          ),
                          AppSpacing.verticalSpaceLarge,
                          CustomTextFormField(
                            textInputAction: TextInputAction.next,
                            focusNode: passwordNode,
                            title: 'Password',
                            hintText: 'Input your preferred password',
                            keyboardType: TextInputType.text,
                            prefixIcon: 'password',
                            obscureText: obscurePassword.value,
                            isPassword: true,
                            onChanged: (value) {
                              context.read<AuthBloc>().add(
                                    AuthEvent.passwordChanged(value),
                                  );
                            },
                            onFieldSubmitted: () {
                              confirmPasswordNode.requestFocus();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              if (value != state.confirmPassword.value) {
                                return 'Passwords do not match';
                              }

                              return null;
                            },
                            onSuffixIconPressed: () =>
                                obscurePassword.value = !obscurePassword.value,
                          ),
                          AppSpacing.verticalSpaceLarge,
                          CustomTextFormField(
                            textInputAction: TextInputAction.go,
                            focusNode: confirmPasswordNode,
                            title: 'Confirm Password',
                            hintText: 'Input your preferred password',
                            keyboardType: TextInputType.text,
                            prefixIcon: 'password',
                            obscureText: obscureConfirmPassword.value,
                            isPassword: true,
                            onFieldSubmitted: () {
                              if (formKey.currentState?.validate() ?? false) {
                                context.read<AuthBloc>().add(
                                      const AuthEvent.signUp(),
                                    );
                              }
                            },
                            onChanged: (value) {
                              context.read<AuthBloc>().add(
                                    AuthEvent.confirmPasswordChanged(value),
                                  );
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              if (value != state.password.value) {
                                return 'Passwords do not match';
                              }

                              return null;
                            },
                            onSuffixIconPressed: () => obscureConfirmPassword
                                .value = !obscureConfirmPassword.value,
                          ),
                          AppSpacing.verticalSpaceLarge,
                          Button(
                            'Sign Up',
                            busy: state.signUpStatus ==
                                FormzSubmissionStatus.inProgress,
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                context.read<AuthBloc>().add(
                                      const AuthEvent.signUp(),
                                    );
                              } else {
                                ToastService.toast(
                                  'Please fill in all fields correctly.',
                                  ToastType.error,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
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
                                    fontFamily: 'HelveticaNeueRounded',
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

  bool _signUpBuildWhen(
      BuildContext context, AuthState current, AuthState previous) {
    if (previous.signUpStatus.isInProgress && current.signUpStatus.isSuccess) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        BottomNavBar.routeName,
        (_) => false,
      );
      ToastService.toast('Sign Up Successful');
    } else if (previous.errorMessage != current.errorMessage &&
        current.errorMessage != null) {
      ToastService.toast('${current.errorMessage}', ToastType.error);
      context.read<AuthBloc>().add(const AuthEvent.errorMessage(null));
      return false;
    }
    return true;
  }
}
