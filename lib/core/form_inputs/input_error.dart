enum InputError {
  /// Form alanının boş bırakılması
  /// hata durumunu belirtir.
  empty,

  /// Geçersiz Form formatının
  /// hata durumunu belirtir.
  invalid;

  /// Bu getter metodu, enum değerine göre uygun
  /// hata mesajını döndürür.
  String get errorText {
    /// enum değerine göre kontrol yapar ve
    /// ilgili hata mesajını döner
    switch (this) {
      /// empty durumu için hata mesajı
      case InputError.empty:
        return 'Lütfen form alanını doldurun.';

      ///invalid durumu için hata mesajı
      case InputError.invalid:
        return 'Lütfen geçerli bir değer girin.';
    }
  }
}
