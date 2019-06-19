const mySQL = require("../config/mysql");

module.exports = (app) => {

   // Route - Process of showing a packet of data from one source to a destination. 

   // Require, request. 
   app.get('/', async (req, res, next) => {
      // Connect to the DB and get all the data
      // The await operator is used to wait for a Promise. It can only be used inside an async function.
      db = await mySQL.connect (); // Connects to database.      
      let [categories] = await db.query('SELECT * FROM categories');
      db.end (); // Disconnects from database.

      // Call back function purely for the purpose of testing. 
      res.render('home', { categories:categories }, function (err, html) {
         res.send(html)

      // Rendering is the process of gathering data and load the associated templates (or send the output directly). Then apply the gathered data to the associated templates. The final output is sent to the user.

      // Also determines which ejs file it uses. 
      

      })

   });
   
   app.get('/hidden', function (req, res) {
      res.send('hello world')
    })

   app.get('/about', async (req, res, next) => {
         // Connect to the DB and get all the data
         db = await mySQL.connect (); // Connects to database.      
         let [categories] = await db.query('SELECT * FROM categories');
         db.end (); // Disconnects from database.
   
         res.render('about', { categories:categories }, function (err, html) {
            res.send(html)
         })
   });

   app.get('/contact',  async (req, res, next) => {
         // Connect to the DB and get all the data
         db = await mySQL.connect (); // Connects to database.      
         let [categories] = await db.query('SELECT * FROM categories');
         db.end (); // Disconnects from database.
   
         res.render('contact', { categories:categories }, function (err, html) {
            res.send(html)
         })

   });

            //  tilføjes i routes.js filen f.eks. lige under app.get('/contact') endpoint
            app.post('/contact', (req, res, next) => {
               res.send(req.body);
               });



   app.get('/single-post',  async (req, res, next) => {
         // Connect to the DB and get all the data
         db = await mySQL.connect (); // Connects to database.      
         let [categories] = await db.query('SELECT * FROM categories');
         db.end (); // Disconnects from database.
         
         res.render('single-post', { categories:categories }, function (err, html) {
         res.send(html)
         })
   });


   app.get('/categories-post/:category_id', async (req, res, next) => {

      // Connect to the DB and get all the data
      db = await mySQL.connect (); // Connects to database.      
      let [categories] = await db.query('SELECT * FROM categories');
      let [articles] = await db.execute(`
         SELECT articles.title, articles.text, images.src AS img, articles.id, 
            (SELECT COUNT(comments.id) 
            FROM comments 
            WHERE article_fk = articles.id) AS article_comments
         FROM articles 
         INNER JOIN images ON articles.images_fk=images.id 
         WHERE articles.category_fk = ?

      `, [req.params.category_id]);
      console.log(articles)

      db.end (); // Disconnects from database.

      

      console.log(categories)

      let dateForPost = new Date('2019-04-14 07:00:14');
      let dateForOtherPost = new Date('2019-04-14 11:00:14');
      res.render('categories-post', { date: dateForPost, dateOther: dateForOtherPost, categories: categories, articles: articles}, function (err, html) {
         res.send(html)
      })

   });



   app.get('/categories-post2/:category_id', async (req, res, next) => {

      let SQL = "";
      let SQLvalues = [];

      // Connect to the DB and get all the data
      db = await mySQL.connect (); // Connects to database. 
      SQL = 'SELECT * FROM categories';

      let [categories] = await db.query(SQL);

       // ========
      SQL = `
      SELECT articles.title, articles.text, images.src AS img, articles.id, 
         (SELECT COUNT(comments.id) 
         FROM comments 
         WHERE article_fk = articles.id) AS article_comments
      FROM articles 
      INNER JOIN images ON articles.images_fk=images.id 
      WHERE articles.category_fk = ?

   `;


   SQLvalues = [req.params.category_id];

      let [articles] = await db.execute (SQL, SQLvalues);

      // ========

     /* let [articles] = await db.execute(`
         SELECT articles.title, articles.text, images.src AS img, articles.id, 
            (SELECT COUNT(comments.id) 
            FROM comments 
            WHERE article_fk = articles.id) AS article_comments
         FROM articles 
         INNER JOIN images ON articles.images_fk=images.id 
         WHERE articles.category_fk = ?

      `, [req.params.category_id]);
      console.log(articles)
*/
      db.end (); // Disconnects from database.

     
      let dateForPost = new Date('2019-04-14 07:00:14');
      let dateForOtherPost = new Date('2019-04-14 11:00:14');
      res.render('categories-post', { date: dateForPost, dateOther: dateForOtherPost, categories: categories, articles: articles}, function (err, html) {
         res.send(html)
      })

   // Kept for notes. 
   // app.get('/categories-post', async (req, res, next) => {
   //    let dateForPost = new Date('2019-04-14 07:00:14');
   //    let dateForOtherPost = new Date('2019-04-14 11:00:14');
   //    res.render('categories-post', { date: dateForPost, dateOther: dateForOtherPost }, function (err, html) {
   //       res.send(html)
   //    })

   });

};