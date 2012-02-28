<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
	method="xml"
	version="1.0"
	encoding="UTF-8"
	omit-xml-declaration="no"
	standalone="yes"
	indent="yes" />

<xsl:strip-space elements="*"/>
<xsl:preserve-space elements="strings string"/>

<xsl:param name="refurl" select="'../../language/English/strings.xml'"/>
<xsl:param name="transurl" select="'../../language/German/strings.xml'"/>

<xsl:variable name="refdoc" select="document($refurl)"/>
<xsl:variable name="transdoc" select="document($transurl)"/>

<xsl:template match="/">
	<strings>
		<xsl:apply-templates select="$transdoc/strings/string[@id = $refdoc//string/@id]" />
		
		<xsl:comment>
			====================
			UNNEEDED TRANSLATION
			====================

			the following strings are defined in the translation but are never used in the reference
		</xsl:comment>
		<xsl:apply-templates select="$transdoc/strings/string[not(@id = $refdoc//string/@id)]" />




		<xsl:comment>
			===================
			MISSING TRANSLATION
			===================

			the following strings are missing from the translation
		</xsl:comment>
		<xsl:apply-templates select="$refdoc/strings/string[not(@id = $transdoc//string/@id)]" />
	</strings>
</xsl:template>

<xsl:template match="string">
	<xsl:copy-of select="."/>
</xsl:template>

</xsl:stylesheet>
