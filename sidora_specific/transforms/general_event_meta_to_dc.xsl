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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
            <dc:title><xsl:value-of select="title/primaryTitle"/></dc:title>
        </oai_dc:dc>
    </xsl:template>
</xsl:stylesheet>