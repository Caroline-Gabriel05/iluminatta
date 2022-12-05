select sum(valor_total)

FROM tb_carrinho

WHERE DATE_FORMAT(DATA_PEDIDO,'%m') = 10 AND
      STATU = 'ENTREGUE'

group BY DATE_FORMAT(DATA_PEDIDO,'%m')

--------------------------------------------

select COD_CLIENTE, DATA_PEDIDO, DATE_FORMAT(DATA_PEDIDO,'%D%M%Y') DATA_FORMATADA, sum(valor_total)

FROM tb_carrinho

WHERE DATE_FORMAT(DATA_PEDIDO,'%Y') = 2022 AND
      STATU = 'ENTREGUE'

group BY COD_CLIENTE,DATA_PEDIDO;



select COD_CLIENTE, CONVERT(DATA_PEDIDO as DATE), sum(valor_total)

FROM tb_carrinho

WHERE DATE_FORMAT(DATA_PEDIDO,'%Y') = 2022 AND
      STATU = 'ENTREGUE'

group BY COD_CLIENTE,DATA_PEDIDO;




























select COD_CLIENTE,(CAST(DATA_PEDIDO as DATE)), sum(valor_total)

FROM tb_carrinho

WHERE DATE_FORMAT(DATA_PEDIDO,'%Y') = 2022 AND
      STATU = 'ENTREGUE'

group BY COD_CLIENTE,(CAST(DATA_PEDIDO as DATE))


