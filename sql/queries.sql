-- Total de lucro por categoria
SELECT Category, SUM(Profit) AS TotalProfit
FROM superstore_raw
GROUP BY Category
ORDER BY TotalProfit DESC;

/*-- Resultado :
Technology	961.689.402.00
Office Supplies	775.994.074.00
Furniture	59.222.369.00
*/

-- Total de lucro por subcategoria
SELECT Sub_Category, SUM(Profit) AS TotalProfit
FROM superstore_raw
GROUP BY Sub_Category
ORDER BY TotalProfit DESC;

/*-- Resultado :
Copiers	384.550.310.00
Phones	301.952.105.00
Accessories	244.435.391.00
Paper	222.810.959.00
Binders	164.671.515.00
Storage	163.179.121.00
Chairs	137.064.260.00
Appliances	121.918.593.00
Furnishings	90.146.228.00
Envelopes	43.117.813.00
Labels	38.957.107.00
Art	36.792.870.00
Machines	30.751.596.00
Fasteners	5.352.698.00
Supplies	-20.806.602.00
Bookcases	-26.302.244.00
Tables	-141.685.875.00

-- Observação: Algumas subcategorias apresentam lucro negativo, indicando prejuízo nessas áreas.
*/

-- Maiores prejuízos por subcategoria
SELECT Sub_Category,
       SUM(Profit) AS TotalProfit
FROM superstore_raw
GROUP BY Sub_Category
HAVING SUM(Profit) < 0
ORDER BY TotalProfit;
/*-- Resultado :
Tables	-141.685.875.00
Bookcases -26.302.244.00  
Supplies -20.806.602.00
-- possível problema de custo, desconto ou logística.
*/

-- margem de lucro por categoria
SELECT Category,
       SUM(Profit) AS TotalProfit,
       SUM(Sales) AS TotalSales,
       ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS ProfitMarginPercentage
FROM superstore_raw
GROUP BY Category
ORDER BY ProfitMarginPercentage DESC;
/*-- Resultado :
Office Supplies	775994074.00	255389649.00	303.85
Technology	961689402.00	323409525.00	297.36
Furniture	59222369.00	551391138.00	10.74