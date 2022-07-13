WITH 

SET [PRODUTOS] AS
'ORDER({[Produto].[Produto].Members},
 [Measures].[Custo Variavel], BDESC)'

SET [FILTRO ANO] AS
'{[Tempo.Calendario].[2014]}'

MEMBER [Measures].[Rank] AS
'RANK (
[Produto].[Produto].Currentmember
,[PRODUTOS])' 
, FORMAT_STRING = '#;#;-'

MEMBER [Measures].[% Participação] AS
'[Measures].[Custo Variavel]/
([Measures].[Custo Variavel], [Produto].[Todos os Produtos])'
, FORMAT_STRING = "#,###.00 %"

MEMBER [Measures].[Custo Variavel Acumulado] AS
'Sum (Head ([PRODUTOS], Rank ([Produto].[Produto].Currentmember,
[PRODUTOS] ) ), [Measures].[Custo Variavel]
)', FORMAT_STRING = "#,###.00"

MEMBER [Measures].[Membros Total] AS
'([Produto].[Produto].Members.Count)' 
, FORMAT_STRING = '#;#;-'

MEMBER [Measures].[% Membro] AS
'[Measures].[Rank]/[Measures].[Membros Total]'
, FORMAT_STRING = "#,###.00 %"

MEMBER [Measures].[% Part Acumulado] AS
'Sum (Head ([PRODUTOS], Rank ([Produto].[Produto].Currentmember,
[PRODUTOS] ) ),
[Measures].[% Participação] 
)', FORMAT_STRING = "#,###.00 %"

SELECT
NON EMPTY {[Measures].[Custo Variavel], [Measures].[% Part Acumulado] 
, [Measures].[% Membro]
} ON COLUMNS,
NON EMPTY {[PRODUTOS]} ON ROWS
FROM [dmpresidencia]
WHERE {[FILTRO ANO]}