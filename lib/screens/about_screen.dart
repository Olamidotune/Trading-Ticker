import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/services/persistence_service.dart';
import 'package:cointicker/services/theme_service.dart';
import 'package:cointicker/widgets/profile_card.dart';
import 'package:cointicker/widgets/theme_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class AboutScreen extends HookWidget {
  static const String routeName = 'AboutScreen';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final username = useState<String?>(null);
    final email = useState<String?>(null);
    final controller = useAnimationController();

    useEffect(() {
      Future.microtask(() async {
        final userName = await PersistenceService().getUserName();
        final mail = await PersistenceService().getUserEmail();

        username.value = userName;
        email.value = mail;
      });

      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'About',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.whiteColor,
                  ),
            ),
          ],
        ),
        toolbarHeight: 140,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
          child: Column(
            children: [
              ProfileCard(
                controller: controller,
                email: email,
                username: username,
              ),
              AppSpacing.verticalSpaceMedium,
              const ThemeModeCard(),
              AppSpacing.verticalSpaceMedium,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.blackColor.withValues(alpha: .1)),
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                ),
                child: ListTile(
                  onTap: () => _showEnhancedAboutDialog(context),
                  leading: SvgPicture.asset('assets/svg/info.svg',
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color ??
                              (ThemeService.isDarkMode(context)
                                  ? AppColors.whiteColor
                                  : AppColors.textColor),
                          BlendMode.srcIn)),
                  title: const Text('About the app'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showEnhancedAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'CoinStalk',
      applicationVersion: 'Version 1.1',
      applicationIcon: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primaryColor, AppColors.accentNeon],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.currency_bitcoin,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
      applicationLegalese: '© 2025 CoinStalk. All rights reserved.',
      children: [
        const SizedBox(height: 16),

        // App Description
        Text(
          'Your ultimate cryptocurrency companion for staying ahead in the digital asset market.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.color
                    ?.withValues(alpha: 0.8),
              ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 20),

        // Features Section
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🚀 Key Features',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              _buildFeatureRow(
                context,
                '📊',
                'Top 100 Cryptocurrencies',
                'Real-time prices and market data',
              ),
              const SizedBox(height: 8),
              _buildFeatureRow(
                context,
                '📰',
                'Latest Crypto News',
                'Stay updated with breaking news',
              ),
              const SizedBox(height: 8),
              _buildFeatureRow(
                context,
                '📱',
                'Clean Interface',
                'Beautiful and intuitive design',
              ),
              const SizedBox(height: 8),
              _buildFeatureRow(
                context,
                '🌙',
                'Dark/Light Mode',
                'Customizable theme support',
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Stats Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard(context, '100+', 'Coins'),
            _buildStatCard(context, 'Live', 'Data'),
            _buildStatCard(context, '24/7', 'Updates'),
          ],
        ),

        const SizedBox(height: 20),

        // Contact/Support Section
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.support_agent,
                size: 18,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
              const SizedBox(width: 8),
              Text(
                'Need help? Contact our support team',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Disclaimer
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.redColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.redColor.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                size: 18,
                color: AppColors.redColor,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Investment Disclaimer: Cryptocurrency investments carry risk. Always do your own research before making investment decisions.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.redColor,
                        fontSize: 11,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

// Helper method for feature rows
  Widget _buildFeatureRow(
      BuildContext context, String emoji, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.color
                          ?.withValues(alpha: 0.7),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

// Helper method for stat cards
  Widget _buildStatCard(BuildContext context, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                ),
          ),
        ],
      ),
    );
  }
}
