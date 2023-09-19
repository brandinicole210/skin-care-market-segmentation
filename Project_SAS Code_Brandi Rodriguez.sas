
filename bigrec 'O:\Student$\MSDA2020\MKT6971_002\Instructor\FA15_Data.txt' 
lrecl=65378;
DATA everyone;
infile bigrec;
input

my_id 1-7

/*variables for PCA Factor #1*/
naturalbeauty_agree_alot 6389
naturalbeauty_agree_little 6432
naturalbeauty_neither 6518
naturalbeauty_disagree_little 6561
naturalbeauty_disagree_alot 6604

localgrown_agree_alot 4324
localgrown_agree_little 4371
localgrown_neither 4465
localgrown_disagree_little 4512
localgrown_disagree_alot 4559

artificial_agree_alot 4323
artificial_agree_little 4370
artificial_neither 4464
artificial_disagree_little 4511
artificial_disagree_alot 4558

nutritional_agree_alot 4287
nutritional_agree_little 4334
nutritional_neither 4428
nutritional_disagree_little 4475
nutritional_disagree_alot 4522

/*variables for PCA Factor #2*/
lookyoung_agree_alot 4660
lookyoung_agree_little 4737
lookyoung_neither 4891
lookyoung_disagree_little 4968
lookyoung_disagree_alot 5045

spendwhatever_agree_alot 4019
spendwhatever_agree_little 4038
spendwhatever_neither 4076
spendwhatever_disagree_little 4095
spendwhatever_disagree_alot 4114

attractive_agree_alot 3412
attractive_agree_little 3439
attractive_neither 3493
attractive_disagree_little 3520
attractive_disagree_alot 3547

fashion_agree_alot 7601
fashion_agree_little 7624
fashion_neither 7670
fashion_disagree_little 7693
fashion_disagree_alot 7716

/*statistical drivers*/
socialmedia_agree_alot 6843
socialmedia_agree_little 6858
socialmedia_neither 6888
socialmedia_disagree_little 6903
socialmedia_disagree_alot 6918

ad_recall_agree_alot 5774
ad_recall_agree_little 5819
ad_recall_neither 5909
ad_recall_disagree_little 5954
ad_recall_disagree_alot 5999

/*statistical drivers used in trials for PCA, but not used in final solution*/
price_agree_alot 6382
price_agree_little 6425
price_neither 6511
price_disagree_little 6554
price_disagree_alot 6597

careful_agree_alot 6102
careful_agree_little 6123
careful_neither 6165
careful_disagree_little 6186
careful_disagree_alot 6207

/*descriptor variables*/
gender 2384
clinique 48519
sephora 43198
ulta 43212
apparel 42778
bravo 9607
onlineinfo 8571
orderonline 45151
cigarettes 51596
reason_antiage 47025

run;

/*filter for target population (women)*/
DATA females;
set everyone;
if gender = .;
run;

DATA myvariables;
set females;

if gender = . then gender = 0;
if gender = 1 then gender = 1;
label gender = "Gender";

if clinique = . then clinique = 0;
if clinique = 1 then clinique = 1;
label clinique = "The brand I use most often for moisturizers/creams/lotions is Clinique";

if naturalbeauty_agree_alot = 1 then naturalbeauty = 5; 
if naturalbeauty_agree_little = 1 then naturalbeauty = 4; 
if naturalbeauty_neither = 1 then naturalbeauty = 3; 
if naturalbeauty_disagree_little = 1 then naturalbeauty = 2; 
if naturalbeauty_disagree_alot = 1 then naturalbeauty = 1; 
label naturalbeauty = "When I shop for health and beauty care products, I look for organic/natural items";

if localgrown_agree_alot = 1 then localgrown = 5; 
if localgrown_agree_little = 1 then localgrown = 4; 
if localgrown_neither = 1 then localgrown = 3; 
if localgrown_disagree_little = 1 then localgrown = 2; 
if localgrown_disagree_alot = 1 then localgrown = 1; 
label localgrown = "I make an effort to buy locally grown food";

if artificial_agree_alot = 1 then artificial = 5; 
if artificial_agree_little = 1 then artificial = 4; 
if artificial_neither = 1 then artificial = 3; 
if artificial_disagree_little = 1 then artificial = 2; 
if artificial_disagree_alot = 1 then artificial = 1; 
label artificial = "I prefer foods without artificial additives";

if nutritional_agree_alot = 1 then nutritional = 5; 
if nutritional_agree_little = 1 then nutritional = 4; 
if nutritional_neither = 1 then nutritional = 3; 
if nutritional_disagree_little = 1 then nutritional = 2; 
if nutritional_disagree_alot = 1 then nutritional = 1; 
label nutritional = "Nutritional value is the most important factor in the foods I eat";

if lookyoung_agree_alot = 1 then lookyoung = 5;
if lookyoung_agree_little = 1 then lookyoung = 4;
if lookyoung_neither = 1 then lookyoung = 3;
if lookyoung_disagree_little = 1 then lookyoung = 2;
if lookyoung_disagree_alot = 1 then lookyoung = 1;
label lookyoung = "It is important to keep looking young";

if spendwhatever_agree_alot = 1 then spendwhatever = 5; 
if spendwhatever_agree_little = 1 then spendwhatever = 4; 
if spendwhatever_neither = 1 then spendwhatever = 3; 
if spendwhatever_disagree_little = 1 then spendwhatever = 2; 
if spendwhatever_disagree_alot = 1 then spendwhatever = 1; 
label spendwhatever= "I will spend whatever I have to, to make myself look younger";

if attractive_agree_alot = 1 then attractive = 5; 
if attractive_agree_little = 1 then attractive = 4; 
if attractive_neither = 1 then attractive = 3; 
if attractive_disagree_little = 1 then attractive = 2; 
if attractive_disagree_alot = 1 then attractive = 1; 
label attractive = "It is important to look attractive to others";

if fashion_agree_alot = 1 then fashion = 5; 
if fashion_agree_little = 1 then fashion = 4; 
if fashion_neither = 1 then fashion = 3; 
if fashion_disagree_little = 1 then fashion = 2; 
if fashion_disagree_alot = 1 then fashion = 1; 
label fashion = "I keep up with changes in styles and fashions";

if socialmedia_agree_alot = 1 then socialmedia = 5; 
if socialmedia_agree_little = 1 then socialmedia = 4; 
if socialmedia_neither = 1 then socialmedia = 3; 
if socialmedia_disagree_little = 1 then socialmedia = 2; 
if socialmedia_disagree_alot = 1 then socialmedia = 1; 
label socialmedia = "I like to follow my favorite brands or companies on social media/networking sites";

if ad_recall_agree_alot = 1 then ad_recall = 5; 
if ad_recall_agree_little = 1 then ad_recall = 4; 
if ad_recall_neither = 1 then ad_recall = 3; 
if ad_recall_disagree_little = 1 then ad_recall = 2; 
if ad_recall_disagree_alot = 1 then ad_recall = 1; 
label ad_recall = "I remember advertised products when shopping";

if price_agree_alot = 1 then price = 5; 
if price_agree_little = 1 then price = 4; 
if price_neither = 1 then price = 3; 
if price_disagree_little = 1 then price = 2; 
if price_disagree_alot = 1 then price = 1; 
label price = "Price isn't the most important factor - it is getting exactly what I want";

if careful_agree_alot = 1 then careful = 5; 
if careful_agree_little = 1 then careful = 4; 
if careful_neither = 1 then careful = 3; 
if careful_disagree_little = 1 then careful = 2; 
if careful_disagree_alot = 1 then careful = 1; 
label careful = "I'm careful with money";

if sephora = . then sephora = 0;
if sephora = 1 then sephora = 1;
label sephora = "I've shopped at Sephora in the last 30 days";

if ulta = . then ulta = 0;
if ulta = 1 then ulta = 1;
label ulta = "I've shopped at Ulta in the last 30 days";

if apparel = . then apparel = 0;
if apparel = 1 then apparel = 1;
label apparel = "I’ve spent $1000 or more on women’s apparel in the last three months"; 

if bravo = . then bravo = 0;
if bravo = 1 then bravo = 1;
label bravo = "I've viewed Bravo in the last 7 days";

if onlineinfo = . then onlineinfo = 0;
if onlineinfo = 1 then onlineinfo = 1;
label onlineinfo = "I have gathered information online for shopping in the last 30 days";

if orderonline = . then orderonline = 0;
if orderonline = 1 then orderonline = 1;
label orderonline = "I've ordered cosmetics online in the last 3 months"; 

if cigarettes = . then cigarettes = 0;
if cigarettes = 1 then cigarettes = 1;
label cigarettes = "I smoke cigarettes"; 

if reason_antiage = . then reason_antiage = 0;
if reason_antiage = 1 then reason_antiage = 1;
label reason_antiage = "I use facial cleansing/medicated products/toners for anti-aging"; 

/*Format variables*/
PROC FORMAT;
value MorF
	0 = "female"
	1 = "male"; 

value yesno
	0 = "no"
	1 = "yes"; 

value fivescale 
	5 = "agree alot"
	4 = "agree a little"
	3 = "neither agree nor disagree"
	2 = "disagree a little"
	1 = "disagree alot";
run;

/*Frequency Tables*/
PROC FREQ data=myvariables;
format gender MorF.;
tables gender; 

format clinique yesno.;
tables clinique; 

format naturalbeauty localgrown artificial nutritional lookyoung spendwhatever attractive fashion socialmedia ad_recall fivescale.;
tables naturalbeauty localgrown artificial nutritional lookyoung spendwhatever attractive fashion socialmedia ad_recall;

format sephora ulta apparel bravo onlineinfo orderonline cigarettes reason_antiage yesno.;
tables sephora ulta apparel bravo onlineinfo orderonline cigarettes reason_antiage;
run;

/*PCA Factor Analysis*/
PROC FACTOR data = myvariables
maxiter=100
method=principal
mineigen=1
rotate=varimax
scree
score
print
nfactors=8
out = myvariables;
var naturalbeauty localgrown artificial nutritional lookyoung spendwhatever attractive fashion;
run;

data myvariables;
set myvariables;
rename factor1 = allnatural;
rename factor2 = attractiveness;
rename my_id = resp_id;
run;

/*K Means*/
PROC FASTCLUS data = myvariables maxclusters=2;
var allnatural attractiveness socialmedia ad_recall;
run;

PROC FASTCLUS data = myvariables maxclusters=3;
var allnatural attractiveness socialmedia ad_recall;
run;

PROC FASTCLUS data = myvariables maxclusters=4;
var allnatural attractiveness socialmedia ad_recall;
run;

PROC FASTCLUS data = myvariables maxclusters=5;
var allnatural attractiveness socialmedia ad_recall;
run;

PROC FASTCLUS data = myvariables maxclusters=6;
var allnatural attractiveness socialmedia ad_recall;
run;

PROC FASTCLUS data = myvariables maxclusters=7;
var allnatural attractiveness socialmedia ad_recall;
run;

PROC FASTCLUS 
	data=myvariables 
	out = clustermeans
	maxclusters=4;
	var allnatural attractiveness socialmedia ad_recall;
	run;

PROC CONTENTS
	data=clustermeans;
	run;

PROC SORT
	data=clustermeans;
	by cluster;
	run;

PROC MEANS 
	data=clustermeans;
	var clinique sephora ulta apparel bravo onlineinfo orderonline cigarettes reason_antiage;
	by cluster;
	run;

/*Gap Analysis*/
PROC HPCLUS 
	data=myvariables
	maxclusters=6
	noc=abc(b=20 minclusters=2 align=pca criterion=firstpeak);
	score out=mygapcluster;
	input allnatural attractiveness socialmedia ad_recall / level=interval;
	id resp_id allnatural attractiveness socialmedia ad_recall clinique sephora ulta apparel bravo onlineinfo orderonline cigarettes reason_antiage;
	run;

PROC CONTENTS 
	data=mygapcluster;
	run;

PROC SORT 
	data=mygapcluster;
	by _cluster_id_;
	run;

PROC MEANS
	data=mygapcluster;
	by _cluster_id_;
	var clinique sephora ulta apparel bravo onlineinfo orderonline cigarettes reason_antiage;
	run;





