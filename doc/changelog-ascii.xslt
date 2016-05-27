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
    <xsl:text>   Version </xsl:text>
    <xsl:value-of select="@version"/>

    <xsl:for-each select="datetime">
      <xsl:text> -- </xsl:text>
      <xsl:call-template name="print-month-name">
        <xsl:with-param name="month-number" select="@month"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="@day"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="@year"/>
    </xsl:for-each>
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates select="logentry"/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="logentry">
    <xsl:call-template name="output-char">
      <xsl:with-param name="char" select="' '"/>
      <xsl:with-param name="count" select="$line-left-margin - 2"/>
    </xsl:call-template>
    <xsl:text>- </xsl:text>
    <xsl:call-template name="wrap-line">
      <xsl:with-param name="line">
        <xsl:apply-templates/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template name="wrap-line">
    <xsl:param name="iteration-depth" select="0"/>
    <xsl:param name="line"/>
    <xsl:choose>
      <xsl:when test="contains($line, '&#10;')
        and string-length(substring-before($line, '&#10;')) &lt; $line-size">
        <xsl:value-of select="substring-before($line, '&#10;')"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:call-template name="output-left-margin"/>
        <xsl:call-template name="wrap-line">
          <xsl:with-param name="line"
            select="substring-after($line, '&#10;')"/>
          <xsl:with-param name="iteration-depth"
            select="$iteration-depth + 1"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="string-length($line) &lt; $line-size">
        <xsl:value-of select="$line"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="current-line">
          <xsl:value-of select="substring($line, 1, $line-size)"/>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="contains($current-line, ' ')">
            <xsl:variable name="last-space-index">
              <xsl:call-template name="last-space-index">
                <xsl:with-param name="string" select="$current-line"/>
                <xsl:with-param name="current-index"
                  select="string-length($current-line)"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:value-of
              select="substring($current-line, 1, $last-space-index - 1)"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:call-template name="output-left-margin"/>
            <xsl:call-template name="wrap-line">
              <xsl:with-param name="line"
                select="substring($line, $last-space-index + 1)"/>
              <xsl:with-param name="iteration-depth"
                select="$iteration-depth + 1"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$line"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="output-left-margin">
    <xsl:call-template name="output-char">
      <xsl:with-param name="char" select="' '"/>
      <xsl:with-param name="count" select="$line-left-margin"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="output-char">
    <xsl:param name="char"/>
    <xsl:param name="count"/>
    <xsl:if test="$count > 0">
      <xsl:value-of select="$char"/>
      <xsl:call-template name="output-char">
        <xsl:with-param name="char" select="$char"/>
        <xsl:with-param name="count" select="$count - 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="last-space-index">
    <xsl:param name="string"/>
    <xsl:param name="current-index"/>
    <xsl:choose>
      <xsl:when test="substring($string, $current-index, 1) = ' '">
        <xsl:value-of select="$current-index"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="last-space-index">
          <xsl:with-param name="string" select="$string"/>
          <xsl:with-param name="current-index" select="$current-index - 1"/>
        </xsl:call-template>
      </xsl:otherwise>
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
      <xsl:with-param name="text">
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text">
            <xsl:call-template name="string-replace-all">
              <xsl:with-param name="text"
                select="translate(., '“”', '&quot;&quot;')" />
              <xsl:with-param name="replace" select="'–'" />
              <xsl:with-param name="by" select="'--'" />
            </xsl:call-template>
          </xsl:with-param>
          <xsl:with-param name="replace" select="'≥'" />
          <xsl:with-param name="by" select="'&gt;='" />
        </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="replace" select="'≤'" />
      <xsl:with-param name="by" select="'&lt;='" />
    </xsl:call-template>
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
</xsl:stylesheet>

