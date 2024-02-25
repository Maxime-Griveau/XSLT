<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">



    <!-- 1. INSTRUCTION D'OUTPUT : XML -->
    <xsl:output indent="yes" method="html" encoding="UTF-8" omit-xml-declaration="yes"/>


    <!-- 2. VARIABLES -->

    <xsl:variable name="htmlfile">
        <xsl:value-of select="'transformation_html'"/>
    </xsl:variable>
    
    <!-- <HEAD> -->

    <xsl:variable name="header">

        <head>
            <!-- Métadonnées générales -->
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


            <!-- Informations sur l'auteur -->

            <meta>
                <xsl:attribute name="orgName">
                    <xsl:value-of select="//titleStmt/author/orgName"/>
                </xsl:attribute>
            </meta>
            <meta>
                <xsl:attribute name="persName">
                    <xsl:value-of select="//titleStmt/author/persName"/>
                </xsl:attribute>
            </meta>

            <!-- Titre -->

            <title>
                <xsl:value-of select="//fileDesc/titleStmt/title"/>
            </title>
         

            <!-- Métadonnées du profileDesc -->

            <meta>
                <xsl:attribute name="languages">
                    <xsl:for-each select="//langUsage/language">
                        <xsl:value-of select="."/>
                        <xsl:if test="position() != last()">, </xsl:if>
                    </xsl:for-each>
                </xsl:attribute>
            </meta>
            <style>/* Lien vers la palette de couleurs https://coolors.co/palette/2b2d42-8d99ae-edf2f4-ef233c-d90429 */
                /* Lien vers la palette de couleurs https://coolors.co/palette/2b2d42-8d99ae-edf2f4-ef233c-d90429 */
                @font-face {
                font-family: BoldGara;
                src: url(../fonts/EBGaramond-Bold.ttf);
                }
                
                @font-face {
                font-family: ItalGara;
                src: url(../fonts/EBGaramond-Italic.ttf);
                }
                
                @font-face {
                font-family: RegularGara;
                src: url(../fonts/EBGaramond-Regular.ttf);
                }
                
                *
                
                /* Police par défaut de mon site */
                {
                font-family: RegularGara;
                color: #edf2f4;
                
                }
                
                html {
                background-color: black;
                /*Le fond du site sera noir*/
                }
                
                h1 {
                font-family: BoldGara;
                color: #edf2f4;
                font-size: 48px;
                padding-bottom: 15px;
                }
                
                h2 {
                font-family: BoldGara;
                color: #ffd166;
                font-size: 32px;
                }
                
                h3 {
                font-family: RegularGara;
                color: #edf2f4;
                font-size: 24px;
                }
                h4 {
                font-family: RegularGara;
                color: #edf2f4;
                font-size: 24px;
                }
                
                h5 {
                font-family: RegularGara;
                color: #edf2f4;
                margin:15px;
                font-size: 22px;
                }
                
                h6 {
                font-family: RegularGara;
                color: #edf2f4;
                margin:30px;
                font-size: 20px;
                }
                
                figcaption {
                font-family: ItalGara;
                /* On préfère mettre une police en italique plutôt que de faire un "font style" italic qui nous créé un "faux" italique (une police penchée) */
                margin-left: 5px;
                margin-top: 5px;
                font-size: 18px;
                text-align: center;
                }
                
                strong {
                /*Accentuation dans le texte */
                font-family: BoldGara;
                color: #ffd166;
                padding-right: 100px;
                text-align: left;
                }
                
                a {
                /*Les liens dans notre texte auront tous le même affichage pour une bonne compréhension par les utilisateurs */
                text-decoration: underline;
                color: #edf2f4;
                }
                
                /*Et le même comportement au survol de la souris */
                a:hover {
                /*Comportement au survol de la souris pour les liens*/
                transition: 0.6s;
                /*Transition pour éviter le changement de couleur trop brusque*/
                background-color: #EF233C;
                cursor: grab; /*On change le pointeur au survol*/
                }
                
                .footer{
                padding: 75px;
                font-familly:arial;
                font-size:12px;
                text-align:center;
                
                }
                
                .home li {
                font-size: 24px;
                }
            </style>
        </head>
        
        <!-- Style css -->
        
      
    </xsl:variable>    
        <!-- <FOOTER> (à créer) -->

        <xsl:variable name="footer">
        <div>
            <footer>
                <p>
                    <xsl:value-of select="//edition"/></p>
                <p><xsl:copy-of select="$return_home"/></p>
            </footer>
        </div>
    </xsl:variable>
        
        
        
    <!-- Liens -->
          <!-- Retour à l'accueil -->
    

    <xsl:variable name="return_home">
        <a href="./transformation_html_home">
            <i>Retourner à l'accueil</i>
        </a>
    </xsl:variable>
        <!-- Navigation -->

    <xsl:variable name="return_1">
        <a href="./{$htmlfile}_notice1.html">
            <i>Aller à la notice 1 (<xsl:value-of select="/TEI/text/body/div[@n='cly']/head"/>)</i>
        </a>
    </xsl:variable>

    <xsl:variable name="return_2">
        <a href="./{$htmlfile}_notice2.html">
            <i>Aller à la notice 2 (<xsl:value-of select="/TEI/text/body/div[@n='lao']/head"/>)</i>
        </a>
    </xsl:variable>

    <xsl:variable name="return_index">
        <a href="./{$htmlfile}_index.html">
            <i>Aller à l'index</i>
        </a>
    </xsl:variable>



    <!-- Autres variables -->

    <xsl:variable name="apos">'</xsl:variable>

    
    <!-- Appel des templates -->
    
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="notice1"/>
        <xsl:call-template name="notice2"/>
    </xsl:template>
    
 
 
 
    <!-- Page d'accueil -->

    <xsl:template name="home">
        <xsl:result-document href="{$htmlfile}_home">

            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <div>
                        <h1>Edition en ligne de deux notices issues du <xsl:value-of
                                select="//titleStmt/title[2]"/></h1>
                        <ul>
                         
                            <li><xsl:copy-of select="$return_1"/></li>
                            <li><xsl:copy-of select="$return_2"/></li>
                            
                        </ul>
                        
                        <p>
                          <i>  Les notices ont été rédigées par <xsl:for-each select="//teiHeader/fileDesc/editionStmt/respStmt/name">
                                <xsl:value-of select="."/>  
                                <!-- Ajoute "et" si ce n'est pas la dernière itération -->
                                <xsl:if test="position() != last()">
                                    <xsl:text> et </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        
                          </i></p>
                        
                    </div>
                    <div>
                        <p>
                            <b>Résumé :</b>
                            <xsl:value-of select="//teiHeader/encodingDesc/projectDesc/p"/>
                        </p>
                        
                    </div>
                    
                </body>
     
                <xsl:copy-of select="$footer"></xsl:copy-of>
            </html>
        </xsl:result-document>


    </xsl:template>
    
    
    <!-- Page 1 : notice 1 -->


    <xsl:template match="//div[@n='cly']" name="notice1">
        <xsl:result-document href="{$htmlfile}_notice1.html">
            <html>
                <xsl:copy-of select="$header"/>
                <body>
                    <h1><xsl:value-of select="//head[@xml:id='cly']"/></h1>
                    <h3><i><xsl:value-of select="//teiHeader/fileDesc/editionStmt/respStmt/name[1]"/></i> </h3>
                    <div>
                    <xsl:for-each select="//entry[@n='1']/re">
                        <h2><xsl:value-of select="replace(concat(upper-case(substring(@type, 1, 1)), substring(@type, 2)), '_',' ')"/></h2>
                        
                        
                       
                        <xsl:apply-templates/>
                        
                    </xsl:for-each>
                    </div>
                    
                    <xsl:copy-of select="$footer"/>
                </body>
                
              
            </html>
        </xsl:result-document>
    </xsl:template>
    
    
    <!-- Page 2, notice 2 -->


    <xsl:template match="//div[@n='lao']" name="notice2">
        <xsl:result-document href="{$htmlfile}_notice2.html">
            <html>
                <xsl:copy-of select="$header"/>
                <body>
                    <h1><xsl:value-of select="//head[@xml:id='lao']"/></h1>
                    <h3><i><xsl:value-of select="//teiHeader/fileDesc/editionStmt/respStmt/name[2]"/> </i></h3>
                    <div>
                        <xsl:for-each select="//entry[@n='2']/re">
                            <h2><xsl:value-of select="replace(concat(upper-case(substring(@type, 1, 1)), substring(@type, 2)), '_',' ')"/></h2>
                            
                            
                            
                            <xsl:apply-templates/>
                            
                        </xsl:for-each>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
                
            </html>
        </xsl:result-document>
    </xsl:template>
    



   
</xsl:stylesheet>
