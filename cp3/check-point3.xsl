<!-- <?xml version="1.0"?>
<goods>
    Всего элементов: 7
    <computer>Intel Core Duo</computer>
    <monitor>Dell 23'</monitor>
    <computer>Intel Core i5</computer>
    <computer>Intel Core i7</computer>
    <printer>LBP 2900</printer>
    <monitor>HP 21'</monitor>
    <printer>Canon 3211</printer>
</goods> -->

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <goods>
        <xsl:comment>Всего элементов: <xsl:value-of select="count(items/element)"/></xsl:comment>
        <xsl:apply-templates select="items/element"/>
    </goods>
  </xsl:template>

  <xsl:template match="element[@name]">
    <xsl:element name="{@name}">
        <xsl:value-of select="@value"/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>