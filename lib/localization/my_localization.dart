import 'package:get/get.dart';

class MyLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'Register':'Register',
          'email': 'Email',
          'password': 'Password',
          'register': 'Register',
          'invalid_email': 'Please enter a valid email',
          'empty_password': 'Password cannot be empty',
        },
        'km_KH': {
          'Register':'ចុះឈ្មោះ',
          'email': 'អ៊ីមែល',
          'password': 'ពាក្យសំងាត់',
          'register': 'ចុះឈ្មោះ',
          'invalid_email': 'សូមបញ្ចូលអ៊ីមែលត្រឹមត្រូវ',
          'empty_password': 'ពាក្យសំងាត់មិនអាចទទេ',
        },
        
      };
}
