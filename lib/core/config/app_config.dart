enum Flavor { dev, staging, prod }

class AppConfig {
  final Flavor flavor;
  final String baseUrl;
  final String appName;

  AppConfig({
    required this.flavor,
    required this.baseUrl,
    required this.appName,
  });

  bool get isDev => flavor == Flavor.dev;
  bool get isStaging => flavor == Flavor.staging;
  bool get isProd => flavor == Flavor.prod;
}
