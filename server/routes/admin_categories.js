const mysql = require("../config/mysql");

module.exports = app => {

   // her placeres alle de routes administrations panelet har brug for 
   // routes administrations. 

  app.get("/admin/categories", async (req, res, next) => {
	// her skal alle kategorier hentes og sendes til template filen.....
	// send bruger tilbage til kategori admin listen

	// send.


  })

};

