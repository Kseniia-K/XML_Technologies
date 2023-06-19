<!-- Напишите преобразование, которое из данного документа создаёт документ следующего вида: -->

<!-- <?xml version="1.0" encoding="UTF-8"?>
<items>
	<item id="1" parentid="0" author="Вася Пупкин">Привет всем!</item>
	<item id="2" parentid="1" author="Федя Сумкин">Ну, привет</item>
	<item id="3" parentid="2" author="Вова Морковкин">Не ну, а Привет!</item>
	<item id="4" parentid="2" author="Петя Зайцев">Чё так не весело?</item>
	<item id="5" parentid="4" author="Зина Корзинкина">Может у него настроение плохое</item>
	<item id="6" parentid="5" author="Петя Зайцев">Я просто спросил</item>
	<item id="7" parentid="1" author="Вова Морковкин">И тебе привет! Как дела?</item>
	<item id="8" parentid="7" author="Вася Пупкин">Ничё так.</item>
</items> -->

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <items>
        <xsl:apply-templates select="ul"/>
    </items>
  </xsl:template>
  
  <xsl:template match="ul">
        <xsl:if test="../ul">
            <xsl:apply-templates select="li"/>
        </xsl:if>
   </xsl:template>
  
  <xsl:template match="li">
        <xsl:if test="../li">
            <item>
                <xsl:attribute name="id"><xsl:value-of select="@data-id"/></xsl:attribute>
                <xsl:choose>
                    <xsl:when test="../../../current()/@data-id">
                        <xsl:attribute name="parentid"><xsl:value-of select="../../@data-id"/></xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="parentid">0</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:attribute name="author"><xsl:value-of select="b"/></xsl:attribute>
                <xsl:value-of select="span"/>
            </item>
            <xsl:apply-templates select="ul"/>
        </xsl:if>
   </xsl:template>
</xsl:stylesheet>