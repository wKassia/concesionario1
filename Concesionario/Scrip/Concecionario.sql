/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10/11/2016 16:58:13                          */
/*==============================================================*/



/*==============================================================*/
/* Table: AUTO                                                  */
/*==============================================================*/
create table AUTO
(
   CODAUTO              int not null auto_increment,
   CODMECANICO          int,
   CODMARCA             int,
   MODELO_AUTO          varchar(40) not null,
   CANTIDAD_AUTO        int not null,
   FECHA_ENTREGA        date not null,
   PRECIOVENTAAUTO      double not null,
   PRECIO_AUTO          double not null,
   PLACA                varchar(7) not null,
   ESTADO_AUTO          int not null,
   primary key (CODAUTO)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE
(
   COD_CLIENTE          char(10) not null,
   NOMBRE_CLIENTE       varchar(20) not null,
   APELLIDO_CLIENTE     varchar(50) not null,
   CI_CLIENTE           int not null,
   DIRECCION_LIENTE     varchar(150) not null,
   TELEFONO_CLIENTE     int not null,
   SEXO_CLIENTE         varchar(15) not null,
   primary key (COD_CLIENTE)
);

/*==============================================================*/
/* Table: DETALLEVENTAS                                         */
/*==============================================================*/
create table DETALLEVENTAS
(
   CODEMPLEADO          int,
   COD_CLIENTE          char(10),
   CODAUTO              int,
   PRECIO_VENTA         double not null
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO
(
   CODEMPLEADO          int not null auto_increment,
   NOMBRE_EMPLEADO      varchar(20) not null,
   APELLIDO_EMPLEADO    varchar(50) not null,
   EDAD                 int not null,
   CI_EMPLEADO          int not null,
   DIRECCION_EMPLEADO   varchar(150) not null,
   TELEFONO_EMPLEADO    int not null,
   SEXO_EMPLEADO        varchar(20) not null,
   EMPLEADO             varchar(30) not null,
   SALARIO_EMPLEADO     double not null,
   primary key (CODEMPLEADO)
);

/*==============================================================*/
/* Table: MARCAAUTO                                             */
/*==============================================================*/
create table MARCAAUTO
(
   CODMARCA             int not null auto_increment,
   NOMBREMARCA          varchar(20) not null,
   primary key (CODMARCA)
);

/*==============================================================*/
/* Table: MECANICO                                              */
/*==============================================================*/
create table MECANICO
(
   CODMECANICO          int not null auto_increment,
   CODEMPLEADO          int,
   primary key (CODMECANICO)
);

/*==============================================================*/
/* Table: REPUESTOS                                             */
/*==============================================================*/
create table REPUESTOS
(
   CODREPUESTO          int not null auto_increment,
   CODAUTO              int,
   ESTADO               int not null,
   PARTE                varchar(30) not null,
   PRECIO               double not null,
   CANTIDAD_REPUESTO    varchar(15) not null,
   MARACA               varchar(15) not null,
   primary key (CODREPUESTO)
);

/*==============================================================*/
/* Table: VENDEDOR                                              */
/*==============================================================*/
create table VENDEDOR
(
   CODVENDEDOR          int not null auto_increment,
   CODEMPLEADO          int,
   primary key (CODVENDEDOR)
);

alter table AUTO add constraint FK_CONTIENE foreign key (CODMARCA)
      references MARCAAUTO (CODMARCA) on delete restrict on update restrict;

alter table AUTO add constraint FK_RELATIONSHIP_8 foreign key (CODMECANICO)
      references MECANICO (CODMECANICO) on delete restrict on update restrict;

alter table DETALLEVENTAS add constraint FK_EFCTUA foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO) on delete restrict on update restrict;

alter table DETALLEVENTAS add constraint FK_OBTIENE foreign key (COD_CLIENTE)
      references CLIENTE (COD_CLIENTE) on delete restrict on update restrict;

alter table DETALLEVENTAS add constraint FK_TIENE foreign key (CODAUTO)
      references AUTO (CODAUTO) on delete restrict on update restrict;

alter table MECANICO add constraint FK_RELATIONSHIP_7 foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO) on delete restrict on update restrict;

alter table REPUESTOS add constraint FK_PERTENECE foreign key (CODAUTO)
      references AUTO (CODAUTO) on delete restrict on update restrict;

alter table VENDEDOR add constraint FK_RELATIONSHIP_6 foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO) on delete restrict on update restrict;

