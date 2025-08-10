import 'package:cointicker/bloc/auth/auth_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/screens/auth/forgot_password_screen.dart';
import 'package:cointicker/screens/auth/sign_up_screen.dart';
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
import 'package:lottie/lottie.dart';

class SignInScreen extends HookWidget {
  const SignInScreen({super.key});

  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    final emailNode = useFocusNode();
    final passwordNode = useFocusNode();
    final obscurePassword = useState(true);
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final controller = useAnimationController();

    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) =>
            _signInBuildWhen(context, current, previous),
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
                    Hero(
                      tag: 'welcome',
                      child: Lottie.asset(
                          height: 200,
                          width: double.infinity,
                          'assets/lottie/welcome.json',
                          controller: controller,
                          repeat: false, onLoaded: (composition) {
                        controller
                          ..duration = composition.duration
                          ..repeat();
                      }),
                    ),
                    Text('Sign In',
                        style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: 10),
                    Text(
                      'Welcome back',
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
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEvent.signIn());
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            onSuffixIconPressed: () =>
                                obscurePassword.value = !obscurePassword.value,
                          ),
                          AppSpacing.verticalSpaceLarge,
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      ForgotPasswordScreen.routeName);
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor,
                                      ),
                                )),
                          ),
                          AppSpacing.verticalSpaceLarge,
                          Button(
                            'Sign In',
                            busy: state.signInStatus ==
                                FormzSubmissionStatus.inProgress,
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                context.read<AuthBloc>().add(
                                      const AuthEvent.signIn(),
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
                                    SignUpScreen.routeName,
                                    (_) => false,
                                  );
                                },
                              text: 'Sign up',
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

  bool _signInBuildWhen(
      BuildContext context, AuthState current, AuthState previous) {
    if (previous.signInStatus.isInProgress && current.signInStatus.isSuccess) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        BottomNavBar.routeName,
        (_) => false,
      );
      ToastService.toast('Welcome');
    } else if (previous.errorMessage != current.errorMessage &&
        current.errorMessage != null) {
      ToastService.toast('${current.errorMessage}', ToastType.error);
      context.read<AuthBloc>().add(const AuthEvent.errorMessage(null));
      return false;
    }
    return true;
  }
}
