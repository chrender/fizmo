<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output
    method="text"
    indent="no"
    encoding="UTF-8"
    omit-xml-declaration="no" />

  <xsl:template match="/document">
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="section">
    <xsl:if test="@title">
      <xsl:text>**</xsl:text>
      <xsl:value-of select="@title"/>
      <xsl:text>**&#10;&#10;</xsl:text>
    </xsl:if>
    <xsl:apply-templates/>
    <xsl:if test="following-sibling::section">
      <xsl:text>&#10;---&#10;&#10;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="p">
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="ul | ol">
    <xsl:text>&#10;&#10;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="li">
    <xsl:choose>
      <xsl:when test="name(ancestor::*[1]) = 'ul'">
        <xsl:text> - </xsl:text>
      </xsl:when>
      <xsl:when test="name(ancestor::*[1]) = 'ol'">
        <xsl:text> 1. </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>   </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="i">
    <xsl:text>_</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>_</xsl:text>
  </xsl:template>

  <xsl:template match="a">
    <xsl:variable name="inline-content">
      <xsl:apply-templates/>
    </xsl:variable>
    <xsl:text>[</xsl:text>
    <xsl:choose>
      <xsl:when test="$inline-content != ''">
        <xsl:value-of select="$inline-content"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@href"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>]</xsl:text>
    <xsl:text>(</xsl:text>
    <xsl:value-of select="@href"/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="tt">
    <xsl:text>`</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>`</xsl:text>
  </xsl:template>

  <xsl:template match="br">
    <xsl:text>  &#10;</xsl:text>
    <xsl:for-each select="ancestor::ul">
      <xsl:text>   </xsl:text>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="text()">
    <xsl:if test="normalize-space() != ''">
      <xsl:choose>
        <xsl:when test="contains(., '&#10;')">
          <xsl:call-template name="join-lines">
            <xsl:with-param name="output" select="."/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="join-lines">
    <xsl:param name="output"/>
    <xsl:choose>
      <xsl:when test="contains($output, '&#10;')">
        <xsl:value-of select="substring-before($output, '&#10;')"/>
        <xsl:text> </xsl:text>
        <xsl:call-template name="join-lines">
          <xsl:with-param name="output">
            <xsl:value-of select="substring-after($output, '&#10;')"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$output"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>

