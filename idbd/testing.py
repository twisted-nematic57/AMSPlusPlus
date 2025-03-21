from datetime import datetime, timedelta

# replace these two with arbitrary dates
date1 = datetime(2023,6,12)
date2 = datetime(2025,3,19)

# get difference in days
days_difference = (date2 - date1).days
print(days_difference)