<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:exslt="http://exslt.org/common"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output
    method="text"
    indent="no"
    encoding="UTF-8"
    omit-xml-declaration="no" />

  <xsl:variable name="default-line-size" select="75"/>
  <xsl:variable name="default-left-margin" select="3"/>

  <xsl:variable name="inline-elements">
    <br/> <i/> <b/> <tt/> <a/>
  </xsl:variable>

  <xsl:variable name="block-elements">
    <section/> <p/> <ul/> <ol/> <li/> <code/>
  </xsl:variable>

  <xsl:template name="process-elements">
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:param name="node-index" select="1"/>
    <xsl:param name="inline-content"/>
    <xsl:param name="bullet-content"/>
    <xsl:param name="no-wrapping"/>
    <xsl:choose>
      <xsl:when test="not(node()[position() = $node-index])">
        <!-- No more childs for current element, flush output. -->
        <xsl:if test="string-length(normalize-space($inline-content)) != 0">
          <xsl:choose>
            <xsl:when test="$no-wrapping = 'true'">
              <xsl:value-of select="$inline-content"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="output-left-margin">
                <xsl:with-param name="left-margin" select="$left-margin"/>
              </xsl:call-template>
              <xsl:value-of select="$bullet-content"/>
              <xsl:call-template name="wrap-line">
                <xsl:with-param name="line-size"
                  select="$line-size - string-length($bullet-content)"/>
                <xsl:with-param name="left-margin"
                  select="$left-margin + string-length($bullet-content)"/>
                <xsl:with-param name="output" select="$inline-content"/>
              </xsl:call-template>
              <xsl:text>&#10;</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:when>
      <xsl:when test="node()[position() = $node-index][self::text()]">
        <!--
        In case we've got a text node we can start processing inline
        elements right away.
        -->
        <xsl:variable name="new-output">
          <xsl:apply-templates select="node()[position() = $node-index]">
            <xsl:with-param name="line-size" select="$line-size"/>
            <xsl:with-param name="left-margin" select="$left-margin"/>
          </xsl:apply-templates>
        </xsl:variable>
        <xsl:call-template name="process-elements">
          <xsl:with-param name="line-size" select="$line-size"/>
          <xsl:with-param name="left-margin" select="$left-margin"/>
          <xsl:with-param name="node-index" select="$node-index + 1"/>
          <xsl:with-param name="inline-content"
            select="concat($inline-content, $new-output)"/>
          <xsl:with-param name="bullet-content" select="$bullet-content"/>
          <xsl:with-param name="no-wrapping" select="$no-wrapping"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <!--
        Else we have to find out what kind of type to process by looking
        at the node name.
        -->
        <xsl:variable name="next-node-name"
          select="name(node()[position() = $node-index])"/>
        <xsl:variable name="next-node-is-inline-element">
          <xsl:for-each select="exslt:node-set($inline-elements)/*">
            <xsl:if test="name() = $next-node-name">
              <xsl:text>true</xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>

        <xsl:if test="$next-node-is-inline-element = 'true'">
          <!-- We're still processing inline content. -->
          <xsl:variable name="new-output">
            <xsl:apply-templates select="node()[position() = $node-index]">
              <xsl:with-param name="line-size" select="$line-size"/>
              <xsl:with-param name="left-margin" select="$left-margin"/>
            </xsl:apply-templates>
          </xsl:variable>
          <xsl:call-template name="process-elements">
            <xsl:with-param name="line-size" select="$line-size"/>
            <xsl:with-param name="left-margin" select="$left-margin"/>
            <xsl:with-param name="node-index" select="$node-index + 1"/>
            <xsl:with-param name="inline-content"
              select="concat($inline-content, $new-output)"/>
            <xsl:with-param name="bullet-content" select="$bullet-content"/>
            <xsl:with-param name="no-wrapping" select="$no-wrapping"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:variable name="next-node-is-block-element">
          <xsl:for-each select="exslt:node-set($block-elements)/*">
            <xsl:if test="name() = $next-node-name">
              <xsl:text>true</xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>

        <xsl:if test="$next-node-is-block-element = 'true'">
          <!-- We're new processing a new block. -->
          <xsl:if test="string-length(normalize-space($inline-content)) != 0">
            <xsl:choose>
              <xsl:when test="$no-wrapping = 'true'">
                <xsl:value-of select="$inline-content"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="output-left-margin">
                  <xsl:with-param name="left-margin" select="$left-margin"/>
                </xsl:call-template>
                <xsl:value-of select="$bullet-content"/>
                <xsl:call-template name="wrap-line">
                  <xsl:with-param name="line-size" select="$line-size"/>
                  <xsl:with-param name="left-margin" select="$left-margin"/>
                  <xsl:with-param name="output" select="$inline-content"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
          <xsl:apply-templates select="node()[position() = $node-index]">
            <xsl:with-param name="line-size" select="$line-size"/>
            <xsl:with-param name="left-margin" select="$left-margin"/>
          </xsl:apply-templates>
          <xsl:call-template name="process-elements">
            <xsl:with-param name="line-size" select="$line-size"/>
            <xsl:with-param name="left-margin" select="$left-margin"/>
            <xsl:with-param name="node-index" select="$node-index + 1"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="$next-node-is-inline-element != 'true'
          and $next-node-is-block-element != 'true'">
          <xsl:text>&#10;UNKNOWN NODE ENCOUNTERED.&#10;&#10;</xsl:text>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="/document">
    <xsl:variable name="effective-margin">
      <xsl:choose>
        <xsl:when test="code">
          <xsl:value-of select="number(0)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="number($default-left-margin)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="@title">
      <xsl:text>&#10;&#10;</xsl:text>
      <xsl:call-template name="output-left-margin">
        <xsl:with-param name="left-margin" select="$effective-margin"/>
      </xsl:call-template>
      <xsl:value-of select="@title"/>
      <xsl:text>&#10;</xsl:text>
      <xsl:if test="@date">
        <xsl:call-template name="output-left-margin">
          <xsl:with-param name="left-margin" select="$effective-margin"/>
        </xsl:call-template>
        <xsl:value-of select="@date"/>
        <xsl:text>&#10;</xsl:text>
      </xsl:if>
      <xsl:text>&#10;&#10;</xsl:text>
    </xsl:if>
    <xsl:call-template name="process-elements">
      <xsl:with-param name="line-size" select="$default-line-size"/>
      <xsl:with-param name="left-margin" select="$effective-margin"/>
    </xsl:call-template>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="section">
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:if test="@title">
      <xsl:text>&#10;</xsl:text>
      <xsl:call-template name="output-left-margin">
        <xsl:with-param name="left-margin" select="$left-margin"/>
      </xsl:call-template>
      <xsl:value-of select="translate(@title,
        'abcdefghijklmnopqrstuvwxyz',
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
      <xsl:text>&#10;</xsl:text>
    </xsl:if>
    <xsl:call-template name="process-elements">
      <xsl:with-param name="line-size" select="$line-size"/>
      <xsl:with-param name="left-margin" select="$left-margin"/>
    </xsl:call-template>
    <xsl:if test="following-sibling::section">
      <xsl:text>&#10;</xsl:text>
      <xsl:call-template name="output-left-margin">
        <xsl:with-param name="left-margin" select="$left-margin"/>
      </xsl:call-template>
      <xsl:text>---&#10;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="p">
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:text>&#10;</xsl:text>
    <xsl:call-template name="process-elements">
      <xsl:with-param name="line-size" select="$line-size"/>
      <xsl:with-param name="left-margin" select="$left-margin"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="code">
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:text>&#10;</xsl:text>
    <xsl:variable name="margin-content">
      <xsl:call-template name="output-left-margin">
        <xsl:with-param name="left-margin" select="$left-margin"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="$margin-content"/>
    <xsl:call-template name="string-replace-all">
      <xsl:with-param name="text" select="."/>
      <xsl:with-param name="replace" select="'&#10;'" />
      <xsl:with-param name="by">
        <xsl:text>&#10;</xsl:text>
        <xsl:value-of select="$margin-content"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="ul | ol">
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:text>&#10;</xsl:text>
    <!--<xsl:text>&#10;</xsl:text>-->
    <xsl:call-template name="process-elements">
      <xsl:with-param name="line-size" select="$line-size"/>
      <xsl:with-param name="left-margin" select="$left-margin"/>
    </xsl:call-template>
  </xsl:template>

  <!--
  <xsl:template name="repeat-char">
    <xsl:param name="char"/>
    <xsl:param name="count"/>
    <xsl:if test="$count &gt; 0">
      <xsl:value-of select="$char"/>
      <xsl:call-template name="repeat-char">
        <xsl:with-param name="char" select="$char"/>
        <xsl:with-param name="count" select="$count - 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  -->

  <xsl:template name="left-pad-string">
    <xsl:param name="string"/>
    <xsl:param name="size"/>
    <xsl:choose>
      <xsl:when test="string-length($string) &lt; $size">
        <xsl:call-template name="left-pad-string">
          <xsl:with-param name="string" select="concat(' ', $string)"/>
          <xsl:with-param name="size" select="$size"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$string"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="li">
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:variable name="depth" select="count(ancestor::ul|ancestor::ol)"/>
    <xsl:variable name="bullet-string">
      <xsl:choose>
        <xsl:when test="name(ancestor::*[1]) = 'ul'">
          <xsl:text> - </xsl:text>
        </xsl:when>
        <xsl:when test="name(ancestor::*[1]) = 'ol'">
          <xsl:variable name="item-count" select="count(../li)"/>
          <xsl:text> </xsl:text>
          <xsl:call-template name="left-pad-string">
            <xsl:with-param name="string"
              select="count(preceding-sibling::li) + 1"/>
            <xsl:with-param name="size"
              select="string-length(string($item-count))"/>
          </xsl:call-template>
          <xsl:text>. </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>   </xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="process-elements">
      <xsl:with-param name="line-size" select="$line-size"/>
      <xsl:with-param name="left-margin" select="$left-margin"/>
      <xsl:with-param name="bullet-content" select="$bullet-string"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="i">
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:call-template name="process-elements">
      <xsl:with-param name="line-size" select="$line-size"/>
      <xsl:with-param name="left-margin" select="$left-margin"/>
        <xsl:with-param name="no-wrapping" select="'true'"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="a">
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:variable name="inline-content">
      <xsl:call-template name="process-elements">
        <xsl:with-param name="line-size" select="$line-size"/>
        <xsl:with-param name="left-margin" select="$left-margin"/>
        <xsl:with-param name="no-wrapping" select="'true'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$inline-content != ''">
      <xsl:value-of select="$inline-content"/>
      <xsl:text> at </xsl:text>
    </xsl:if>
    <xsl:text></xsl:text>
    <xsl:value-of select="@href"/>
    <xsl:text></xsl:text>
  </xsl:template>

  <xsl:template match="tt">
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:text>“</xsl:text>
    <xsl:call-template name="process-elements">
      <xsl:with-param name="line-size" select="$line-size"/>
      <xsl:with-param name="left-margin" select="$left-margin"/>
      <xsl:with-param name="no-wrapping" select="'true'"/>
    </xsl:call-template>
    <xsl:text>”</xsl:text>
  </xsl:template>

  <xsl:template match="br">
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:text>&#10;</xsl:text>
    <!--
    <xsl:call-template name="output-left-margin">
      <xsl:with-param name="left-margin" select="$left-margin"/>
    </xsl:call-template>
    -->
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
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:if test="normalize-space() != ''">
      <xsl:call-template name="join-lines">
        <xsl:with-param name="output">
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
        </xsl:with-param>
      </xsl:call-template>
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

  <xsl:template name="wrap-line">
    <xsl:param name="line-size"/>
    <xsl:param name="left-margin"/>
    <xsl:param name="output"/>
    <xsl:param name="iteration-depth" select="0"/>
    <xsl:choose>
      <xsl:when test="contains($output, '&#10;')
        and string-length(substring-before($output, '&#10;')) &lt; $line-size">
        <xsl:value-of select="substring-before($output, '&#10;')"/>
        <xsl:text>&#10;</xsl:text>
        <!--<xsl:text>(</xsl:text>-->
        <xsl:call-template name="output-left-margin">
          <xsl:with-param name="left-margin" select="$left-margin"/>
        </xsl:call-template>
        <!--<xsl:text>)</xsl:text>-->
        <xsl:call-template name="wrap-line">
          <xsl:with-param name="line-size" select="$line-size"/>
          <xsl:with-param name="left-margin" select="$left-margin"/>
          <xsl:with-param name="output"
            select="substring-after($output, '&#10;')"/>
          <xsl:with-param name="iteration-depth"
            select="$iteration-depth + 1"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="string-length($output) &lt; $line-size">
        <!--
        {<xsl:value-of select="string-length($output)"/>}
        [<xsl:value-of select="$output"/>]
        -->
        <xsl:value-of select="$output"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="current-line">
          <xsl:value-of select="substring($output, 1, $line-size)"/>
        </xsl:variable>
        <xsl:variable name="shorter-current-line">
          <xsl:value-of select="substring($output, 1, $line-size - 1)"/>
        </xsl:variable>
        <xsl:variable name="last-space-index">
          <xsl:choose>
            <xsl:when test="contains($current-line, ' ')">
              <xsl:call-template name="last-char-index">
                <xsl:with-param name="string" select="$current-line"/>
                <xsl:with-param name="char" select="' '"/>
                <xsl:with-param name="current-index"
                  select="string-length($current-line)"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="0"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="last-slash-index">
          <xsl:choose>
            <xsl:when test="contains($shorter-current-line, '/')">
              <xsl:call-template name="last-char-index">
                <xsl:with-param name="string" select="$shorter-current-line"/>
                <xsl:with-param name="char" select="'/'"/>
                <xsl:with-param name="current-index"
                  select="string-length($shorter-current-line)"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="0"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="last-dash-index">
          <xsl:choose>
            <xsl:when test="contains($shorter-current-line, '-')">
              <xsl:call-template name="last-char-index">
                <xsl:with-param name="string" select="$shorter-current-line"/>
                <xsl:with-param name="char" select="'-'"/>
                <xsl:with-param name="current-index"
                  select="string-length($shorter-current-line)"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="0"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$last-space-index != 0
            and $last-space-index &gt;= $last-slash-index
            and $last-space-index &gt;= $last-dash-index">
            <xsl:value-of
              select="substring($current-line, 1, $last-space-index - 1)"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:call-template name="output-left-margin">
              <xsl:with-param name="left-margin" select="$left-margin"/>
            </xsl:call-template>
            <xsl:call-template name="wrap-line">
              <xsl:with-param name="line-size" select="$line-size"/>
              <xsl:with-param name="left-margin" select="$left-margin"/>
              <xsl:with-param name="output"
                select="substring($output, $last-space-index + 1)"/>
              <xsl:with-param name="iteration-depth"
                select="$iteration-depth + 1"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$last-slash-index != 0
            and $last-slash-index &gt; $last-space-index
            and $last-slash-index &gt;= $last-dash-index">
            <xsl:value-of
              select="substring($current-line, 1, $last-slash-index)"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:call-template name="output-left-margin">
              <xsl:with-param name="left-margin" select="$left-margin"/>
            </xsl:call-template>
            <xsl:call-template name="wrap-line">
              <xsl:with-param name="line-size" select="$line-size"/>
              <xsl:with-param name="left-margin" select="$left-margin"/>
              <xsl:with-param name="output"
                select="substring($output, $last-slash-index + 1)"/>
              <xsl:with-param name="iteration-depth"
                select="$iteration-depth + 1"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$last-dash-index != 0
            and $last-dash-index &gt; $last-space-index
            and $last-dash-index &gt;= $last-slash-index">
            <xsl:value-of
              select="substring($current-line, 1, $last-dash-index)"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:call-template name="output-left-margin">
              <xsl:with-param name="left-margin" select="$left-margin"/>
            </xsl:call-template>
            <xsl:call-template name="wrap-line">
              <xsl:with-param name="line-size" select="$line-size"/>
              <xsl:with-param name="left-margin" select="$left-margin"/>
              <xsl:with-param name="output"
                select="substring($output, $last-dash-index + 1)"/>
              <xsl:with-param name="iteration-depth"
                select="$iteration-depth + 1"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$output"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="output-left-margin">
    <xsl:param name="left-margin"/>
    <xsl:call-template name="output-char">
      <xsl:with-param name="char" select="' '"/>
      <xsl:with-param name="count" select="$left-margin"/>
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

  <xsl:template name="last-char-index">
    <xsl:param name="string"/>
    <xsl:param name="char"/>
    <xsl:param name="current-index"/>
    <xsl:choose>
      <xsl:when test="substring($string, $current-index, 1) = $char">
        <xsl:value-of select="$current-index"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="last-char-index">
          <xsl:with-param name="string" select="$string"/>
          <xsl:with-param name="char" select="$char"/>
          <xsl:with-param name="current-index" select="$current-index - 1"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>

