
import json
from project.microservice import Microservice

class Stage(Microservice):

    def micro(self, content):
        content = str("["+str(content)+"]")
        self.setDatabaseName("sige")
        self.tablaVenta(content)
        self.tablaItemsDescuentos(content)
        self.tablaItemsFormaPago(content)
        self.tablaItemsPedido(content)

    def tablaVenta(self, content):
        self.clearLastInsertId()
        self.setDatabaseJson("./data/database/venta.json")
        self.setPathEndSQL("./bbdd/venta.sql")
        content1 = self.ventas(content)
        self.setContent(content1)
        self.controller()
        self.getLastInsertId()

    def tablaItemsDescuentos(self, content):
        """ Segunda tabla """
        self.setDatabaseJson("./data/database/itemsDescuentos.json")
        self.setPathEndSQL("./bbdd/itemsDescuentos.sql")
        content2 = self.itemsDescuentos(content)
        self.setContent(content2)
        self.controller()

    def tablaItemsFormaPago(self, content):
        self.setDatabaseJson("./data/database/itemsFormaPago.json")
        self.setPathEndSQL("./bbdd/itemsFormaPago.sql")
        content3 = self.itemsFormaPago(content)
        self.setContent(content3)
        self.controller()

    def tablaItemsPedido(self, content):
        self.setDatabaseJson("./data/database/itemsPedido.json")
        self.setPathEndSQL("./bbdd/itemsPedido.sql")
        content4 = self.itemsPedido(content)
        self.setContent(content4)
        self.controller()
        self.clearLastInsertId()
