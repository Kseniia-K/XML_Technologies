<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:key name="ixCity" match="item" use="@city"></xsl:key>
  <xsl:key name="ixOrg" match="item" use="concat(@org, '+', @city)"></xsl:key>

  <xsl:template match="/">
      <html lang="en">
            <head>
                <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Groups</title>
            </head>
            <body>
                <h1>Города и компании</h1>
                <ul>
                  <xsl:for-each select="/orgs/item[generate-id() = generate-id(key('ixCity', @city))]">
                    <li>
                      <h3><xsl:value-of select="@city"/></h3>
                      <p>Всего товаров: <xsl:value-of select="count(key('ixCity', @city))"/></p>
                      <ul>
                        <xsl:for-each select="key('ixCity', @city)[generate-id() = generate-id(key('ixOrg', concat(@org, '+', @city)))]">
                          <li>
                            <h4><xsl:value-of select="@org"/></h4>
                            <p>Всего товаров: <xsl:value-of select="count(key('ixOrg', concat(@org, '+', @city)))"/></p>
                            <ul>
                              <xsl:for-each select="key('ixOrg', concat(@org, '+', @city))">
                                <li>
                                    <xsl:value-of select="@title"/>
                                </li>
                              </xsl:for-each>
                            </ul>
                          </li>
                        </xsl:for-each>
                      </ul>
                    </li>
                  </xsl:for-each>
                </ul>
              </body> 
            </html>
  </xsl:template>
</xsl:stylesheet>