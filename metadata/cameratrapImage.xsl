<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:mods="http://www.loc.gov/mods/v3" 
xmlns:fits="http://hul.harvard.edu/ois/xml/ns/fits/fits_output" 
xmlns:cpf="urn:isbn:1-931666-33-4" 
>

<xsl:template match="/">
  <html>
  <body>
  <dl class="metadata-table">
      <xsl:for-each select="xml_root/debug">
    <dt>Debug</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:for-each>
      <xsl:for-each select="/mods:mods/mods:titleInfo/mods:title">
          <xsl:if test="current()!=''">
              <dt>Title</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="/mods:mods/mods:identifier">
          <xsl:if test="current()!=''">
              <dt>Image ID</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="/mods:mods/mods:relatedItem/mods:identifier">
          <xsl:if test="current()!=''">
              <dt>Image Sequence ID</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="/mods:mods/mods:typeOfResource">
          <xsl:if test="current()!=''">
              <dt>Type of Resource</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="/mods:mods/mods:physicalDescription/mods:digitalOrigin">
          <xsl:if test="current()!=''">
              <dt>Digital Origin</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
    <xsl:for-each select="//mods:abstract">
    <xsl:if test="current()!=''">
    <dt>Description</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:if>
    </xsl:for-each>
      <xsl:for-each select="//mods:subject[@authority='Camera Trap Data Network Photo Type']">
          <xsl:if test="current()!=''">
              <dt>Photo Type</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="//mods:subject[@authority='camera trap data federation Photo Type']">
          <xsl:if test="current()!=''">
              <dt>Photo Type</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="//mods:subject[@authorityURI='http://www.iucnredlist.org']/mods:topic">
          <xsl:if test="current()!=''">
              <dt>Species</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="//mods:subject[not(@*)]/mods:topic">
    <xsl:if test="current()!=''">
    <dt>Topic Keyword</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:if>
    </xsl:for-each>
 <xsl:for-each select="//mods:geographic">
    <xsl:if test="current()!=''">
    <dt>Geographic Keyword</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:if>
    </xsl:for-each>
      <xsl:for-each select="//mods:coordinates">
          <xsl:if test="current()!=''">
              <dt>Coordinates</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
    <xsl:for-each select="/mods:mods/mods:name">
        
        <xsl:if test="mods:namePart!=''">
            <dt>Role</dt><dd><xsl:value-of select="mods:role/mods:roleTerm"/></dd>  
                <dt>Name</dt><dd><xsl:value-of select="mods:namePart"/></dd>          
             
            
            </xsl:if>
        


    </xsl:for-each>

 <xsl:for-each select="//mods:note[@type='Interest Rank']">
    <xsl:if test="current()!=''">
    <dt>Interest Ranking</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:if>
    </xsl:for-each>
 <xsl:for-each select="//mods:originInfo/mods:dateCaptured">
    <xsl:if test="current()!=''">
    <dt>Date Captured</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:if>
    </xsl:for-each>
      <xsl:for-each select="//mods:originInfo/mods:dateOther">
          <xsl:if test="current()!=''">
              <dt>Embargo Period End Date</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
 <xsl:for-each select="//mods:physicalLocation">
    <xsl:if test="current()!=''">
    <dt>Physical Location</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:if>
    </xsl:for-each>
      <xsl:for-each select="//mods:subLocation">
          <xsl:if test="current()!=''">
              <dt>Sub-Location</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
 <xsl:for-each select="//mods:accessCondition[@type='restriction on access']">
    <xsl:if test="current() != ''">
    <dt>Restrictions on Access</dt><dd><xsl:value-of select="current()"/></dd>
        </xsl:if>
    </xsl:for-each>
      <xsl:for-each select="//mods:accessCondition[@type='use and reproduction']">
          <xsl:if test="current() != ''">
              <dt>Restrictions on Use</dt><dd><xsl:value-of select="current()"/></dd>
          </xsl:if>
      </xsl:for-each>
 



  </dl>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet> 
