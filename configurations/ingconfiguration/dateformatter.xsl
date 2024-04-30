<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xsl:output method="text" />

<!-- Template to match the root node -->
<xsl:template match="/">
    <!-- Calculate the new date and time -->
    <xsl:value-of select="format-dateTime(
        current-dateTime(), 
        '[FNn,3-3], [D01] [MNn,3-3] [Y0001] [H01]:[m01]:[s01] GMT', 
        'en', 
        (), 
        'Etc/Greenwich'
    )" />
    
</xsl:template>

</xsl:stylesheet>