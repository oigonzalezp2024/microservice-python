
import json
import os
import mysql.connector
from project.connector import Connector

class Integration(Connector):

    def setDatabaseName(self, databaseName):
        self.databaseName = databaseName

    def setBbddTemplate(self, bbddTemplate):
        self.bbddTemplate = bbddTemplate

    def setPathEndSQL(self, pathSQL):
        self.pathSQL = pathSQL

    def setDatabaseJson(self, database):
        self.database = database

    def setPathMapp(self, pathMapping):
        self.pathMapping = pathMapping

    def controller(self):
        self.jsonLoads()  
        self.getMappingKeyNames()
        self.mapping()
        self.insertMigr()

    def setContent(self, content):
        self.contentd = content
        self.content = content

    def jsonLoads(self):
        self.res = json.loads(self.content)
    
    def getMappingKeyNames(self):
        self.keyNames = []
        for i in self.res[0].keys():
            self.keyNames.append(i)
        
    def mapping(self):
        self.mappingN = {}
        self.dataT = []
        self.longgN = {}
        self.typesN = {}
        for i in self.keyNames:
            self.mappingN[i] = []
            
        self.stage1()
        self.stage2()
        self.stage3()
        self.stage4()
        self.stage5()
        self.stage6()

    def stage1(self):
        for i in self.res:
            for ii in self.keyNames:
                self.mappingN[ii].append(i[ii])

    def stage2(self):
        for keyy in self.mappingN:
            self.dataT.append(self.mappingN[keyy])

    def stage3(self):
        i = 0
        for ii in self.mappingN:
            self.typesN[ii] = str(type(self.dataT[i][0])).replace("<class '","").replace("\'>","")
            self.longgN[ii] = len(str(max(self.dataT[i])))
            i = i+1

    def stage4(self):
        self.databaseNameN = self.database.replace(os.path.split(self.database)[1], "").replace("./data/","").replace("/","")
        self.tableNameN = os.path.split(self.database)[1].replace(".json","")
        self.dataN = self.res[0]

    def stage5(self):
        self.mappingN = []
        self.mappingN.append({
            "databaseName": self.databaseNameN,
            "tableName": self.tableNameN,
            "fieldsTypes": self.typesN,
            "fieldsLong": self.longgN,
            "example": self.dataN
        })

    def stage6(self):
        self.content = json.dumps(self.mappingN, sort_keys=False, indent=4)
        self.pathContent = "./data/mapping/"+str(self.tableNameN)+str(".json")

    def insertMigr(self):
        database = self.databaseName
        mydb = self.connectorDataBase(database)
        mycursor = mydb.cursor()
        text = ""
        bind = "%s,"
        binds = ""
        for i in self.keyNames:
            text = text+str(i)+", "
            binds = binds+bind
        if(self.last_insert_id != ""):
            sql = "INSERT INTO "+str(self.tableNameN)+"("+str(text[:-2])+", venta_id) VALUES ("+str(binds[:-1])+",%s);"
        else:
            sql = "INSERT INTO "+str(self.tableNameN)+"("+str(text[:-2])+") VALUES ("+str(binds[:-1])+");"

        res = json.loads(self.contentd)

        keys = []
        for i in res[0]:
            keys.append(i)
        data = []
        for ii in res:
            regg = []
            cont = 0
            for i in ii:
                key = keys[cont]
                regg.append(ii[key])
                cont = cont+1

            if(self.last_insert_id != ""):
                regg.append(int(self.last_insert_id))

            data.append(regg)
        
        n = 100
        output = [data[i : i + n] for i in range(0, len(data), n)]

        for i in output:
            mycursor.executemany(sql, i)
            mydb.commit()
        print(mycursor.rowcount, "was inserted.")
        self.__mycursor = mycursor

    def getLastInsertId(self):
        self.last_insert_id = self.__mycursor._last_insert_id

    def clearLastInsertId(self):
        self.last_insert_id = ""
