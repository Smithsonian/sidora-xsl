<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:fits="http://hul.harvard.edu/ois/xml/ns/fits/fits_output" xmlns:cpf="urn:isbn:1-931666-33-4" version="1.0">
    <xsl:param name="projectID" select="/cpf:eac-cpf/cpf:control/cpf:recordId"/>
<xsl:template match="/">
  <html>
  <body>
  <dl class="metadata-table">
      <xsl:for-each select="xml_root/debug">
    <dt>Debug</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:for-each>

      <xsl:for-each select="//cpf:recordId">
          <xsl:choose>          
          <xsl:when test="current()!='' and $projectID[starts-with(text(),'p')]">
              <dt>Project Id</dt><dd><xsl:value-of select="current()"/></dd>  
          </xsl:when>
          <xsl:when test="current()!='' and current()[starts-with(text(),'s')]">
              <dt>Sub-Project Id</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:when>
              <xsl:when test="current()!='' and current()[not(starts-with(text(),'s' or 'p'))]">
              <dt>Project Id</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:when>
          </xsl:choose>
      </xsl:for-each>

    <xsl:for-each select="//cpf:nameEntry[@localType='primary']/cpf:part">
        <xsl:choose>
        <xsl:when test="current()!='' and $projectID[starts-with(text(),'p')]">
                <dt>Project Name (Full)</dt><dd><xsl:value-of select="current()"/></dd>
            </xsl:when>
      
        <xsl:when test="current()!='' and $projectID[starts-with(text(),'s')]">
            <dt>Sub-Project Name</dt><dd><xsl:value-of select="current()"/></dd>  
        </xsl:when>
        <xsl:otherwise>
                <dt>Project Name</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:for-each>
      
    <xsl:for-each select="//cpf:nameEntry[@localType='abbreviation']/cpf:part">
        <xsl:choose>


        <xsl:when test="current()!='' and $projectID[starts-with(text(),'p')]">
            <dt>Project Name (Abbreviation)</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:when>
        <xsl:when test="current()!='' and $projectID[starts-with(text(),'s')]">
            <dt>Sub-Project Name (Abbreviation)</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:when>
        <xsl:otherwise>
            <dt>Project Name (Abbreviation)</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:for-each>
      
      <xsl:for-each select="//cpf:cpfDescription/cpf:description/cpf:functions/cpf:function">
        <xsl:if test="current()!=''">
            <dt><xsl:value-of select="cpf:term"/></dt>
            <dd><xsl:value-of select="cpf:descriptiveNote/cpf:p"/></dd>
            </xsl:if>  
    </xsl:for-each>
      
      <xsl:for-each select="//cpf:localControl[@localType='Publication Date']/cpf:date">
          <xsl:if test="current()!=''">
              <dt>Publish Date</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
      
      <xsl:for-each select="//cpf:relations/cpf:cpfRelation">
          <xsl:if test="current()!=''">
              <dt><xsl:value-of select="cpf:descriptiveNote/cpf:p"/></dt>
              <dd><xsl:value-of select="cpf:relationEntry"/></dd>
              <xsl:for-each select="cpf:placeEntry[@localType='email address']">
                  <xsl:if test="current()!=''">
                      <dt>Email Address</dt><dd><xsl:value-of select="current()"/></dd>
                  </xsl:if>
              </xsl:for-each>
          </xsl:if>  
      </xsl:for-each>
    <xsl:for-each select="//cpf:existDates/cpf:dateRange/cpf:fromDate">
    <xsl:if test="current()!=''">
    <dt>Begin Date</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="//cpf:existDates/cpf:dateRange/cpf:toDate">
    <xsl:if test="current()!=''">
    <dt>End Date</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="//cpf:place/cpf:placeEntry[@localType='address']">
    <xsl:if test="current()!=''">
    <dt>Project Location</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="//cpf:place/cpf:placeEntry[@localType='region']">
    <xsl:if test="current()!=''">
    <dt>Region</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:if>
    </xsl:for-each>
      <xsl:for-each select="//cpf:place/cpf:placeEntry/@countryCode">
          <xsl:if test="current()!=''">
              <dt>Country Code</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="//cpf:place/cpf:placeEntry/@latitude">
          <xsl:if test="current()!=''">
              <dt>Latitude</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="//cpf:place/cpf:placeEntry/@longitude">
          <xsl:if test="current()!=''">
              <dt>Longitude</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>


  </dl>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
