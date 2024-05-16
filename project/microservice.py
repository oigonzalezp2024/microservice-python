
import json
from core.integration import Integration

class Microservice(Integration):

    def ventas(self, content):
        """ Primera tabla """
        data = json.loads(content)
        carg = []
        for i in data:
            reg = {}
            reg["codPrefijo"] = i["codPrefijo"]
            reg["numero"] = i["numero"]
            reg["fecha"] = i["fecha"]
            reg["codTercero"] = i["codTercero"]
            reg["codVendedor"] = i["codVendedor"]
            reg["codDespachar"] = i["codDespachar"]
            reg["codFormaPago"] = i["codFormaPago"]
            reg["codBanco"] = i["codBanco"]
            reg["fechaVence"] = i["fechaVence"]
            reg["plazoDias"] = i["plazoDias"]
            reg["observacion"] = i["observacion"]
            carg.append(reg)
        
        content = json.dumps(carg)
        return content  

    def itemsDescuentos(self, content):
        """ Segunda tabla """
        data = json.loads(content)
        carg = []
        for i in data:
            itemsDescuentos = i["itemsDescuentos"]
            for ii in itemsDescuentos:
                reg = {}
                reg["codconcepto"] = ii["codconcepto"]
                reg["valordto"] = ii["valordto"]
                reg["baseretd"] = ii["baseretd"]
                reg["porcretd"] = ii["porcretd"]
                reg["porivad"] = ii["porivad"]
                reg["centrocostos"] = ii["centrocostos"]
                reg["codarea"] = ii["codarea"]
                carg.append(reg)

        content2 = json.dumps(carg)
        return content2  

    def itemsFormaPago(self, content):
        """ Segunda tabla """
        data = json.loads(content)
        carg = []
        for i in data:
            items = i["itemsFormaPago"]
            for ii in items:
                reg = {}
                reg["codFormaPago"] = ii["codFormaPago"]
                reg["plazoDias"] = ii["plazoDias"]
                reg["fechaVencimiento"] = ii["fechaVencimiento"]
                reg["valor"] = ii["valor"]
                carg.append(reg)

        content3 = json.dumps(carg)
        return content3    

    def itemsPedido(self, content):
        """ Segunda tabla """
        data = json.loads(content)
        carg = []
        for i in data:
            items = i["itemsPedido"]
            for ii in items:
                reg = {}
                reg["codMat"] = ii["codMat"]
                reg["codBodega"] = ii["codBodega"]
                reg["codTalla"] = ii["codTalla"]
                reg["codColor"] = ii["codColor"]
                reg["cantidad"] = ii["cantidad"]
                reg["tipoUnidad"] = ii["tipoUnidad"]
                reg["descuento"] = ii["descuento"]
                reg["centrosCostos"] = ii["centrosCostos"]
                reg["porcIva"] = ii["porcIva"]
                reg["valor"] = ii["valor"]
                reg["impConsumo"] = ii["impConsumo"]
                reg["observacion"] = ii["observacion"]
                carg.append(reg)

        content4 = json.dumps(carg)
        return content4
