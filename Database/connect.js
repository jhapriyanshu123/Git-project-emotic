const CONFIG = require('./../Config/config');

const knex = require('knex')({
client : 'mysql',
connection : {
  host : CONFIG.db_host,
  user : CONFIG.db_user,
  database : CONFIG.db_name,
  password : CONFIG.db_password,
  charset  : 'utf8mb4',
  collation : 'utf8mb4_unicode_ci'
}
});

const bookShelf = require('bookshelf')(knex);

module.exports = bookShelf;
