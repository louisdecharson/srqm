/* STATISTICAL REASONNING - WEEK 1 


/* A QUICK TOUR ON STATA

/* SET UP STATA */
/* ============ */

// Install two packages (you should be connected to the internet */
ssc install fre
ssc install lookfor_all

// Read package description
// ado de fre

// Prevent Stata to display -more- when displaying results
set more off, perm

// Go the correct directory
// Place the folder srqm somewhere and navigates to it using
// cd address_of_directory

// When you type 'ls'
ls
// you should see two folders
// (i) code
// (ii) and data.


// Example:
// cd ~/Documents/SciencesPo/srqm (MacOS)
// cd C:\Users\JeanJacques\srqm   (Windows)


// Comments
// ========

// This line is a comment due to the '//' symbol at its beginning. It takes a
// green colour in the Stata do-file editor. This do-file is fully commented
// to guide you through the basics. In your own code, you should also use
// comments to document and section your operations.

// note: lines or chunks of code that start with '*' are also comments, ...

/* and blocks of code that start with that symbol
   and end with the reverse one are also comments */

// ... and Stata helps you to detect comments by coloring them in green. 

// STATA INTERFACE
// ===============
// Stata has 5 docked windows:

/* | Windows    | Description                                 | */
/* |------------+---------------------------------------------| */
/* | Command    | Where you type your commands                | */
/* | Results    | Where Stata will display results            | */
/* | Review     | History of commands                         | */
/* | Variables  | List variables in the dataset               | */
/* | Properties | Display properties of variables and dataset | */
/* |------------+---------------------------------------------| */

/* Other windows (see when needed) */
/* + Graph */
/* + Viewer */
/* + Variable manages */
/* + Data editor */
/* + Do file editor */

// LOGS
// ====

// You can save the commands and results from a do-file to a log-file which
// can serve as a back-up of your work.
// Before you start working on a Stata, open a log-file and close it
// when you have finish.
// To log this session, type:
log using code/week1.log, replace

// COMMANDS
// ========

// A command in stata looks like
// command variable [, options]

// Get help with:
// help command_name

// 0. Some basic commands
display "Hello, World !"
di "Hi !"
di 2+2
di 2+2 == 4
di 2+2 == 3

// 1. Loading Data
sysuse lifeexp, clear

// 2. Describe Data

// 2.a Browse the data with the viewer
// browse

// A dataset is structured as a table with variables and columns and
// observations in rows:
// |               | Variable1 | Variable2 |
// |---------------+-----------+-----------|
// | Observation 1 | xx        | xx        |
// | Observation 2 | xx        | xx        |

// 2.b Describe the variableS
describe

// 2.c Describe a particular variable
describe region

// There are two types of variables :
// (i) categorical variable : qualitative attribute such as hair color,
// religion, gender. Qualitative variables can be split in two subcategories: 
// a. Ordinal variables that can be _ordered_ : as highest diploma
// b. Nominal variable that cannot : as religion or race

// (ii) Quantitative variables : Variables that are measured in terms of numbers
// Example: height or life expectancy

// 2.d Get information on a *qualitative variable*
sysuse 
tab region
// or
fre region

// 2.d Get information on a *quantitative* variable
summarize popgrowth
// Get more details
summarize popgrowth, details
// shorten
su popgrowth, d

// 2.d bis Get a histogram
hist popgrowth

// 2.5 Get a list of observations
list popgrowth in 1/10

// 3. Create variables
use data/nhis9711, clear

// Variable adult will be equal to 1 if age is higher or equal to 1
gen adult = age >= 21

// Drop a variable
gen thisisatest = 0
drop thisisatest

// Rename a variable
ren adult adult0

// Drop observations
// The data should be cross-sectional for the purpose of this course. However,
// the dataset contains observations for more than one year. We will solve that
// issue by keeping observations for the 2011 survey year only.
keep if year == 2011
// We can also drop all observations for which year is different to 2011
drop if year != 2011

// Close log
cap log close


// We are done. Just quit the application, have a nice week, and see you soon :)
// exit, clear
