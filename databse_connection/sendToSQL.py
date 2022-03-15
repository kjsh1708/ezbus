import mysql.connector
import datetime


def sendToSQL(busStopId=2, peopleNumber=0):

    # 1. Establish Connection to the database
    # try:
    # mydb = mysql.connector.connect(
    #     host="localhost", port=3306, user="", password="", database="ezBusDB")

    mydb = mysql.connector.connect(
        host="121.37.249.219", port=3306, user="replace", password="replace", database="ezBusDB")
    print("Connection sucess!")
    mycursor = mydb.cursor()
    # except:
    #     print("Connection Failed")
    #     exit()
    # 2. Obtain and prepare date and time
    currentDateTime = datetime.datetime.now().replace(
        microsecond=0).strftime("%Y-%m-%d %H:%M:%S")
    print(currentDateTime)
    print(type(currentDateTime))

    # 3. Prepare SQL
    # sql = "insert into crowd_level (bus_stop_id, date_time, people_number) values ('1', '2022-03-15 15:08:23', '0');"
    sql = "insert into crowd_level (bus_stop_id, date_time, people_number) values (%s, %s, %s);"
    val = (busStopId, currentDateTime, peopleNumber)

    # 4. Insert the Data
    try:
        print(mycursor.execute(sql, val))
        mydb.commit()
        print(mycursor.rowcount, "record inserted.")
    except:
        print("Insertion failed")

    mydb.close()


sendToSQL(2, 10)
