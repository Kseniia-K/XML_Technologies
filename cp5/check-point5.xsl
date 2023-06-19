<!-- Напишите преобразование для xml-документа в html-документ, которое

Выводит названия всеx курсов, которые читает преподаватель Борисов И.О.
Выводит названия всеx курсов, в которых рассматривается тема XML
Выводит названия всеx курсов, которые читает преподаватель Борисов И.О., и в которых есть тема XSLT
 
Формат html-документа может быть таким:
<h1>Наши курсы</h1>
<h3>Курсы, которые читает Борисов И.О.</h3>
<ul>
    <li>.XML технологии</li>
	<li>Веб-разработка</li>
	<li>Программирование на PHP</li>
</ul>
<h3>Курсы, которые используют XML</h3>
<ul>
    <li>.XML технологии</li>
    <li>Программирование на PHP</li>
</ul>
и т. п.
 
Подсказки.
 
Для первых двух заданий вам нужно будет создать нужный ключ (есть несколько вариантов, единственно правильного нет).
Для третьего задания вам захочется создать составной ключ (по ключевым словам и преподавателям), а этого сделать нельзя. Сначала сделайте выборку по ключу (любому из уже имеющихся), а уже результат этой выборки отфильтруйте предикатом. -->

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:key name="ixTeacher" match="/courses/course/teachers/teacher" use="."/>
  <xsl:key name="ixXML" match="/courses/course/keywords/keyword" use="."/> 
  
  <xsl:template match="/">
    <html lang="en">
      <head>
          <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
          <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
          <title>Keys</title>
      </head>
      <body>
        <h1>Наши курсы</h1>
        <h3>Курсы, которые читает Борисов И.О.:</h3>
          <ul>
              <xsl:for-each select="key('ixTeacher', 'Борисов И.О.')">
                <li><xsl:value-of select="../../title"/></li>
              </xsl:for-each>
          </ul>
         <h3>Курсы, которые используют XML:</h3>
          <ul>
              <xsl:for-each select="key('ixXML', 'XML')">
                <li><xsl:value-of select="../../title"/></li>
              </xsl:for-each>
          </ul> 
         <h3>Курсы, которые читает Борисов И.О., и в которых есть тема XSLT:</h3> 
          <ul>
              <xsl:for-each select="key('ixXML', 'XSLT')">
                <li><xsl:value-of select="../../title[../teachers[teacher = 'Борисов И.О.']]"/></li>
              </xsl:for-each>
          </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>