abstract class Environment {
  final String baseUrl;
  final String publicKey;
  final String privateKey;

  Environment(
    this.baseUrl,
    this.publicKey,
    this.privateKey,
  );
}

class DevEnvironment extends Environment {

  static const String _baseUrl = "http://gateway.marvel.com/v1/public";
  static const String _publicKey = "1aa3e591a48014d52354ab0edffde18f";
  static const String _privateKey = "1a1798079ad28fc9240a63f849607f1c46907021";

  DevEnvironment(
  ) : super(
    _baseUrl,
    _publicKey,
    _privateKey,
        );
}
