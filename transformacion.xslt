<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>Detalle del Pedido</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
          }
          .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
          }
          h1 {
            color: #333;
            text-align: center;
          }
          h2 {
            color: #333;
            margin-top: 30px;
          }
          table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
          }
          th, td {
            border-bottom: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
          .product-table th, .product-table td {
            border-bottom: none;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Detalle del Pedido</h1>
          <xsl:apply-templates select="//pedido"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="pedido">
    <div>
      <h2>Pedido</h2>
      <table>
        <tr>
          <th colspan="2">Detalles del Pedido</th>
        </tr>
        <xsl:apply-templates select="detalle_pedido"/>
        <xsl:apply-templates select="cliente"/>
      </table>

      <h2>Productos</h2>
      <table class="product-table">
        <tr>
          <th>Nombre</th>
          <th>Referencia</th>
          <th>Precio</th>
          <th>Unidades</th>
        </tr>
        <xsl:apply-templates select="detalle_pedido/productos/producto"/>
      </table>
    </div>
  </xsl:template>

  <xsl:template match="detalle_pedido|cliente">
    <xsl:for-each select="*">
      <tr>
        <td><xsl:value-of select="local-name()"/></td>
        <td><xsl:value-of select="."/></td>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="producto">
    <tr>
      <td><xsl:value-of select="nombre"/></td>
      <td><xsl:value-of select="referencia"/></td>
      <td><xsl:value-of select="precio"/></td>
      <td><xsl:value-of select="unidades"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>

