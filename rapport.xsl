<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Rapport</title>
            </head>
            <body>
                <table border="1" width="70%">
                    <tr>
                        <th>Num</th><th>Date</th><th>Exp</th><th>Dest</th><th>Etat</th><th>Montant</th>
                    </tr>
                    <xsl:for-each select="rapport/mandat">
                        <tr>
                            <td><xsl:value-of select="@num"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td>
                                <li>CIN:<xsl:value-of select="expediteur/@cin"/></li>
                                <li>NOM:<xsl:value-of select="expediteur/@nom"/></li>
                                <li>Prenom:<xsl:value-of select="expediteur/@prenom"/></li>
                            </td>
                            <td>
                                <li>CIN:<xsl:value-of select="destinataire/@cin"/></li>
                                <li>NOM:<xsl:value-of select="destinataire/@nom"/></li>
                                <li>Prenom:<xsl:value-of select="destinataire/@prenom"/></li>
                            </td>
                            <td><xsl:value-of select="@etat"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <td colspan="5">Total des mandats</td>
                        <td><xsl:value-of select="sum(rapport/mandat/@montant)"/></td>
                    </tr>
                    <tr>
                        <td colspan="5">Total des mandats reçus</td>
                        <td><xsl:value-of select="sum(rapport/mandat[@etat='reçu']/@montant)"/></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>