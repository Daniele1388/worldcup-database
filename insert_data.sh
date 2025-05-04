#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clear existing data from tables before inserting new data
echo $($PSQL "TRUNCATE teams, games RESTART IDENTITY")

# Script to insert data from games.csv into teams and games databases
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
   then
   # get team_id for winner
   WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if not found
    if [[ -z $WINNER_ID ]]
     then
     # insert winner
     INSERT_TEAMS_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
     echo "Inserted winner teams: $WINNER"
    fi

   # get new winner team_id
   WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  fi
  
  if [[ $OPPONENT != 'opponent' ]]
   then
   # get team_id for opponent
   OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # if not found
    if [[ -z $OPPONENT_ID ]]
     then
     #insert opponent
     INSERT_TEAMS_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
     echo "Inserted opponent teams: $OPPONENT"
    fi

   # get new opponent team_id
   OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  fi
  if [[ $YEAR != 'year' ]]
    then 
    # Insert years, round, winner_goals and opponent_golas into games database
    INSERT_GAMES_RESULTS=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    echo "Inserted into games: $YEAR,$ROUND,$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS"
  fi
done
