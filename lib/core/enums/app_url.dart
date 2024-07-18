/// [Enum] yapısı: Runtime Constant
/// Kullanımı: AppUrl.baseUrl.path
enum AppUrl {
  ///
  baseUrl('https://api.destekleme.com/'),
  register('api/users/register'),
  login('api/users/login');

  ///
  const AppUrl(this.path);
  final String path;
}
