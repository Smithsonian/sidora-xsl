<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright 2015-2017 Smithsonian Institution.

Licensed under the Apache License, Version 2.0 (the "License"); you may not
use this file except in compliance with the License.You may obtain a copy of
the License at: http://www.apache.org/licenses/

This software and accompanying documentation is supplied without
warranty of any kind. The copyright holder and the Smithsonian Institution:
(1) expressly disclaim any warranties, express or implied, including but not
limited to any implied warranties of merchantability, fitness for a
particular purpose, title or non-infringement; (2) do not assume any legal
liability or responsibility for the accuracy, completeness, or usefulness of
the software; (3) do not represent that use of the software would not
infringe privately owned rights; (4) do not warrant that the software
is error-free or will be maintained, supported, updated or enhanced;
(5) will not be liable for any indirect, incidental, consequential special
or punitive damages of any kind or nature, including but not limited to lost
profits or loss of data, on any basis arising from contract, tort or
otherwise, even if any of the parties has been warned of the possibility of
such loss or damage.

This distribution includes several third-party libraries, each with their own
license terms. For a complete copy of all copyright and license terms, including
those of third-party libraries, please see the product release notes.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    <xsl:strip-space elements="*"/>     
    <!-- Identify Transform. -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="SIdoraConcept">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="conceptType"/>
            <xsl:apply-templates select="resourceType"/>
            <xsl:apply-templates select="primaryTitle"/>
            <xsl:apply-templates select="altTitle"/>
            <xsl:apply-templates select="summaryDescription"/>
            <xsl:apply-templates select="keyword"/>
            <xsl:apply-templates select="entityType"/>
            <xsl:apply-templates select="identifier"/>
            <xsl:apply-templates select="rights"/>
            <xsl:apply-templates select="source"/>
            <xsl:apply-templates select="relationship"/>
            <xsl:apply-templates select="note"/>
            <xsl:apply-templates select="timePeriod"/>
            <xsl:apply-templates select="place"/>
            <xsl:apply-templates select="actor"/>
            <xsl:apply-templates select="language"/>
            <xsl:apply-templates select="physDesc"/>
            <xsl:apply-templates select="condition"/>
            <xsl:apply-templates select="context"/>
            <xsl:apply-templates select="style"/>
            <xsl:apply-templates select="format"/>
            <xsl:apply-templates select="materials"/>
            <xsl:apply-templates select="method"/>
            <xsl:apply-templates select="technique"/>
            <xsl:apply-templates select="treatment"/>
            <xsl:apply-templates select="measurements"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="contactInfo">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="address1"/>
            <xsl:apply-templates select="address2"/>
            <xsl:apply-templates select="city"/>
            <xsl:apply-templates select="state"/>
            <xsl:apply-templates select="postalCode"/>
            <xsl:apply-templates select="country"/>
            <xsl:apply-templates select="phone"/>
            <xsl:apply-templates select="email"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="altTitle">
        <xsl:copy>
            <xsl:apply-templates select="*[not(self::note)]|@*"/>
            <xsl:apply-templates select="note"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="place">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="geogname"/>
            <xsl:apply-templates select="*[self::boundedby|self::point|self::geometry]"/>
            <xsl:apply-templates select="timePeriod"/>
            <xsl:apply-templates select="note"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="actor">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="*[self::corpname|self::persnameText|self::persname|self::taxonName]"/>
            <xsl:apply-templates select="contactInfo"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="timePeriod">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="intervalname"/>
            <xsl:apply-templates select="date"/>
            <xsl:apply-templates select="note"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="keyword|physDesc|format|identifier|language|rights|source|context|entityType|materials|technique|condition|treatment|style|relationship">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:call-template name="value_and_note"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="measurements">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="measurementText"/>
            <xsl:apply-templates select="measurement"/>
            <xsl:apply-templates select="timePeriod"/>
            <xsl:apply-templates select="accuracy"/>
            <xsl:apply-templates select="note"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="boundedby">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <!-- First Choice -->
            <xsl:apply-templates select="northlat"/>
            <xsl:apply-templates select="westlong"/>
            <xsl:apply-templates select="southlat"/>
            <xsl:apply-templates select="eastlong"/>
            <xsl:apply-templates select="uplimit"/>
            <xsl:apply-templates select="downlimit"/>
            <!-- Second Choice -->
            <xsl:apply-templates select="point"/>
            <xsl:apply-templates select="point"/>
            <xsl:apply-templates select="point"/>
            <xsl:apply-templates select="point"/>
            <xsl:apply-templates select="uplimit"/>
            <xsl:apply-templates select="downlimit"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="geometry">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:call-template name="geometryclasses"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="attribute">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="attname"/>
            <xsl:apply-templates select="attvalue"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="point">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="lat"/>
            <xsl:apply-templates select="long"/>
            <xsl:apply-templates select="uplimit"/>
            <xsl:apply-templates select="attribute"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="line">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="point"/>
            <xsl:apply-templates select="point"/>
            <xsl:apply-templates select="attribute"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="polygon">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="outbound"/>
            <xsl:apply-templates select="inbound"/>
            <xsl:apply-templates select="attribute"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="outbound|inbound">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:call-template name="bound"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="circle">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="point"/>
            <xsl:apply-templates select="radius"/>
            <xsl:apply-templates select="attribute"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="multipoint">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="point"/>
            <xsl:apply-templates select="attribute"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="multiline">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="line"/>
            <xsl:apply-templates select="attribute"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="multipolygon">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="polygon"/>
            <xsl:apply-templates select="attribute"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="geometrycoll">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:call-template name="geometryclasses"/>
            <xsl:apply-templates select="attribute"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="persname">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="firstname"/>
            <xsl:apply-templates select="middlename"/>
            <xsl:apply-templates select="lastname"/>
            <xsl:apply-templates select="suffix"/>
            <xsl:apply-templates select="contactInfo"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="taxonName">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="genus"/>
            <xsl:apply-templates select="species"/>
            <xsl:apply-templates select="scientificNameAuthorship"/>
            <xsl:apply-templates select="commonName"/>
            <xsl:apply-templates select="kingdom"/>
            <xsl:apply-templates select="phylum"/>
            <xsl:apply-templates select="class"/>
            <xsl:apply-templates select="order"/>
            <xsl:apply-templates select="family"/>
            <xsl:apply-templates select="variant"/>
        </xsl:copy>
    </xsl:template>
    <!-- Helper templates for a common patterns. -->
    <xsl:template name="value_and_note">
        <xsl:apply-templates select="value"/>
        <xsl:apply-templates select="note"/>
    </xsl:template>
    <xsl:template name="bound">
        <!-- Choice -->
        <xsl:apply-templates select="point"/>
        <xsl:apply-templates select="circle"/>
        <!-- Sequence -->
        <xsl:apply-templates select="attribute"/>
    </xsl:template>
    <xsl:template name="geometryclasses">
        <xsl:apply-templates select="point|line|polygon|multipoint|multiline|multipolygon|geometrycoll"/>
    </xsl:template>
</xsl:stylesheet>
