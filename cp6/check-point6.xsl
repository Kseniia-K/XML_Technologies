<!-- Документ представляет собой часть листинга обмена сообщениями между пользователями.
Порядок расположения элементов item не важен, они могут находиться в любом порядке.
Значения атрибутов id тоже не важны, они могут быть любыми числами.
Важен атрибут parentid - по нему определяется, кто кому отвечает. 
Элемент с parentid="0" - топикстартер. В данном примере он один, но их может быть несколько и находиться они могут на любой позиции.
В других элементах item атрибут parentid указывает на id другого элемента item. Например, item c parentid="5" отвечает элементу item c id="5".
 
Напишите преобразование для данного документа в HTML-документ, в котором обмен сообщениями представлен html-списками с правильной вложенностью: -->
<!-- Подсказка: помните о рекурсии! -->

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:variable name="chatInitiator" select="items/item[@parentid = '0']"/>

  <xsl:template match="/">
    <html lang="en">
        <head>
            <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
            <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Chat</title>
        </head>
        <body>
            <xsl:apply-templates select="$chatInitiator"/>
        </body>
      </html>
  </xsl:template>
  
  <xsl:template match="item">
        <xsl:if test="../item">
            <ul>
                <li>
                    <b><xsl:value-of select="@author"/></b> пишет: <xsl:value-of select="."/>
                    <xsl:apply-templates select="../item[@parentid = current()/@id]"/>
                </li>
            </ul>
        </xsl:if>
   </xsl:template>
</xsl:stylesheet>