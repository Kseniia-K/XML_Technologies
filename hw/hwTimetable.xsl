<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/timeTable">
        Комплекс Курская: всего занятий
        <xsl:value-of select="count(lessons/lesson[@complex = 'КУ'])"/>
        Комплекс ВДНХ: всего занятий
        <xsl:value-of select="count(lessons/lesson[@complex = 'ВТ'])"/>
        Занятий в 10:00
        <xsl:value-of select="count(lessons/lesson/time[. = '10:00'])"/>
        Занятий в 15:30
        <xsl:value-of select="count(lessons/lesson/time[. = '15:30'])"/>
        Занятий в 17:20
        <xsl:value-of select="count(lessons/lesson/time[. = '17:20'])"/>
        Первое занятие:
        <xsl:value-of select="lessons/lesson[1]/thema"/> состоялось 
        <xsl:value-of select="lessons/lesson[1]/date"/>
        Последнее занятие:
        <xsl:value-of select="lessons/lesson[last()]/thema"/> состоялось
        <xsl:value-of select="lessons/lesson[last()]/date"/>
        Занятий по DTD
        <xsl:value-of select="count(lessons/lesson[contains(thema, 'DTD')])"/>
        Чётных занятий на Курской
        <xsl:value-of select="count(lessons/lesson[@complex = 'КУ'][@no mod 2 = 0])"/>
        Нечётных занятий на ВДНХ
        <xsl:value-of select="count(lessons/lesson[@complex = 'ВТ'][@no mod 2 != 0])"/>
    </xsl:template>
</xsl:stylesheet>