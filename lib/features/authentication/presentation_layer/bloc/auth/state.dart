abstract class AuthStates {}

class InitialAuthState extends AuthStates{}
class loadingAuthState extends AuthStates{}
class SuccessAuthState extends AuthStates{}
class ErrorAuthState extends AuthStates{}