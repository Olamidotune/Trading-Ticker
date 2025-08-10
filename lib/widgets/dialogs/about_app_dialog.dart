import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/helpers/email_helper/email_fall_back.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

aboutAppDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.accentNeon],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/png/logo.jpeg',
                  height: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('CoinStalk'),
                Text(
                  'Version 1.1',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.color
                            ?.withValues(alpha: 0.6),
                      ),
                ),
              ],
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Copyright
              Text(
                '© 2025 Egundeyi Oladotun David. All rights reserved.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color),
              ),

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
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
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
              GestureDetector(
                onTap: () => _openCustomerCareMail(context),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color:
                          Theme.of(context).dividerColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.support_agent,
                        size: 25,
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

              const SizedBox(height: 24),
            ],
          ),
        ),
        actions: [
          // Custom License Button
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).pop(); // Close current dialog
              // Show license information
              showLicensePage(
                context: context,
                applicationName: 'CoinStalk',
                applicationVersion: 'Version 1.1',
                applicationLegalese:
                    '© 2025 Egundeyi Oladotun David. All rights reserved.',
              );
            },
            label: const Text(
              'Licenses',
              style: TextStyle(
                  color: AppColors.primaryColor, fontWeight: FontWeight.bold),
            ),
          ),

          // Custom Close Button
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Close',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
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

void _openCustomerCareMail(BuildContext context) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'Davidegundeyi@gmail.com', // Your email address
    queryParameters: {
      'subject': 'Customer Care Support',
    },
  );

  try {
    // Try to launch with mode specification
    bool launched = await launchUrl(
      emailLaunchUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      // If launching fails, try alternative methods
      await showEmailFallback(context);
    }
  } catch (e) {
    logInfo('Error launching email: $e');
    await showEmailFallback(context);
  }
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
