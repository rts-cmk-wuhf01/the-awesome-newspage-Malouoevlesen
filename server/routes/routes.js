const mySQL = require("../config/mysql");

module.exports = (app) => {

   app.get('/', async (req, res, next) => {
      res.render('home');
      db = await mySQL.connect (); // Connects to database.

      db.end (); // Disconnects from database.
   });

   app.get('/about', (req, res, next) => {
      res.render('about');
   });

   app.get('/contact', (req, res, next) => {
      res.render('contact');
   });

   app.get('/categories-post', (req, res, next) => {
      let dateForPost = new Date('2019-04-14 07:00:14');
      let dateForOtherPost = new Date('2019-04-14 11:00:14');
      res.render('categories-post', { date: dateForPost, dateOther: dateForOtherPost }, function (err, html) {
         res.send(html)
      })

   });

   app.get('/single-post', (req, res, next) => {
      res.render('single-post');
   });

};