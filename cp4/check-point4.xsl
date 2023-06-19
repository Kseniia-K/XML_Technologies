<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Table</title>
        <style>
          table, td, th {
            border-style: solid;
          }
        </style>
    </head>
    <body>
        <table>
            <tr>
              <th colspan="2">Всего элементов: <xsl:value-of select="count(items/element)"/></th>
            </tr>
            <tr>
                <th>Тип</th>
                <th>Наименование</th>
            </tr>
            <xsl:apply-templates select="items/element"/>
        </table>
    </body>
    </html>
  </xsl:template>

  <xsl:template match="element">
    <tr>
      <xsl:if test="position() mod 2 = 0">
        <xsl:attribute name="style">background-color: lightgray</xsl:attribute>
      </xsl:if>
      <td><xsl:value-of select="@name"/></td>
      <td><xsl:value-of select="@value"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>