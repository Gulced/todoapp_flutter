/// [Enum] yapısı: Runtime Constant
/// Kullanımı: AppUrl.baseUrl.path
enum AppUrl {
  ///
  register('api/users/register'),
  login('api/users/login');

  ///
  const AppUrl(this.path);
  final String path;
}
