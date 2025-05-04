# 🌍 World Cup Database Project

This is a project built with **Bash, PostgreSQL, and SQL** to populate and query a relational database containing all FIFA World Cup matches from 1930 to 2018.

---

## 🚀 Project Goals

- Practice relational SQL and Bash scripting
- Perform data cleaning and automation with CSV files
- Extract useful statistics from sports data

---

## 🗂️ Project Structure

- `games.csv` → Source file with match data
- `insert_data.sh` → Bash script to populate the `teams` and `games` tables
- `queries.sh` → Bash script executing SQL queries for data analysis

---

## 🔍 Statistics Included

- Total and average goals by winning teams and both teams
- Most goals scored by one team in a single game
- Winning teams that scored more than 2 goals
- Winner of the 2018 tournament
- Teams that played in the 2014 "Eighth-Final" round
- Unique list of all winning teams
- World Cup champions by year
- Teams whose names start with "Co"

---

## 🛠️ Technologies Used

- **Bash** – for automation and scripting
- **PostgreSQL** – as the relational database system
- **SQL** – for data insertion and analysis (DDL, DML, JOIN, aggregation)

---

## ▶️ How to Run

1. Clone the repository  
   `git clone https://github.com/Daniele1388/worldcup-database.git`
2. Make sure PostgreSQL is installed and accessible
3. Create the `worldcup` and/or `worldcuptest` databases with the correct schema
4. Run the data import script:  
   `./insert_data.sh`
5. Run the query script:  
   `./queries.sh`

---

## 🔓 License

This project is open-source and available under the [MIT License](LICENSE).
