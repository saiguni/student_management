#!/usr/bin/env python
# coding: utf-8

# In[22]:


import pymysql
db = pymysql.connect(host='localhost',user='root',password='', database= "student_management") # creating the connection
cursor = db.cursor() # creating the cursor

query_stud = "select * from student"

result = cursor.execute(query_stud)
tuples = cursor.fetchall()
print(tuples)
resultt = [str(i) + "\n" for i in tuples]


fo = open('student.txt', "w")
fo.writelines(resultt)
fo.close()


# In[23]:


query_stud = "select * from professor"

result = cursor.execute(query_stud)
tuples = cursor.fetchall()
print(tuples)
resultt = [str(i) + "\n" for i in tuples]


fo = open('professor.txt', "w")
fo.writelines(resultt)
fo.close()


# In[25]:


query_stud = "select * from enrolls"

result = cursor.execute(query_stud)
tuples = cursor.fetchall()
print(tuples)
resultt = [str(i) + "\n" for i in tuples]


fo = open('enroll.txt', "w")
fo.writelines(resultt)
fo.close()


# In[26]:


query_stud = "select * from homework"

result = cursor.execute(query_stud)
tuples = cursor.fetchall()
print(tuples)
resultt = [str(i) + "\n" for i in tuples]


fo = open('homework.txt', "w")
fo.writelines(resultt)
fo.close()


# In[ ]:


query_stud = "select * from course_catalog"

result = cursor.execute(query_stud)
tuples = cursor.fetchall()
print(tuples)
resultt = [str(i) + "\n" for i in tuples]


fo = open('course_catalog.txt', "w")
fo.writelines(resultt)
fo.close()


# In[27]:


query_stud = "select * from advisor"# select query

result = cursor.execute(query_stud)# course execute runs the query on database
tuples = cursor.fetchall()# gets all the data
print(tuples)# prints the tuples
resultt = [str(i) + "\n" for i in tuples]# making the lines for the data to be stored in the file


fo = open('advisor.txt', "w")# opening the file
fo.writelines(resultt)# writing the file with the tuples
fo.close()# closing the opened file


# In[28]:


query_stud = "select * from teach" # select query

result = cursor.execute(query_stud) # course execute runs the query on database
tuples = cursor.fetchall() # gets all the data
print(tuples) # prints the tuples
resultt = [str(i) + "\n" for i in tuples] # making the lines for the data to be stored in the file


fo = open('teach.txt', "w") # opening the file
fo.writelines(resultt) # writing the file with the tuples
fo.close() # closing the opened file


# In[ ]:




