
const express = require("express");
const bodyParser = require("body-parser");
const session = require("express-session");
const _ = require("lodash");
// const popup = require('popups');
// const popup = require("popups");
const app = express();
app.use(express.static("public"));
app.use(bodyParser.urlencoded({extended:true}));
app.set('view engine', 'ejs');

app.use(session({
  secret: 'mysecret',
  resave: false,
  saveUninitialized: false
}));

// Disable caching of pages
// app.use((req, res, next) => {
//   if (req.url === "/logout" || req.method === "POST") {
//     next();
//   } else {

//     res.header("Cache-Control", "no-cache, no-store, must-revalidate");
//     res.header("Pragma", "no-cache");
//     res.header("Expires", 0);
//     next();
//   }
// });




const mysql = require("mysql");
var dynamic_route = "";

var connection = mysql.createConnection({
    host:"localhost",
    database:"miniproject",
    user:"root",
    password:"root123"
});

connection.connect(function(err){
    if(err){
        console.log("not connected")
        return;
    }
    else{
        console.log("connected");
    }
});
app.get("/",function(req,res){
    res.render("index");
});
app.get("/signup",function(req,res){
    res.render("signup");
});
app.get("/login",function(req,res){
    
    res.render("login",{invalid_msg:""});
});
app.get("/student",function(req,res){
  res.render("student");
});

app.get("/courses",function(req,res){
    res.render("courses");
});



// app.post("/login",function(req,res){

//     const username = req.body.login_username;
//     const password = req.body.login_password;
//     var subjects = [];
//     connection.query('SELECT * FROM student WHERE username = ? AND pass_wd = ?', [username, password], (error, results) => {
//       if (error) {
//         throw error;
//       }
  
//       if (results.length > 0) {
//         var sem = results.sem;
//         var course = results.course;
//         var curr_yr = results.current_year;
//         connection.query("select * from subjects where sem = ? and course = ? and current_year = ?",[sem,course,curr_yr],function(error,results) {

    
//             if(error){
//                 console.log("error");
//             }
//             results.forEach(result => {
//                 subjects.push(result.subject_name);
//             });
//             res.render("student",{student_name:username,subject_names:subjects});
//         });
//       } else {
//         res.redirect("login");
//       }
//     });
    
   
   
    
// });

// app.post("/login", function(req, res) {
//   const username = req.body.login_username;
//   const password = req.body.login_password;
  
//   connection.query(
//     "SELECT * FROM student WHERE username = ? AND pass_wd = ?",
//     [username, password],
//     (error, results) => {
//       if (error) {
//         throw error;
//       }

//       if (results.length > 0) {
//         const sem = results[0].sem;
//         const course = results[0].course;
//         // const curr_yr = results[0].current_year;
//         const subjects = [];

//         connection.query(
//           "SELECT subject_name FROM subjects WHERE sem = ? AND course = ? ",
//           [sem, course],
//           function(error, subjectResults) {
//             if (error) {
//               console.log(error);
//             }
//             subjectResults.forEach((result) => {
//               subjects.push(result.subject_name);
//             });
//             res.render("student", {
//               student_name: username,
//               subject_names: subjects,
//             });
//           }
//         );
//       } else {
//         res.redirect("login");
//       }
//     }
//   );
// });

app.post("/login", function(req, res) {
  const username = req.body.login_username;
  const password = req.body.login_password;
  
  connection.query(
    "SELECT * FROM student WHERE username = ? AND pass_wd = ?",
    [username, password],
    (error, results) => {
      if (error) {
        throw error;
      }

      if (results.length > 0) {
        //starting a session
        req.session.username = username;

        var today = new Date();
        // var currentday = today.getDay();
        var month = today.getMonth();
        var year = today.getFullYear();
        var sem = 0;
        var yearofstudy = year - (results[0].admission_year);
        if(month>=0 && month<=5){
          sem = yearofstudy*2;
        }
        else{
          sem = (yearofstudy - 1)*2 + 1;
        }
      
        const course = results[0].course;
        const department = results[0].department;
        var subjects = [];
        var subcodes = [];
        connection.query(
          "SELECT subject_name,sub_code FROM subjects WHERE sem = ? AND course = ? AND department = ?",
          [sem, course, department],
          function(error, subjectResults) {
            if (error) {
              console.log(error);
            }
            subjectResults.forEach((result) => {
              subjects.push(result.subject_name);
              subcodes.push(result.sub_code);
            });
            res.render("student", {
              student_name: username,
              subject_names: subjects,
              subject_codes: subcodes
            });
          }
        );
      } else {
        res.render("login",{invalid_msg:"invalid username or password"});
      }
    }
  );
});


app.get("/student",function(req,res){
   res.render("student");
    
});
app.get("/courses/:user",function(req,res){
  var subject_details = req.params.user;
  connection.query("select * from syllabus where subject_name = ?",[subject_details],
    function(error,results){
      if(error){
        console.log(error);
      }
      else{
        var readings = results[0].Readings.split('|');
        var prim_id = results[0].subject_id;
        connection.query("select * from lectures where subject_id = ?",[prim_id],
          function(error,lectureResults){
            if(error){
              console.log(error);
            }
            else{
              var topics = [];
              var topiclinks = [];

              for (var i = 0; i < lectureResults.length; i++) {
                topics.push(lectureResults[i].topic_name);
                topiclinks.push(lectureResults[i].website_link);
              }
              connection.query("select * from subsyllabus where subject_id = ?",[prim_id],
                function(error,syllabusresult){
                  if(error){
                    console.log(error);
                  }
                  else{
                    var prereq = syllabusresult[0].prequisties.split('|');
                    var syllabuspara = syllabusresult[0].detsyllabus.split('|');
                    // var exp = syllabusresult[0].experiments.split('|');
                    connection.query("select * from faculty where subject_id = ?",[prim_id],
                      function(error,facultyresult){
                        if(error){
                          console.log(error);
                        }
                        else{
                          var facname = facultyresult[0].faculty_name;
                          var deptname = facultyresult[0].dept;
                          var facemail = facultyresult[0].email;
                          res.render("courses",
                          {subject_title:results[0].subject_name,
                            Prereq:prereq,
                            Syllabuspara:syllabuspara,
                      
                            Readings:readings,
                            topic_names:topics,
                            topic_links:topiclinks,
                            instructor_name:facname,
                            dept:deptname,
                            email:facemail}
                            );
                        }
                      }
                    );
                    
                  }
                }
              );
              
            }
          }
        )
        
       
      }
      
    }
  );
});
// app.get("/courses/"+dynamic_route+"/Readings",function(req,res){
//   res.render("courses",{subject_title:subject_details,xy:"iam Reading"});
// });

// app.get("/database",function(req,res){
//     let sql  = "select * from subjects";
//     var subject_names = [];
//    connection.query("select * from subjects",function(error,results) {
//         if(error){
//             console.log("error");
//         }
//         results.forEach(result => {
//             subject_names.push(result.subject_name);
//             res.write("<p>"+result.subject_name+"</p>");
//         });
//         console.log(subject_names);
//         res.send();
        
//     });
// });

// app.post("/signup",function(req,res){
    
   
//   connection.query('SELECT * FROM student WHERE username = ?', [req.body.username], (error, results) => {
//     if (error) {
//       throw error;
//     }

//     if (results.length > 0) {
//       res.send('Username already exists. Please choose a different username.');
//     } else {
//       connection.query('INSERT INTO student (roll_no,reg_no,sfirst_name,slast_name,email,admission_year,current_year,username,pass_wd,sem,course,department) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)', [req.body.rollno, req.body.regno,req.body.sfirst_name,req.body.slast_name,req.body.email,req.body.admission_year,req.body.current_year,req.body.username,req.body.pass_wd,req.body.semester,req.body.course,req.body.department], (error, results) => {
//         if (error) {
//           throw error;
//         }

//         res.redirect("login");
//       });
//       connection.query('COMMIT', (err) => {
//         if (err) {
//           return connection.rollback(() => {
//             throw err;
//           });
//         }
//         console.log('Transaction completed!');
//         connection.end();
//       });
//     connection.query("select * from student",(err,results) => {
//       console.log(results);
//     });

//     }
//   });

   

// });



app.post("/signup", function(req, res) {
  connection.query(
    "SELECT * FROM student WHERE username = ?",
    [req.body.username],
    (error, results) => {
      if (error) {
        throw error;
      }

      if (results.length > 0) {
        res.send(
          "Username already exists. Please choose a different username."
        );
      } else {
        connection.query(
          "INSERT INTO student (roll_no,sname,email,admission_year,username,pass_wd,course,department) VALUES (?,?,?,?,?,?,?,?)",
          [
            req.body.rollno,
            req.body.sfirst_name,
            req.body.email,
            req.body.admission_year,
            req.body.username,
            req.body.pass_wd,
            req.body.course,
            req.body.department,
          ],
          (error, results) => {
            if (error) {
              throw error;
            }

            console.log("1 record inserted!");
            connection.query("COMMIT", (err) => {
              if (err) {
                return connection.rollback(() => {
                  throw err;
                });
              }
              // console.log("Transaction completed!");
              connection.end();
              res.redirect("login");
            });
          }
        );
      }
    }
  );
});


app.get('/Logout', (req, res) => {
  req.session.destroy(err => {
    if (err) {
      console.error(err);
    } else {
      res.redirect('/login');
    }
  });
});

app.listen(3000,function(){
    console.log("server is runnning");
   
});














