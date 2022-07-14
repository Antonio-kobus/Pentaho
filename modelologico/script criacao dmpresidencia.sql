USE dmpresidencia;


CREATE TABLE Dim_Organizacional (
                Id_Vendedor INT NOT NULL,
                Cod_Vendedor NVARCHAR(50) NOT NULL,
                Desc_Vendedor NVARCHAR(250) NOT NULL,
                Cod_Gerente NVARCHAR(50) NOT NULL,
                Desc_Gerente NVARCHAR(250) NOT NULL,
                Cod_Diretor NVARCHAR(50) NOT NULL,
                Desc_Diretor NVARCHAR(250) NOT NULL,
                PRIMARY KEY (Id_Vendedor)
);


CREATE TABLE Dim_Produto (
                Id_Produto INT NOT NULL,
                Cod_Produto NVARCHAR(50) NOT NULL,
                Desc_Produto NVARCHAR(250) NOT NULL,
                Atr_Tamanho NVARCHAR(250) NOT NULL,
                Atr_Sabor NVARCHAR(250) NOT NULL,
                Cod_Marca NVARCHAR(50) NOT NULL,
                Desc_Marca NVARCHAR(250) NOT NULL,
                Cod_Categoria NVARCHAR(50) NOT NULL,
                Desc_Categoria NVARCHAR(250) NOT NULL,
                PRIMARY KEY (Id_Produto)
);


CREATE TABLE Dim_Cliente (
                Id_Cliente INT NOT NULL,
                Cod_Cliente NVARCHAR(50) NOT NULL,
                Desc_cliente NVARCHAR(250) NOT NULL,
                Cod_Cidade NVARCHAR(50) NOT NULL,
                Desc_Cidade NVARCHAR(250) NOT NULL,
                Cod_Estado NVARCHAR(50) NOT NULL,
                Desc_Estado NVARCHAR(250) NOT NULL,
                Cod_Regiao NVARCHAR(50) NOT NULL,
                Desc_Regiao NVARCHAR(250) NOT NULL,
                Cod_Segmento NVARCHAR(50) NOT NULL,
                Desc_Segmento NVARCHAR(250) NOT NULL,
                PRIMARY KEY (Id_Cliente)
);

ALTER TABLE Dim_Cliente COMMENT 'Tabela da dimensão cliente';


CREATE TABLE Dim_Tempo (
                Id_Tempo INT NOT NULL,
                Cod_Tempo NVARCHAR(50) NOT NULL,
                Data DATE NOT NULL,
                Numero_Dia_Semana NVARCHAR(50) NOT NULL,
                Numero_Mes NVARCHAR(50) NOT NULL,
                Numero_Ano NVARCHAR(50) NOT NULL,
                Nome_Mes NVARCHAR(250) NOT NULL,
                Numero_Trimestre NVARCHAR(50) NOT NULL,
                Nome_Trimestre NVARCHAR(250) NOT NULL,
                Numero_Semestre NVARCHAR(50) NOT NULL,
                Nome_Semestre NVARCHAR(250) NOT NULL,
                PRIMARY KEY (Id_Tempo)
);


CREATE TABLE Dim_Fabrica (
                Id_Fabrica INT NOT NULL,
                Cod_Fabrica NVARCHAR(50) NOT NULL,
                Desc_Fabrica NVARCHAR(250) NOT NULL,
                PRIMARY KEY (Id_Fabrica)
);

ALTER TABLE Dim_Fabrica COMMENT 'Tabela de dimensão Fábrica';


CREATE TABLE Fato_Presidencia (
                Id_Tempo INT NOT NULL,
                Id_Fabrica INT NOT NULL,
                Id_Vendedor INT NOT NULL,
                Id_Cliente INT NOT NULL,
                Id_Produto INT NOT NULL,
                Faturamento DOUBLE PRECISION NOT NULL,
                Unidade_Vendida DOUBLE PRECISION NOT NULL,
                Quantidade_Vendida DOUBLE PRECISION NOT NULL,
                Imposto DOUBLE PRECISION NOT NULL,
                Custo_Variavel DOUBLE PRECISION NOT NULL,
                Custo_Frete DOUBLE PRECISION NOT NULL,
                Custo_Fixo DOUBLE PRECISION NOT NULL,
                Meta_Faturamento DOUBLE PRECISION NOT NULL,
                Meta_Custo DOUBLE PRECISION NOT NULL,
                PRIMARY KEY (Id_Tempo, Id_Fabrica, Id_Vendedor, Id_Cliente, Id_Produto)
);


ALTER TABLE Fato_Presidencia ADD CONSTRAINT dim_organizacional_fato_presidencia_fk
FOREIGN KEY (Id_Vendedor)
REFERENCES Dim_Organizacional (Id_Vendedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Presidencia ADD CONSTRAINT produto_fato_presidencia_fk
FOREIGN KEY (Id_Produto)
REFERENCES Dim_Produto (Id_Produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Presidencia ADD CONSTRAINT cliente_fato_presidencia_fk
FOREIGN KEY (Id_Cliente)
REFERENCES Dim_Cliente (Id_Cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Presidencia ADD CONSTRAINT tempo_fato_presidencia_fk
FOREIGN KEY (Id_Tempo)
REFERENCES Dim_Tempo (Id_Tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Presidencia ADD CONSTRAINT dim_fabrica_fato_presidencia_fk
FOREIGN KEY (Id_Fabrica)
REFERENCES Dim_Fabrica (Id_Fabrica)
ON DELETE NO ACTION
ON UPDATE NO ACTION;