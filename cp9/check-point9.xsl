<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/sum-of-sequence">
    <xsl:call-template name="while">
      <xsl:with-param name="start" select="/sum-of-sequence/from"/>
      <xsl:with-param name="from" select="/sum-of-sequence/from"/>
      <xsl:with-param name="to" select="/sum-of-sequence/to"/>
      <xsl:with-param name="i" select="0"/>
      <xsl:with-param name="sum" select="0"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="while">
    <xsl:param name="start"/>
    <xsl:param name="from"/>
    <xsl:param name="to"/>
    <xsl:param name="i"/>
    <xsl:param name="sum"/>

    <xsl:choose>
      <xsl:when test="$i != $to - $start + 1">
        <xsl:call-template name="while">
          <xsl:with-param name="start" select="$start"/>
          <xsl:with-param name="from" select="$from + 1"/>
          <xsl:with-param name="to" select="$to"/>
          <xsl:with-param name="i" select="$i + 1"/>
          <xsl:with-param name="sum" select="$sum + $from"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$sum"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>


<!-- <?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/factorial-of">
    <xsl:call-template name="while">
      <xsl:with-param name="i" select="."/>
      <xsl:with-param name="sum" select="1"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="while">
    <xsl:param name="i"/>
    <xsl:param name="sum"/>

    <xsl:choose>
      <xsl:when test="$i != 0">
        <xsl:call-template name="while">
          <xsl:with-param name="i" select="$i - 1"/>
          <xsl:with-param name="sum" select="$sum * $i"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$sum"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet> -->


<!-- <?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <xsl:call-template name="for">
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="for">
    <xsl:param name="from" select="sum-of-sequence/from"/>
    <xsl:param name="to" select="sum-of-sequence/to"/>
    <xsl:param name="res" select="1"/>
    <xsl:param name="i" select="1"/>

  <xsl:if test="$from &lt; $to">
    <xsl:call-template name="for">
      <xsl:with-param name="from" select="$from + ($i + $from)">
      <xsl:with-param name="to" select="$to">
      <xsl:with-param name="res" select="$from">
      <xsl:with-param name="from" select="$from + 1">
    </xsl:call-template>
  </xsl:if>
  </xsl:template>
</xsl:stylesheet> -->