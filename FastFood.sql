DROP database FASTFOOD

CREATE database FASTFOOD;
USE FASTFOOD;

CREATE TABLE	CARGOS(
Id_Cargo int NOT NULL auto_increment,
Descripcion VARCHAR (50) NOT NULL,
primary key (Id_Cargo)
);

CREATE TABLE DELIVERY(
Id_Delivery INT NOT NULL auto_increment,
Nombre VARCHAR (50) NOT NULL,
Telefono VARCHAR (10) NOT NULL,
Direccion VARCHAR (50) NOT NULL,
primary key (Id_Delivery)
);


CREATE TABLE METODOPAGO(
Id_MPago INT NOT NULL auto_increment,
Metodo VARCHAR (50) NOT NULL,
EntidadFinanciera VARCHAR (10) NOT NULL,
Cuotas INT NOT NULL,
primary key (Id_MPago)
);

CREATE TABLE	PROVEEDORES(
Id_Proveedor int NOT NULL auto_increment,
Razon_Social VARCHAR (150) NOT NULL,
Direccion VARCHAR (100) NOT NULL,
Telefono INT NOT NULL,
Email VARCHAR (130) NOT NULL,
primary key (Id_Proveedor)
);

 CREATE TABLE	CLIENTES(
Id_Cliente int NOT NULL auto_increment,
primary key (Id_Cliente)
);
CREATE TABLE	EMPLEADOS(
Id_Empleado int NOT NULL auto_increment,
Nombre VARCHAR (50) NOT NULL,
Apellido VARCHAR (50) NOT NULL,
Legajo int NOT NULL,
Horario date NOT NULL,
Id_Cargo int  NOT NULL,
primary key (Id_Empleado),
FOREIGN KEY (Id_Cargo) REFERENCES cargos(Id_Cargo)
);


CREATE TABLE	PRODUCTO(
Id_Producto int NOT NULL auto_increment,
Descripcion VARCHAR (300) NOT NULL,
Id_Proveedor INT NOT NULL,
Cantidad INT NOT NULL,
Peso FLOAT NOT NULL,
primary key (Id_Producto),
foreign key (Id_Proveedor) references proveedores (Id_Proveedor)
);


 CREATE TABLE	ORDEN(
Id_Orden int NOT NULL auto_increment,
Id_Empleado INT NOT NULL,
Id_Cliente INT NOT NULL,
Id_Producto INT NOT NULL,
Importe FLOAT NOT NULL,
Id_Mpago INT NOT NULL,
Mesa INT NOT NULL,
primary key (Id_Orden),
foreign key (Id_Empleado) references empleados (Id_Empleado),
foreign key (Id_Cliente) references clientes (Id_Cliente),
foreign key (Id_Producto) references producto (Id_Producto),
foreign key (Id_Mpago) references metodopago (Id_Mpago)
);



 CREATE TABLE	FACTURACION(
Id_Factura int NOT NULL auto_increment,
Id_Orden INT NOT NULL,
Id_Cliente INT NOT NULL,
Id_Producto INT NOT NULL,
Id_Delivery INT NOT NULL,
Importe FLOAT NOT NULL,
Mesa INT NOT NULL,
primary key (Id_Factura),
foreign key (Id_Orden) references empleados (Id_Empleado),
foreign key (Id_Cliente) references clientes (Id_Cliente),
foreign key (Id_Producto) references producto (Id_Producto),
foreign key (Id_Delivery) references delivery (Id_Delivery)
);

