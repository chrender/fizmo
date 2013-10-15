<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output
    method="text"
    indent="no"
    encoding="UTF-8"
    omit-xml-declaration="no" />

  <xsl:variable name="line-size" select="75"/>
  <xsl:variable name="line-left-margin" select="3"/>

  <xsl:template match="/changelog">
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates select="change"/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="change">
    <xsl:text>&#10;&#10;</xsl:text>
    <xsl:text>   **Version </xsl:text>
    <xsl:value-of select="@version"/>
    <xsl:for-each select="datetime">
      <xsl:text> — </xsl:text>
      <xsl:call-template name="print-month-name">
        <xsl:with-param name="month-number" select="@month"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="@day"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="@year"/>
    </xsl:for-each>
    <xsl:text>**&#10;&#10;</xsl:text>
    <xsl:apply-templates select="logentry"/>
    <xsl:text>&#10;</xsl:text>
    <xsl:if test="following-sibling::change">
      <xsl:text>---&#10;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="logentry">
    <xsl:text> - </xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template name="print-month-name">
    <xsl:param name="month-number"/>
    <xsl:choose>
      <xsl:when test="$month-number = 1">
        <xsl:text>January</xsl:text>
      </xsl:when>
      <xsl:when test="$month-number = 2">
        <xsl:text>Febuary</xsl:text>
      </xsl:when>
      <xsl:when test="$month-number = 3">
        <xsl:text>March</xsl:text>
      </xsl:when>
      <xsl:when test="$month-number = 4">
        <xsl:text>April</xsl:text>
      </xsl:when>
      <xsl:when test="$month-number = 5">
        <xsl:text>May</xsl:text>
      </xsl:when>
      <xsl:when test="$month-number = 6">
        <xsl:text>June</xsl:text>
      </xsl:when>
      <xsl:when test="$month-number = 7">
        <xsl:text>July</xsl:text>
      </xsl:when>
      <xsl:when test="$month-number = 8">
        <xsl:text>August</xsl:text>
      </xsl:when>
      <xsl:when test="$month-number = 9">
        <xsl:text>September</xsl:text>
      </xsl:when>
      <xsl:when test="$month-number = 10">
        <xsl:text>October</xsl:text>
      </xsl:when>
      <xsl:when test="$month-number = 11">
        <xsl:text>November</xsl:text>
      </xsl:when>
      <xsl:when test="$month-number = 12">
        <xsl:text>December</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text"
            select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace" />
          <xsl:with-param name="by" select="$by" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="text()">
    <xsl:call-template name="string-replace-all">
      <xsl:with-param name="text" select="."/>
      <xsl:with-param name="replace" select="'*'" />
      <xsl:with-param name="by">
        <xsl:text>\*</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>

