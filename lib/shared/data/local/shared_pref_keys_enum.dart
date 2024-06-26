enum SharedPrefKeys {
  onBoarding('user_token'),
  userToken('on_boarding'),
  getFreePoints('get_free_points'),
  getName('get_name'),
  getEmail('get_email'),
  getPhone('get_phone'),
  getAddress('get_address'),
  getZipCode('get_zipCode'),
  getCity('get_city'),
  getCountry('get_country'),
  getImage('get_image'),

  getPointsValue('get_points_value');

  final String key;
  const SharedPrefKeys(this.key);
}
