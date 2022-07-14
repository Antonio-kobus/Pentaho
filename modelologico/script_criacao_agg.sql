CREATE TABLE Agg_Ano_Fat (
                Cod_Ano VARCHAR(50) NOT NULL,
                Id_Vendedor INT NOT NULL,
                Id_Fabrica INT NOT NULL,
                Id_Cliente INT NOT NULL,
                Id_Produto INT NOT NULL,
                ContadorLinha INT NOT NULL,
                Faturamento DOUBLE PRECISION NOT NULL,
                PRIMARY KEY (Cod_Ano, Id_Vendedor, Id_Fabrica, Id_Cliente, Id_Produto)
);

ALTER TABLE Agg_Ano_Fat ADD CONSTRAINT dim_organizacional_agg_ano_fat_fk
FOREIGN KEY (Id_Vendedor)
REFERENCES Dim_Organizacional (Id_Vendedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Agg_Ano_Fat ADD CONSTRAINT dim_produto_agg_ano_fat_fk
FOREIGN KEY (Id_Produto)
REFERENCES Dim_Produto (Id_Produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Agg_Ano_Fat ADD CONSTRAINT dim_cliente_agg_ano_fat_fk
FOREIGN KEY (Id_Cliente)
REFERENCES Dim_Cliente (Id_Cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


ALTER TABLE Agg_Ano_Fat ADD CONSTRAINT dim_fabrica_agg_ano_fat_fk
FOREIGN KEY (Id_Fabrica)
REFERENCES Dim_Fabrica (Id_Fabrica)
ON DELETE NO ACTION
ON UPDATE NO ACTION;