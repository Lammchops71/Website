#AGGREGATION - September 14th, 2017
# 1. Find Babe Ruth's career homerun totals
query<-"SELECT playerID, sum(HR) FROM Batting
WHERE playerID='ruthba01'
GROUP BY playerID"
sqldf(query)


#2. Find the career homerun totals for all players. Limit the display to only those that have a career total of 600 or more. Let's have the players with the highest total at the top
#*If filtering after group, use HAVING instead of WHERE*
query<-"SELECT playerID, sum(HR) FROM Batting
GROUP BY playerID
HAVING sum(HR)>=600
ORDER BY sum(HR) DESC"
sqldf(query)


#3.Find the players who averaged more than 30 homeruns per season over their career. Put those with the highest averages at the top.
query<-"SELECT playerID, avg(HR) 
FROM Batting
GROUP BY playerID
HAVING avg(HR)>30
ORDER BY avg(HR) DESC"
sqldf(query)

#---------------------------------------------------------------
#1. Babe Ruth: firstname, lastname, teamID, yearID, HR
query<-"SELECT nameFirst, nameLast, teamID, yearID, HR 
FROM Batting INNER JOIN Master
ON Batting.playerID=Master.playerID
WHERE Batting.playerID='ruthba01'"
sqldf(query)

#2. Find all instances of players hitting more than 50 homeruns. Give first & last names, teamID, yearID, and HR. Let's put players with most HR at the top.
query<-"SELECT nameFirst, nameLast, teamID, yearID, HR, weight
FROM Batting INNER JOIN Master
ON Batting.playerID=Master.playerID
WHERE Batting.HR > 50
ORDER BY HR DESC"
sqldf(query)

#3. Babe Ruth: playerID, team name, yearID, HR
query<-"SELECT playerID, name, Batting.yearID, Batting.HR
FROM Batting INNER JOIN Teams
ON Batting.teamID=Teams.teamID AND Batting.yearID=Teams.yearID
WHERE playerID='ruthba01'
ORDER BY Batting.HR DESC"
sqldf(query)

#-------September 19th, 2017------------------
#1. Find all the players named Bob who averaged more than one million dollars per year in salary for their careers, including last names.
query<-"SELECT nameFirst, nameLast, avg(salary)
FROM Salaries INNER JOIN Master
ON Salaries.playerID=Master.playerID
WHERE nameFirst='Bob'
GROUP BY Salaries.playerID
HAVING avg(salary)>1000000
ORDER BY avg(salary) DESC"
sqldf(query)
