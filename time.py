from datetime import datetime

# timestamp1 = datetime.now()

# date2 = datetime.strptime('2022-11-31', '%Y-%m-%d')

# difference = date2 - timestamp1

# if week in difference 


timenow = datetime.now().timestamp()
futureweek = 1669852799


if (futureweek - timenow) > 604800:
    print('this worked')



if (futureweek - timenow) < 604800:
    print('wrong answer')

readable = datetime.utcfromtimestamp(1669852799)
print(readable)
