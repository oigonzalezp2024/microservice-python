
CREATE TABLE venta (
  id_venta int(11) AUTO_INCREMENT PRIMARY KEY,
  codPrefijo varchar(50) DEFAULT NULL,
  numero varchar(50) DEFAULT NULL,
  fecha varchar(50) DEFAULT NULL,
  codTercero varchar(50) DEFAULT NULL,
  codVendedor varchar(50) DEFAULT NULL,
  codDespachar varchar(50) DEFAULT NULL,
  codFormaPago varchar(50) DEFAULT NULL,
  codBanco varchar(50) DEFAULT NULL,
  fechaVence varchar(50) DEFAULT NULL,
  plazoDias int(11) DEFAULT NULL,
  observacion varchar(50) DEFAULT NULL
);

CREATE TABLE itemsformapago (
  id_itemsformapago int(11) AUTO_INCREMENT PRIMARY KEY,
  codFormaPago varchar(50) DEFAULT NULL,
  plazoDias varchar(50) DEFAULT NULL,
  fechaVencimiento varchar(50) DEFAULT NULL,
  valor varchar(50) DEFAULT NULL,
  venta_id int(11) NOT NULL
);

CREATE TABLE itemspedido (
  id_itemspedido int(11) AUTO_INCREMENT PRIMARY KEY,
  codMat varchar(50) DEFAULT NULL,
  codBodega varchar(50) DEFAULT NULL,
  codTalla varchar(50) DEFAULT NULL,
  codColor varchar(50) DEFAULT NULL,
  cantidad int(11) DEFAULT NULL,
  tipoUnidad varchar(50) DEFAULT NULL,
  descuento int(11) DEFAULT NULL,
  centrosCostos varchar(50) DEFAULT NULL,
  porcIva int(11) DEFAULT NULL,
  valor int(11) DEFAULT NULL,
  impConsumo int(11) DEFAULT NULL,
  observacion varchar(50) DEFAULT NULL,
  venta_id int(11) NOT NULL
);

CREATE TABLE itemsdescuentos (
  id_itemsdescuentos int(11) AUTO_INCREMENT PRIMARY KEY,
  codconcepto varchar(50) DEFAULT NULL,
  valordto varchar(50) DEFAULT NULL,
  baseretd varchar(50) DEFAULT NULL,
  porcretd varchar(50) DEFAULT NULL,
  porivad varchar(50) DEFAULT NULL,
  centrocostos varchar(50) DEFAULT NULL,
  codarea varchar(50) DEFAULT NULL,
  venta_id int(11) NOT NULL
);

ALTER TABLE itemsdescuentos
  ADD KEY venta_id (venta_id),
  ADD CONSTRAINT itemsdescuentos_ibfk_1 
  FOREIGN KEY (venta_id) REFERENCES venta (id_venta) ON UPDATE CASCADE;

ALTER TABLE itemsformapago
  ADD KEY venta_id (venta_id),
  ADD CONSTRAINT itemsformapago_ibfk_1 
  FOREIGN KEY (venta_id) REFERENCES venta (id_venta) ON UPDATE CASCADE;

ALTER TABLE itemspedido
  ADD KEY venta_id (venta_id),
  ADD CONSTRAINT itemspedido_ibfk_1 
  FOREIGN KEY (venta_id) REFERENCES venta (id_venta) ON UPDATE CASCADE;
