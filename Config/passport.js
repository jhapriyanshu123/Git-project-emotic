const localStrategy = require('passport-local').Strategy;
const facebookStrategy = require('passport-facebook').Strategy;

const configAuth = require('./auth');

module.exports = (passport) => {
  passport.serializeUser((user, done) => {
    done(null, user.id);
  });
}
