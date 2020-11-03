# ms_graph_client

Very simple Microsoft Graph API client. In fact it is a wrapper over [Dio](https://pub.dev/packages/dio) for ease of use.
It was written to solve my problems and will evolve as needed.

If you need features such as error handling, tests, additional configuration or other capabilities - do pull requests). 
The package is published only on github and on pub.dev will be released only when finalized to an acceptable version

## Get started

Add dependency

```yaml
dependencies:
    ms_graph_client:
      git:
        url: git://github.com/unger1984/ms_graph_client.git
```

You need an authorization library MSAL to get accessToken. You can use any package for this: [msal_flutter](https://pub.dev/packages/msal_flutter), 
[msal_js](https://pub.dev/packages/msal_js) or any other.

```dart
final client = MSGraphClient(accessToken);
client.get('/me').then((me){
  print('me $me');
});
```

## API

Use as [Dio](https://pub.dev/packages/dio): get, post, put, delete 

## Changelog

[here](CHANGELOG.md)