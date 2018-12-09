CREATE TABLE [dbo].[Cliente] (
    [ID_Cliente]         INT          NOT NULL,
    [Nombre_Cliente]     VARCHAR (50) NULL,
    [Apellido_Cliente]   VARCHAR (50) NULL,
    [Telefono_Cliente]   BIGINT       NULL,
    [Direcccion_Cliente] VARCHAR (50) NULL,
    [Menbresia]          BIGINT       NULL
);

GO
CREATE TABLE [dbo].[Compra] (
    [ID_compra]         INT          NULL,
    [ID_suplidor]       INT          NULL,
    [Nombre_Producto]   VARCHAR (20) NULL,
    [Cantidad_Producto] INT          NULL,
    [Fecha_Compra]      DATE         NULL
);

GO
CREATE TABLE [dbo].[Empleado] (
    [ID_Empleado]        INT          NOT NULL,
    [Nombre_Empleado]    VARCHAR (50) NULL,
    [Apellido_Empleado]  VARCHAR (20) NULL,
    [Telefono_Empleado]  BIGINT       NULL,
    [Direccion_Empleado] VARCHAR (50) NULL
);

GO
CREATE TABLE [dbo].[Factura] (
    [ID_Factura]        INT          NOT NULL,
    [Nombre_Producto]   VARCHAR (20) NULL,
    [Precio_Producto]   MONEY        NULL,
    [Cantidad_Producto] INT          NULL,
    [Fecha]             DATE         NULL
);

GO
CREATE TABLE [dbo].[Inventario] (
    [ID_Producto]         INT          NULL,
    [Nombre_Producto]     VARCHAR (30) NULL,
    [Existencia_Producto] INT          NULL
);

GO
CREATE TABLE [dbo].[Producto] (
    [ID_Producto]     INT          NOT NULL,
    [Nombre_producto] VARCHAR (15) NULL,
    [Tipo_producto]   VARCHAR (10) NULL,
    [Precio_Producto] INT          NULL
);

GO
CREATE TABLE [dbo].[Suplidor] (
    [ID_Suplidor]     INT          NOT NULL,
    [Nombre_Suplidor] VARCHAR (50) NULL,
    [Lugar_Suplidor]  VARCHAR (40) NULL,
    [ID_Producto]     INT          NULL,
    [Nombre_Producto] NCHAR (10)   NULL
);

GO
CREATE TABLE [dbo].[Ventas] (
    [ID_Empleado] INT NOT NULL,
    [ID_Venta]    INT NOT NULL,
    [ID_Factura]  INT NOT NULL
);

GO
CREATE VIEW [dbo].[vista one]
AS
SELECT dbo.Cliente.ID_Cliente AS Expr5,
       dbo.Factura.ID_Factura AS Expr1,
       dbo.Factura.Nombre_Producto AS Expr2,
       dbo.Cliente.Nombre_Cliente AS Expr6,
       dbo.Cliente.Apellido_Cliente AS Expr7,
       dbo.Factura.Precio_Producto AS Expr3,
       dbo.Cliente.Telefono_Cliente AS Expr8,
       dbo.Factura.Cantidad_Producto AS Expr4,
       dbo.Cliente.*,
       dbo.Factura.*
FROM   dbo.Cliente CROSS JOIN dbo.Factura;

GO
ALTER TABLE [dbo].[Cliente]
    ADD CONSTRAINT [FK_Cliente_Cliente] FOREIGN KEY ([ID_Cliente]) REFERENCES [dbo].[Cliente] ([ID_Cliente]);

GO
ALTER TABLE [dbo].[Cliente]
    ADD CONSTRAINT [FK_Cliente_Factura] FOREIGN KEY ([ID_Cliente]) REFERENCES [dbo].[Cliente] ([ID_Cliente]);

GO
ALTER TABLE [dbo].[Cliente]
    ADD CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED ([ID_Cliente] ASC);

GO
ALTER TABLE [dbo].[Empleado]
    ADD CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED ([ID_Empleado] ASC);

GO
ALTER TABLE [dbo].[Factura]
    ADD CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED ([ID_Factura] ASC);

GO
ALTER TABLE [dbo].[Producto]
    ADD CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED ([ID_Producto] ASC);

GO
ALTER TABLE [dbo].[Suplidor]
    ADD CONSTRAINT [PK_Suplidor] PRIMARY KEY CLUSTERED ([ID_Suplidor] ASC);

GO
ALTER TABLE [dbo].[Ventas]
    ADD CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED ([ID_Empleado] ASC, [ID_Venta] ASC, [ID_Factura] ASC);

GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO PUBLIC;

GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO PUBLIC;

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Cliente"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Factura"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 136
               Right = 454
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vista one';

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vista one';

GO
