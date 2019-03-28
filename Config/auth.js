module.exports = {
  'facebookAuth' :  {
    'clientId'      : '2488208148072606',
    'clientSecret'  : '252e44cb4ca6d68135a574b09932deac',
    'callbackURL'   : 'http://localhost:4000/auth/facebook/callback',
    'profileURL'    : 'https://graph.facebook.com/v2.5/me?fields=first_name,last_name,email',
    'profileFields' : ['id', 'email', 'name']
  }
}
