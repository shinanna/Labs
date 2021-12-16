--

README for Lab 32

# Data preparation plan: 
## create and work on a copy of my dataset
## look at my dataset statistics
## deal with missing values, identify outliers, harmonize 'Profession' values, drop duplicates, encode categorical values

--

# no variance on column Department ==> drop
# outliers identified at row 19 (max Amount 2399090) ==> drop
# other outliers identified at row 1 (BirthYear 2013, min Amount 1230) and row 17 (max BirthYear 2017): 
# let's assume the column is not labeled properly (1st year of worklife instead of BirthYear e.g.) ==> keep 

# compute new statistics after each operation on the table to verify data consistency

# replace missing values with relevant data found on same ClientID
# replace irrelevant values : typos, cases
# check any duplicates
# encode categorical data found in 2 columns: Profession and Risk

--

# export notebook to csv without the index (used only for coding)

--
