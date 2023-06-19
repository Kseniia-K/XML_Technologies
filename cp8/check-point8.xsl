<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="ixCity" match="/orgs/item/@city" use="."/>
    <xsl:key name="ixOrg" match="/orgs/item/@org" use="."/>

  <xsl:template match="/">
    <html lang="en">
        <head>
            <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
            <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Groups</title>
        </head>
        <body>
            <xsl:variable name="cities" select="/orgs/item/@city[generate-id(.)=generate-id(key('ixCity', .))]"/>
            
            <h1>Города и компании</h1>
            <ul>
                <xsl:for-each select="$cities">
                <xsl:variable name="city" select="."/>
                    <li>
                        <xsl:value-of select="$city"/>
                        <ul>
                            <xsl:for-each select="key('ixCity', $city)/../@org[generate-id(.)=generate-id(key('ixOrg', .))]">
                            <xsl:variable name="org" select="."/>
                                <li>
                                    <xsl:value-of select="$org"/>
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


<!-- <?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="ixCity" match="/orgs/item/@city" use="."/>
    <xsl:key name="ixOrg" match="/orgs/item/@org" use="."/>

  <xsl:template match="/">
    <html lang="en">
        <head>
            <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
            <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Groups</title>
        </head>
        <body>
            <xsl:variable name="cities" select="/orgs/item/@city[generate-id(.)=generate-id(key('ixCity', .))]"/>
            <!--<xsl:variable name="orgs" select="/orgs/item/@org[generate-id(.)=generate-id(key('ixOrg', .))]"/>-->
            
            <h1>Города и компании</h1>
            <ul>
                <xsl:for-each select="$cities">
                <xsl:variable name="city" select="."/>
                    <li>
                        <xsl:value-of select="$city"/>
                        <ul>
                            <xsl:for-each select="key('ixCity', $city)/../@org">
                            <xsl:variable name="org" select="."/>
                                <li>
                                    <xsl:value-of select="$org[generate-id(.)=generate-id(key('ixOrg', .))]"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </xsl:for-each>
            </ul>
        </body>
    </html>
  </xsl:template>
</xsl:stylesheet> -->




<!-- <?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="ixCity" match="/orgs/item/@city" use="."/>
    <xsl:key name="ixOrg" match="/orgs/item/@org" use="."/>

  <xsl:template match="/">
    <html lang="en">
        <head>
            <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
            <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Groups</title>
        </head>
        <body>
            <xsl:variable name="cities" select="/orgs/item/@city[generate-id(.)=generate-id(key('ixCity', .))]"/>
            <xsl:variable name="orgs" select="/orgs/item/@org[generate-id(.)=generate-id(key('ixOrg', .))]"/>
            
            <h1>Города и компании</h1>
            <ul>
                <xsl:for-each select="$cities">
                <xsl:variable name="city" select="."/>
                    <li>
                        <xsl:value-of select="$city"/>
                        <ul>
                            <xsl:for-each select="key('ixCity', $city)/../@org">
                                <li>
                                     <xsl:value-of select="."/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </xsl:for-each>
            </ul>
        </body>
    </html>
  </xsl:template>
</xsl:stylesheet> -->


<!-- 
    <?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="ixCity" match="/orgs/item/@city" use="."/>
    <xsl:key name="ixOrg" match="/orgs/item/@org" use="."/>

  <xsl:template match="/">
    <html lang="en">
        <head>
            <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
            <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Groups</title>
        </head>
        <body>
            <xsl:variable name="cities" select="/orgs/item/@city[generate-id(.)=generate-id(key('ixCity', .))]"/>
            
            <h1>Города и компании</h1>
            <ul>
                <xsl:for-each select="$cities">
                <xsl:variable name="city" select="."/>
                    <li>
                        <xsl:value-of select="$city"/>
                        <ul>
                            <xsl:variable name="orgs" select="$city/../@org[generate-id(.)=generate-id(key('ixOrg', .))]"/>
                            <xsl:for-each select="key('ixCity', .)/$orgs">
                                <li>
                                     <xsl:value-of select="."/>
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
 -->