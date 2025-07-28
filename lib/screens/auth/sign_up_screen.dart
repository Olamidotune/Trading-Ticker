import 'package:cointicker/bloc/auth/auth_bloc.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/services/toast_service.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Sign Up to \nEdu-Make',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome, we are delighted to have you here.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
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
                          if (EmailValidator.validate(value?.trim() ?? '')) {
                            return null;
                          }
                          return 'Please enter a valid email address';
                        },
                      ),
                      CustomTextFormField(
                        textInputAction: TextInputAction.next,
                        focusNode: fullNameNode,
                        title: 'Full Name',
                        hintText: 'Enter your full name',
                        keyboardType: TextInputType.name,
                        prefixIcon: 'email',
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
                      AppSpacing.verticalSpaceMedium,
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
                          print('Confirm Password Changed: $value');
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
                      AppSpacing.verticalSpaceMedium,
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
                          if (value != state.confirmPassword.value) {
                            return 'Passwords do not match';
                          }

                          return null;
                        },
                        onSuffixIconPressed: () => obscureConfirmPassword
                            .value = !obscureConfirmPassword.value,
                      ),
                      AppSpacing.verticalSpaceMedium,
                      Button(
                        busy: state.signUpStatus ==
                            FormzSubmissionStatus.inProgress,
                        text: 'Sign Up',
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: 'HelveticaNeueRounded',
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Colors.amber),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: 'Sign in',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: 'HelveticaNeueRounded',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.amber),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
