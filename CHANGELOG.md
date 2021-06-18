## [0.0.5] - 19.06.2021

* add linter

## [0.0.4] - 14.06.2021

* Dart 2.13

## [0.0.3] - 29.11.2020

* Prepare for Null-safety (wait Dio update)

## [0.0.2] - 15.11.2020

* Add download method. For downloads binary data. Usage:

```dart
import 'package:image/image.dart' as DartImage;

Future<Image> getAvatarImage() async {
    final client = MSGraphClient(accessToken);
    final avatar = await client.download("/me/photo/\$value");
    final image = DartImage.decodeImage(avatar.toList());
    return image;
}
```
 

## [0.0.1] - 03.11.2020

* Initial release.
