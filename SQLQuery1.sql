create table inventario(
id int primary key identity,
producto varchar(10),
tipo_producto varchar(20),
estado varchar(15),
marca varchar(20),
color varchar (30),
precio varchar(30),
);
create table inventario_insumos(
id int primary key identity,
nombre varchar(20),
tipo_insumo varchar(20),
cantidad_cm_und varchar(20),
precio varchar(20),
proveedor varchar(30)
);
create table salida_insumos(
id int primary key identity,
producto varchar(30),
cantidad varchar(30),
fecha_salida varchar(30)
);
create table entrada_insumos(
id int primary key identity,
producto varchar(30),
cantidad varchar(30),
fecha_ingreso varchar(30)
);
create table inventario_producto(
id int primary key identity,
nombre varchar(20)
);
create table salida_producto(
id int primary key identity,
producto varchar(30),
cantidad varchar(30),
fecha_salida varchar(30)
);
create table entrada_produto(
id int primary key identity,
producto varchar(30),
cantidad varchar(30),
fecha_ingreso varchar(30)
);
create table proveedores(
id int primary key identity,
empresa varchar(20),
nit varchar(20),
direccion varchar(20),
telefono varchar(10),
producto varchar(30)
);
create table cargos(
id int primary key identity,
cargo varchar(40)
);
create table usuarios(
id int primary key identity,
nombre varchar(45),
apellidos varchar(20),
cargo varchar(20),
username varchar(25),
cotraseña varchar(20)
);
create table factura(
id int primary key identity,
nombre varchar(30),
fecha_factura varchar(30),
nit_cedula varchar(30),
valor varchar(30),
cantidad varchar(30),
no_factura varchar (30),
direccion  varchar (30),
detalle_factura varchar (20)
);
create table pedidos(
id int primary key identity,
nombre varchar(30),
no_factura varchar(30),
estado varchar(30),
fecha_entrega varchar(30)
);
alter table inventario
add id_cargos int foreign key references cargos(id);
alter table inventario
add id_proveedores int foreign key references proveedores(id);
alter table inventario
add id_invntario_producto int foreign key references inventario_producto(id);
alter table inventario
add id_invntario_insumos int foreign key references inventario_insumos(id);
alter table inventario_insumos
add id_salida_insumos int foreign key references salida_insumos(id);
alter table inventario_insumos
add id_entrada_insumos int foreign key references entrada_insumos(id);
alter table inventario_producto
add id_salida_producto int foreign key references salida_producto(id);
alter table inventario_producto
add id_entrada_produto int foreign key references entrada_produto(id);
alter table inventario_producto
add id_entrada_produto int foreign key references entrada_produto(id);
alter table proveedores
add id_factura int foreign key references factura(id);
alter table cargos
add usuarios int foreign key references usuarios(id);
alter table factura
add usuarios int foreign key references usuarios(id);
alter table factura
add id_pedidos int foreign key references pedidos(id);
select 
	d.object_id,
	a.name [table], -- identificara la Tabla
	b.name [column], -- identificara la columna
	c.name [type], -- identificara el Tipo
	CASE-- recibe el tipo de columna
	  --cuando c es   numerico  o   c es     decimal   o  c es      Float   entonces se precisa el numero
		WHEN c.name = 'numeric' OR  c.name = 'decimal' OR c.name = 'float'  THEN b.precision
		ELSE null
	END [Precision], 
--  recibe maximo tamaño de b
	b.max_length, 
	CASE -- recibe si la columna acepta nulos
		WHEN b.is_nullable = 0 THEN 'NO'
		ELSE 'SI'
	END [Permite Nulls],
	CASE -- recibe si la columna es identity (autoincrementable)
		WHEN b.is_identity = 0 THEN 'NO'
		ELSE 'SI'
	END [Es Autonumerico],	
	ep.value [Descripcion],-- recibe la descripcion de la columna(si la hay)
	f.ForeignKey, -- recibe si es llave foranea
	f.ReferenceTableName, -- recibe la referencia de la tabla
	f.ReferenceColumnName -- recibe la referencia de la columna
from sys.tables a   
      --          //    Seleciona y muestra toda la informacion   \\          --
	inner join sys.columns b on a.object_id= b.object_id 
	inner join sys.systypes c on b.system_type_id= c.xtype 
	inner join sys.objects d on a.object_id= d.object_id 
	LEFT JOIN sys.extended_properties ep ON d.object_id = ep.major_id AND b.column_Id = ep.minor_id
	LEFT JOIN (SELECT 
				f.name AS ForeignKey,
				OBJECT_NAME(f.parent_object_id) AS TableName,
				COL_NAME(fc.parent_object_id,fc.parent_column_id) AS ColumnName,
				OBJECT_NAME (f.referenced_object_id) AS ReferenceTableName,
				COL_NAME(fc.referenced_object_id,fc.referenced_column_id) AS ReferenceColumnName
				FROM sys.foreign_keys AS f
				INNER JOIN sys.foreign_key_columns AS fc ON f.OBJECT_ID = fc.constraint_object_id) 	f ON f.TableName =a.name AND f.ColumnName =b.name
WHERE a.name <> 'sysdiagrams' 
ORDER BY a.name,b.column_Id
