import sys
from project.stage import Stage

def main()->int:
    content = """
        {
            "codPrefijo": "00",
            "numero": "string",
            "fecha": "dd/MM/yyyy",
            "codTercero": "00",
            "codVendedor": "string",
            "codDespachar": "string",
            "codFormaPago": "string",
            "codBanco": "00",
            "fechaVence": "dd/MM/yyyy",
            "plazoDias": 0,
            "observacion": "string",
            "itemsDescuentos":[
                {
                    "codconcepto": "string",
                    "valordto": "string",
                    "baseretd": "0",
                    "porcretd": "0",
                    "porivad": "0",
                    "centrocostos": "00",
                    "codarea": "111"
                },
                {
                    "codconcepto": "string",
                    "valordto": "string",
                    "baseretd": "0",
                    "porcretd": "0",
                    "porivad": "0",
                    "centrocostos": "00",
                    "codarea": "222"
                }
            ],
            "itemsFormaPago":[
                {
                    "codFormaPago": "string",
                    "plazoDias": "string",
                    "fechaVencimiento": "string",
                    "valor": "string"
                },
                {
                    "codFormaPago": "string",
                    "plazoDias": "string",
                    "fechaVencimiento": "string",
                    "valor": "string"
                }
            ],
            "itemsPedido":[
                {
                    "codMat": "string",
                    "codBodega": "00",
                    "codTalla": "string",
                    "codColor": "string",
                    "cantidad": 0,
                    "tipoUnidad": "M ó D",
                    "descuento": 0,
                    "centrosCostos": "string",
                    "porcIva": 0,
                    "valor": 0,
                    "impConsumo": 0,
                    "observacion": "string"
                },
                {
                    "codMat": "string",
                    "codBodega": "00",
                    "codTalla": "string",
                    "codColor": "string",
                    "cantidad": 0,
                    "tipoUnidad": "M ó D",
                    "descuento": 0,
                    "centrosCostos": "string",
                    "porcIva": 0,
                    "valor": 0,
                    "impConsumo": 0,
                    "observacion": "string"
                }
            ]
        }
    """
    stage = Stage()
    stage.micro(content)

if __name__ == '__main__':
    sys.exit(main())
