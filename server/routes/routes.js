const mySQL = require("../config/mysql");

module.exports = (app) => {

   app.get('/', async (req, res, next) => {
      res.render('home');
      db = await mySQL.connect (); // Connects to database.

      db.end (); // Disconnects from database.
   });

};