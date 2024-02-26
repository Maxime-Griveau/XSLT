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
            <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0"/>

            <!-- Titre -->

            <title>
                <xsl:value-of select="//fileDesc/titleStmt/title"/>
            </title>



            <!-- Style css -->

            <style>
                /* Lien vers la palette de couleurs https://coolors.co/palette/2b2d42-8d99ae-edf2f4-ef233c-d90429 */
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
                    margin: 15px;
                    font-size: 22px;
                }
                
                h6 {
                    font-family: RegularGara;
                    color: #edf2f4;
                    margin: 30px;
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
                
                .footer {
                    padding: 75px;
                    font-size: 12px;
                    text-align: center;
                
                }
                
                .home li {
                    font-size: 24px;
                    list-style: none;
                
                }
                p {
                
                    text-align: justify;
                
                }
                
                .footer p {
                    text-align: center;
                    
                }
            
            /* Le style de l'arbre est inspiré de https://codepen.io/jreaux62/pen/GJmOMP */
            .tree {
            color: #fff; 
            
            }
            
            
            .tree ul {
            padding-top: 20px;
            position: relative;
            display: flex;
            
            justify-content: center;
            }
            
            .tree li {
            text-align: center;
            list-style-type: none;
            position: relative;
            padding: 20px 5px 0 5px;
            transition: all 0.5s;
            }
            
            /* On créé des lignes (forcément vides) [content : '' sert à cela] qui se placent avant et après chaque élément li */
            .tree li::before, .tree li::after {
            content: '';
            position: absolute;
            top: 0;
            right: 50%;
            border-top: 1px solid #999; 
            width: 50%;
            height: 20px;
            }
            
            
            
            .tree li::after {
            right: auto;
            left: 50%;
            border-left: 1px solid #999;
            }
            
            /* Pour éviter que des lignes verticales apparaissent après les derniers enfants de l'arbre généalogique */
            .tree li:only-child::after, .tree li:only-child::before {
            display: none;
            }
            
            /*Pour que les enfants soient bien "collés" aux lignes*/
            .tree li:only-child {
            padding-top: 0;
            }
            
            /* Pour éviter que des lignes horizontales apparaissent après les derniers enfants de l'abree*/
            .tree li:first-child::before, .tree li:last-child::after {
            display: none;
            }
            
            /* Les dernières lignes ont une bordures ronde */
            .tree li:last-child::before {
            border-right: 1px solid #999;
            border-radius: 0 5px 0 0;
            }
            .tree li:first-child::after {
            border-radius: 5px 0 0 0;
            }
            
            
            
          
            
            /* Création de lignes verticales entre le premier et le second niveau de liste */
            .tree ul ul::before {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            border-left: 1px solid #999;
            width: 0;
            height: 20px;
            }
            
      
            
            /* Ce code fait en sorte que l'arbre n'ai aucun arrière plan*/
            .tree div {
            background: none;
            color: #fff; /* White text */
            }
            
            
            
            </style>
            
            


        </head>


    </xsl:variable>
    <!-- <FOOTER> -->

    <xsl:variable name="footer">
        <div>
            <footer class="footer">
                <p>
                    <xsl:copy-of select="$return_home"/>
                </p>
                <p>
                    <xsl:value-of select="//edition"/>
                </p>

                <p>©Tous droits réservés <xsl:value-of select="//publicationStmt/publisher"/>,
                    localisée au <xsl:for-each select="//publicationStmt/address/addrLine">
                        <xsl:value-of select="."/></xsl:for-each></p>
                <p> Encodage et transformation XSL par <xsl:value-of
                        select="//titleStmt/author/persName"/>
                </p>
                <p> Dans le cadre des cours de TEI et d'XSL à L'<xsl:value-of
                        select="//titleStmt/author/orgName"/>
                </p>
            </footer>
        </div>
    </xsl:variable>


    <!-- Liens -->
    <!-- Retour à l'accueil -->


    <xsl:variable name="return_home">
        <a href="{$htmlfile}_accueil.html">
            <i>Retourner à l'accueil</i>
        </a>
    </xsl:variable>
    <!-- Navigation -->

    <xsl:variable name="return_1">
        <a href="./{$htmlfile}_notice1.html">
            <strong>Aller à la notice 1 (<xsl:value-of select="/TEI/text/body/div[@n = 'cly']/head"
                />)</strong>
        </a>
    </xsl:variable>

    <xsl:variable name="return_2">
        <a href="./{$htmlfile}_notice2.html">
            <strong>Aller à la notice 2 (<xsl:value-of select="/TEI/text/body/div[@n = 'lao']/head"
                />)</strong>
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

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>





    <!-- Page d'accueil -->

    <xsl:template match="/TEI/teiHeader" name="home">
        <xsl:result-document href="{$htmlfile}_accueil.html">

            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <div>
                        <h1>Edition en ligne de deux notices issues du <xsl:value-of
                                select="//titleStmt/title[2]"/></h1>
                        <ul class="home">

                            <li>
                                <xsl:copy-of select="$return_1"/>
                            </li>
                            <li>
                                <xsl:copy-of select="$return_2"/>
                            </li>

                        </ul>

                        <p>
                            <i> Les notices ont été rédigées par <xsl:for-each
                                    select="//teiHeader/fileDesc/editionStmt/respStmt/name">
                                    <xsl:value-of select="."/>
                                    <!-- Ajoute "et" si ce n'est pas la dernière itération -->
                                    <xsl:if test="position() != last()">
                                        <xsl:text> et </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </i>
                        </p>

                    </div>
                    <div>
                        <p>
                            <b>Résumé :</b>
                            <xsl:value-of select="//teiHeader/encodingDesc/projectDesc/p"/>
                        </p>

                    </div>
                    <div>
                        <!-- Métadonnées du profileDesc -->



                        <!-- Informations sur l'auteur -->





                        <!-- Editeur du LIMC-->

                        <p>Le LIMC a été édité par <xsl:value-of
                                select="//fileDesc/editionStmt/editor/name"/> (<xsl:value-of
                                select="//fileDesc/editionStmt/editor/country"/>) avec le soutien de
                                <xsl:for-each select="//sponsor/orgName">
                                <xsl:value-of select="."/>
                            </xsl:for-each>, les pays suivants ont contribué à sa rédaction :
                                <xsl:for-each select="//fileDesc/editionStmt/sponsor/country">
                                    <xsl:value-of select="."/> </xsl:for-each> ce qui explique les 4
                            langues dans lesquelles sont rédigé les volumes (<xsl:for-each
                                select="//langUsage/language">
                                <xsl:value-of select="."/>
                                <xsl:if test="position() != last()">, </xsl:if>
                            </xsl:for-each>. La personne à l'origine du projet est <xsl:value-of
                                select="//principal/persName"/>. </p>




                        <p><b>Notes sur l'encodage : </b><xsl:value-of select="//notesStmt"/>.
                                <xsl:value-of select="//encodingDesc/projectDesc"/></p>

                    </div>
                </body>


                <xsl:copy-of select="$footer"/>
            </html>

        </xsl:result-document>


    </xsl:template>







    <!-- Page 1 : notice 1 -->

    <xsl:template match="//div[@n = 'cly']" name="notice1">
        <xsl:result-document href="{$htmlfile}_notice1.html">
            <html lang="fr">

                <xsl:copy-of select="$header"/>

                <body>

                    <h1>
                        <xsl:attribute name="id">
                            <xsl:value-of select="./head/@xml:id"/>
                        </xsl:attribute>
                        <!-- On créé une ancre, en admettant que toutes les notices (plusieurs centaines, le LIMC correspondant à 11 volumes) aient été encodées, chaque lien créé dans le texte renverrai vers la notice correspondante (actuellement, les liens seront presque tous "vides") -->
                        <xsl:value-of select="./head"/>


                    </h1>

                    <h3>
                        <i>
                            <xsl:value-of select="//teiHeader/fileDesc/editionStmt/respStmt/name[1]"
                            />
                        </i>
                    </h3>

                    <!-- Extraction du titre, la case est rétablie et les tirets remplacés par des espaces -->
                    <div>
                        <h2>
                            <xsl:value-of
                                select="replace(concat(upper-case(substring(./entry/re[@type = 'etymologie']/@type, 1, 1)), substring(./entry/re[@type = 'etymologie']/@type, 2)), '_', ' ')"
                            />
                        </h2>
                        <p>Formes les plus anciennes :</p>
                        <ul>
                            <!-- Extraction du contenu, chaque élément orig est placé dans une liste à puce, si reg est présent il est ajouté entre parenthèses -->
                            <xsl:for-each select="./entry/re[@type = 'etymologie']/etym//orig">
                                <li>
                                    <i>
                                        <xsl:value-of select="."/>
                                    </i>
                                    <xsl:if test="following-sibling::reg">
                                        <xsl:value-of
                                            select="concat(' (', following-sibling::reg, ')')"/>
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>

                    <!-- Extraction de la généalogie -->

                    <h2>
                        <xsl:value-of
                            select="replace(concat(upper-case(substring(./entry/re[@type = 'genealogie']/@type, 1, 1)), substring(./entry/re[@type = 'genealogie']/@type, 2)), '_', ' ')"
                        />
                    </h2>
                    <div>
                        <xsl:value-of select="./entry/re[@type = 'genealogie']"/>
                    </div>
                    <!-- Cette structure génère, sous forme de liste à puces imbriquées, un arbre généalogique qui est ensuite traité en CSS pour le rendu. La première boucle xsl:if permet de s'assurer qu'au moins une condition est remplie avant de débuter. -->
                    <div class="tree">
                        <xsl:for-each select="./entry/re[@type = 'genealogie']">
                            <xsl:if
                                test="persName[@role = 'ancetre'] | persName[@role = 'grand-pere'] | persName[@role = 'grand-mere'] | persName[@role = 'pere'] | persName[@role = 'mere'] | persName[@role = 'epouse'] | persName[@role = 'mari']">
                                <ul>
                                    <xsl:if test="persName[@role = 'ancetre']">
                                        <li class="ancetre">
                                            <b>Ancêtre(s) : </b>
                                            <xsl:value-of select="persName[@role = 'ancetre']"/>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'grand-pere'] | persName[@role = 'grand-mere']">
                                        <li class="grands-parents">
                                            <b>Grands-parents : </b>
                                            <xsl:value-of
                                                select="persName[@role = 'grand-pere'] | persName[@role = 'grand-mere']"
                                            />
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'pere'] | persName[@role = 'mere']">
                                        <li class="parents">
                                            <b>Parents : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'pere'] | persName[@role = 'mere']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'oncle'] | persName[@role = 'tante']">
                                        <li class="oncles-tantes">
                                            <b>Oncles et tantes : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'oncle'] | persName[@role = 'tante']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'beau-pere'] | persName[@role = 'belle-mere']">
                                        <li class="beaux-parents">
                                            <b>Beaux-parents : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'beau-pere'] | persName[@role = 'belle-mere']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'epouse'] | persName[@role = 'mari']">
                                        <li class="maris-femmes">
                                            <xsl:choose>
                                                <xsl:when test="persName[@role = 'epouse']">
                                                  <b>Femme(s) : </b>
                                                </xsl:when>
                                                <xsl:when test="persName[@role = 'mari']">
                                                  <b>Mari(s) : </b>
                                                </xsl:when>
                                            </xsl:choose>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'epouse'] | persName[@role = 'mari']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'frere'] | persName[@role = 'soeur']">
                                        <li class="freres-soeurs">
                                            <b>Frères et soeurs : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'frere'] | persName[@role = 'soeur']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'cousin'] | persName[@role = 'cousine'] | persName[@role = 'cousin-germain'] | persName[@role = 'cousine-germaine']">
                                        <li class="cousins-cousines">
                                            <b>Cousins et cousines : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'cousin'] | persName[@role = 'cousine'] | persName[@role = 'cousin-germain'] | persName[@role = 'cousine-germaine']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'fils'] | persName[@role = 'fille']">
                                        <li class="enfants">
                                            <b>Enfants : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'fils'] | persName[@role = 'fille']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'beau-fils'] | persName[@role = 'belle-fille']">
                                        <li class="beaux-enfants">
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'beau-fils'] | persName[@role = 'belle-fille']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'niece'] or persName[@role = 'neveu']">
                                        <li class="neveux-nieces">
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'niece'] | persName[@role = 'neveu']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'petit-fils'] | persName[@role = 'petite-fille']">
                                        <li class="petits-enfants">
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'petit-fils'] | persName[@role = 'petite-fille']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if test="persName[@role = 'descendant']">
                                        <li class="descendants">
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'descendant']"/>
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                </ul>
                            </xsl:if>

                        </xsl:for-each>
                    </div>



                    <!-- Extraction des sources littéraires -->
                    <div>
                        <h2>
                            <xsl:value-of
                                select="replace(concat(upper-case(substring(./entry/re[@type = 'sources_littéraires']/@type, 1, 1)), substring(./entry/re[@type = 'sources_littéraires']/@type, 2)), '_', ' ')"
                            />
                        </h2>
                    </div>

                    <div>
                        <xsl:for-each select="./entry/re[@type = 'sources_littéraires']/node()">
                            <!-- On doit mettre node() pour que cette boucle et les conditions s'appliquent sur tous les noeuds (éléments, attributs, texte...), sans cela cela ne fonctionnerait pas -->
                            <xsl:choose>
                                <!-- Si le nœud est un élément 'name', appliquer le formatage en gras -->
                                <xsl:when test="self::name">
                                    <b>
                                        <xsl:value-of select="."/>
                                        <xsl:text> </xsl:text>
                                    </b>
                                </xsl:when>
                                <!-- Si le nœud est un élément 'persName', appliquer le formatage en italique -->
                                <xsl:when test="self::persName">
                                    <i>
                                        <xsl:value-of select="."/>
                                    </i>
                                </xsl:when>

                                <!-- Traitement pour 'ref', création de lien -->
                                <xsl:when test="self::ref">

                                    <i>
                                        <a href="#{@target}">
                                            <xsl:value-of select="."/>
                                        </a>
                                    </i>
                                </xsl:when>
                                <!-- Pour les autres nœuds (y compris les nœuds textuels), copier le texte tel quel -->
                                <xsl:otherwise>
                                    <xsl:value-of select="."/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </div>



                    <!-- Extraction de la bibliographie -->
                    <div>
                        <h2>
                            <xsl:value-of
                                select="replace(concat(upper-case(substring(./entry/re[@type = 'bibliographie']/@type, 1, 1)), substring(./entry/re[@type = 'bibliographie']/@type, 2)), '_', ' ')"
                            />
                        </h2>
                        <div>
                            <xsl:for-each
                                select="./entry/re[@type = 'bibliographie']/listBibl/biblStruct">
                                <div class="bibEntry">
                                    <ul>
                                        <li>
                                            <span class="author"><xsl:value-of
                                                  select="monogr/author"/></span>, <span
                                                class="title"><xsl:value-of select="monogr/title"
                                                /></span>, <xsl:if test="monogr/imprint/publisher">
                                                <span class="publisher"><xsl:value-of
                                                  select="monogr/imprint/publisher"/></span>, </xsl:if>
                                            <xsl:if test="monogr/imprint/pubPlace">
                                                <span class="pubPlace"><xsl:value-of
                                                  select="monogr/imprint/pubPlace"/></span>, </xsl:if>
                                            <span class="date"><xsl:value-of
                                                  select="monogr/imprint/date"/></span>, <span
                                                class="pages">pp. <xsl:value-of
                                                  select="monogr/biblScope[@unit = 'page']/@from"
                                                  />-<xsl:value-of
                                                  select="monogr/biblScope[@unit = 'page']/@to"
                                                /></span>
                                        </li>
                                    </ul>
                                </div>
                            </xsl:for-each>
                        </div>

                    </div>

                    <!-- Extraction du catalogue -->
                    <div>
                        <h2>
                            <xsl:value-of
                                select="replace(concat(upper-case(substring(./entry/re[@type = 'catalogue']/@type, 1, 1)), substring(./entry/re[@type = 'catalogue']/@type, 2)), '_', ' ')"
                            />
                        </h2>
                        <div>


                            <h3>
                                <i>
                                    <xsl:value-of
                                        select="concat(upper-case(substring(//div/entry/re/note/@type, 1, 1)), substring(//note/@type, 2))"
                                    />
                                </i>
                            </h3>
                            <xsl:for-each select="./entry/re[@type = 'catalogue']/note/node()">
                                <!-- On doit mettre node() pour que cette boucle et les conditions s'appliquent sur tous les noeuds (éléments, attributs, texte...), sans cela cela ne fonctionnerait pas -->
                                <xsl:choose>
                                    <xsl:when test="self::ref">
                                        <i>
                                            <a href="#{@target}">
                                                <xsl:value-of select="."/>
                                            </a>
                                        </i>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="."/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </div>


                        <xsl:for-each select="./entry/re[@type = 'catalogue']/re">
                            <h4>
                                <xsl:value-of
                                    select="replace(concat(upper-case(substring(@type, 1, 1)), substring(@type, 2)), '_', ' ')"
                                />
                            </h4>
                            <xsl:for-each select="./re">
                                <h5>
                                    <xsl:value-of
                                        select="replace(concat(upper-case(substring(@type, 1, 1)), substring(@type, 2)), '_', ' ')"
                                    />
                                </h5>
                                <xsl:for-each select="./re">
                                    <h6>
                                        <xsl:value-of
                                            select="replace(concat(upper-case(substring(@type, 1, 1)), substring(@type, 2)), '_', ' ')"
                                        />
                                    </h6>

                                    <p>
                                        <i>
                                            <xsl:value-of select="./xr"/>
                                        </i>
                                    </p>
                                    <xsl:for-each select="./figure">
                                        <!-- On créé une ancre pour chaque image, ainsi quand elles sont mentionnées dans le commentaire l'utilisateur peut les voir -->
                                        <p>
                                            <xsl:attribute name="id">
                                                <xsl:value-of select="./graphic/@xml:id"/>
                                            </xsl:attribute>
                                            <b><xsl:value-of select="@n"/>. </b>
                                            <xsl:value-of select="./ab"/>
                                        </p>
                                        <p>
                                            <a href="{graphic/@url}">Voir la notice sur Beazley
                                                archive</a>
                                        </p>

                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>




                    </div>

                    <!-- Extraction du commentaire -->

                    <!-- Notons que les numéros auquel fait mention le commentaire "n'existent pas" car nous n'avons pas encodé nos notices en totalité dans le cadre de cet exercice -->
                    <div>
                        <h2>
                            <xsl:value-of
                                select="replace(concat(upper-case(substring(./entry/re[@type = 'commentaire']/@type, 1, 1)), substring(./entry/re[@type = 'commentaire']/@type, 2)), '_', ' ')"
                            />
                        </h2>

                        <div>
                            <xsl:for-each select="./entry/re[@type = 'commentaire']/node()">
                                <!-- On doit mettre node() pour que cette boucle et les conditions s'appliquent sur tous les noeuds (éléments, attributs, texte...), sans cela cela ne fonctionnerait pas -->
                                <!-- Pour éviter que les commentaires soient pris en compte -->
                                <xsl:if test="not(self::comment())">
                                    <xsl:choose>
                                        <!-- Si le nœud est un élément 'name', appliquer le formatage en gras -->
                                        <xsl:when test="self::name">
                                            <b>
                                                <xsl:value-of select="."/>
                                                <xsl:text> </xsl:text>
                                            </b>
                                        </xsl:when>
                                        <!-- Si le nœud est un élément 'persName', appliquer le formatage en italique -->
                                        <xsl:when test="self::persName">
                                            <i>
                                                <xsl:value-of select="."/>
                                            </i>
                                        </xsl:when>

                                        <!-- Traitement pour 'ref', création de lien -->
                                        <xsl:when test="self::ref">

                                            <i>
                                                <a href="#{@target}">
                                                  <xsl:value-of select="."/>
                                                </a>
                                            </i>
                                        </xsl:when>
                                        <!-- Pour les autres nœuds (y compris les nœuds textuels), copier le texte tel quel -->
                                        <xsl:otherwise>
                                            <xsl:value-of select="."/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                        </div>





                    </div>

                    <xsl:copy-of select="$footer"/>
                </body>

            </html>
        </xsl:result-document>
    </xsl:template>







    <!-- Page 2, notice 2 -->


    <xsl:template match="//div[@n = 'lao']" name="notice2">
        <xsl:result-document href="{$htmlfile}_notice2.html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <h1>

                        <xsl:attribute name="id">
                            <xsl:value-of select="./head/@xml:id"/>
                        </xsl:attribute>
                        <!-- On créé une ancre, en admettant que toutes les notices (plusieurs centaines, le LIMC correspondant à 11 volumes) aient été encodées, chaque lien créé dans le texte renverrai vers la notice correspondante (actuellement, les liens seront presque tous "vides") -->
                        <xsl:value-of select="./head"/>

                    </h1>
                    <h3>
                        <i>
                            <xsl:value-of select="//teiHeader/fileDesc/editionStmt/respStmt/name[2]"
                            />
                        </i>
                    </h3>

                    <!-- Extraction du titre, la case est rétablie et les tirets remplacés par des espaces -->
                    <div>
                        <h2>
                            <xsl:value-of
                                select="replace(concat(upper-case(substring(./entry/re[@type = 'etymologie']/@type, 1, 1)), substring(./entry/re[@type = 'etymologie']/@type, 2)), '_', ' ')"
                            />
                        </h2>
                        <p>Formes les plus anciennes :</p>
                        <ul>
                            <!-- Extraction du contenu, chaque élément orig est placé dans une liste à puce, si reg est présent il est ajouté entre parenthèses -->
                            <xsl:for-each select="./entry/re[@type = 'etymologie']/etym//orig">
                                <li>
                                    <i>
                                        <xsl:value-of select="."/>
                                    </i>
                                    <xsl:if test="following-sibling::reg">
                                        <xsl:value-of
                                            select="concat(' (', following-sibling::reg, ')')"/>
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>

                    <!-- Extraction de la généalogie -->

                    <h2>
                        <xsl:value-of
                            select="replace(concat(upper-case(substring(./entry/re[@type = 'genealogie']/@type, 1, 1)), substring(./entry/re[@type = 'genealogie']/@type, 2)), '_', ' ')"
                        />
                    </h2>
                    <div>
                        <xsl:value-of select="./entry/re[@type = 'genealogie']"/>
                    </div>
                    <!-- Cette structure génère, sous forme de liste à puces imbriquées, un arbre généalogique qui est ensuite traité en CSS pour le rendu. Notez que ce dernier n'est pas optimal (on aurait aimé un abre dans le sens vertical) mais mes compétences en CSS se limitent rapidement -->
                    <div class="tree">
                        <xsl:for-each select="./entry/re[@type = 'genealogie']">
                          
                                <ul>
                                    <xsl:if test="persName[@role = 'ancetre']">
                                        <li class="ancetre">
                                            <b>Ancêtre(s) : </b>
                                            <xsl:value-of select="persName[@role = 'ancetre']"/>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'grand-pere'] | persName[@role = 'grand-mere']">
                                        <li class="grands-parents">
                                            <b>Grands-parents : </b>
                                            <xsl:value-of
                                                select="persName[@role = 'grand-pere'] | persName[@role = 'grand-mere']"
                                            />
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'pere'] | persName[@role = 'mere']">
                                        <li class="parents">
                                            <b>Parents : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'pere'] | persName[@role = 'mere']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'oncle'] | persName[@role = 'tante']">
                                        <li class="oncles-tantes">
                                            <b>Oncles et tantes : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'oncle'] | persName[@role = 'tante']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'beau-pere'] | persName[@role = 'belle-mere']">
                                        <li class="beaux-parents">
                                            <b>Beaux-parents : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'beau-pere'] | persName[@role = 'belle-mere']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'epouse'] | persName[@role = 'mari']">
                                        <li class="maris-femmes">
                                            <xsl:choose>
                                                <xsl:when test="persName[@role = 'epouse']">
                                                  <b>Femme(s) : </b>
                                                </xsl:when>
                                                <xsl:when test="persName[@role = 'mari']">
                                                  <b>Mari(s) : </b>
                                                </xsl:when>
                                            </xsl:choose>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'epouse'] | persName[@role = 'mari']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'frere'] | persName[@role = 'soeur']">
                                        <li class="freres-soeurs">
                                            <b>Frères et soeurs : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'frere'] | persName[@role = 'soeur']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'cousin'] | persName[@role = 'cousine'] | persName[@role = 'cousin-germain'] | persName[@role = 'cousine-germaine']">
                                        <li class="cousins-cousines">
                                            <b>Cousins et cousines : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'cousin'] | persName[@role = 'cousine'] | persName[@role = 'cousin-germain'] | persName[@role = 'cousine-germaine']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'fils'] | persName[@role = 'fille']">
                                        <li class="fils-filles">
                                            <b>Enfants : </b>
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'fils'] | persName[@role = 'fille']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'beau-fils'] | persName[@role = 'belle-fille']">
                                        <li class="beaux-enfants">
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'beau-fils'] | persName[@role = 'belle-fille']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'niece'] or persName[@role = 'neveu']">
                                        <li class="neveux-nieces">
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'niece'] | persName[@role = 'neveu']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if
                                        test="persName[@role = 'petit-fils'] | persName[@role = 'petite-fille']">
                                        <li class="petits-enfants">
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'petit-fils'] | persName[@role = 'petite-fille']"
                                                  />
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                    <xsl:if test="persName[@role = 'descendant']">
                                        <li class="descendants">
                                            <ul>
                                                <li>
                                                  <xsl:value-of
                                                  select="persName[@role = 'descendant']"/>
                                                </li>
                                            </ul>
                                        </li>
                                    </xsl:if>
                                </ul>
                            
                        </xsl:for-each>
                    </div>



                    <!-- Extraction des sources littéraires -->
                    <div>
                        <h2>
                            <xsl:value-of
                                select="replace(concat(upper-case(substring(./entry/re[@type = 'sources_littéraires']/@type, 1, 1)), substring(./entry/re[@type = 'sources_littéraires']/@type, 2)), '_', ' ')"
                            />
                        </h2>
                    </div>

                    <div>
                        <xsl:for-each select="./entry/re[@type = 'sources_littéraires']/node()">
                            <!-- On doit mettre node() pour que cette boucle et les conditions s'appliquent sur tous les noeuds (éléments, attributs, texte...), sans cela cela ne fonctionnerait pas -->
                            <xsl:choose>
                                <!-- Si le nœud est un élément 'name', appliquer le formatage en gras -->
                                <xsl:when test="self::name">
                                    <b>
                                        <xsl:value-of select="."/>
                                        <xsl:text> </xsl:text>
                                    </b>
                                </xsl:when>
                                <!-- Si le nœud est un élément 'persName', appliquer le formatage en italique -->
                                <xsl:when test="self::persName">
                                    <i>
                                        <xsl:value-of select="."/>
                                    </i>
                                </xsl:when>

                                <!-- Traitement pour 'ref', création de lien -->
                                <xsl:when test="self::ref">

                                    <i>
                                        <a href="#{@target}">
                                            <xsl:value-of select="."/>
                                        </a>
                                    </i>
                                </xsl:when>
                                <!-- Pour les autres nœuds (y compris les nœuds textuels), copier le texte tel quel -->
                                <xsl:otherwise>
                                    <xsl:value-of select="."/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </div>



                    <!-- Extraction de la bibliographie -->
                    <div>
                        <h2>
                            <xsl:value-of
                                select="replace(concat(upper-case(substring(./entry/re[@type = 'bibliographie']/@type, 1, 1)), substring(./entry/re[@type = 'bibliographie']/@type, 2)), '_', ' ')"
                            />
                        </h2>
                        <div>
                            <xsl:for-each
                                select="./entry/re[@type = 'bibliographie']/listBibl/biblStruct">
                                <div class="bibEntry">
                                    <ul>
                                        <li>
                                            <span class="author"><xsl:value-of
                                                  select="monogr/author"/></span>, <span
                                                class="title"><xsl:value-of select="monogr/title"
                                                /></span>, <xsl:if test="monogr/imprint/publisher">
                                                <span class="publisher"><xsl:value-of
                                                  select="monogr/imprint/publisher"/></span>, </xsl:if>
                                            <xsl:if test="monogr/imprint/pubPlace">
                                                <span class="pubPlace"><xsl:value-of
                                                  select="monogr/imprint/pubPlace"/></span>, </xsl:if>
                                            <span class="date"><xsl:value-of
                                                  select="monogr/imprint/date"/></span>, <span
                                                class="pages">pp. <xsl:value-of
                                                  select="monogr/biblScope[@unit = 'page']/@from"
                                                  />-<xsl:value-of
                                                  select="monogr/biblScope[@unit = 'page']/@to"
                                                /></span>
                                        </li>
                                    </ul>
                                </div>
                            </xsl:for-each>
                        </div>

                    </div>

                    <!-- Extraction du catalogue -->
                    <div>
                        <h2>
                            <xsl:value-of
                                select="replace(concat(upper-case(substring(./entry/re[@type = 'catalogue']/@type, 1, 1)), substring(./entry/re[@type = 'catalogue']/@type, 2)), '_', ' ')"
                            />
                        </h2>
                        <div>


                            <h3>
                                <i>
                                    <xsl:value-of
                                        select="concat(upper-case(substring(//div/entry/re/note/@type, 1, 1)), substring(//note/@type, 2))"
                                    />
                                </i>
                            </h3>
                            <xsl:for-each select="./entry/re[@type = 'catalogue']/note/node()">
                                <!-- On doit mettre node() pour que cette boucle et les conditions s'appliquent sur tous les noeuds (éléments, attributs, texte...), sans cela cela ne fonctionnerait pas -->
                                <xsl:choose>
                                    <xsl:when test="self::ref">
                                        <i>
                                            <a href="#{@target}">
                                                <xsl:value-of select="."/>
                                            </a>
                                        </i>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="."/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </div>


                        <xsl:for-each select="./entry/re[@type = 'catalogue']/re">
                            <h4>
                                <xsl:value-of
                                    select="replace(concat(upper-case(substring(@type, 1, 1)), substring(@type, 2)), '_', ' ')"
                                />
                            </h4>
                            <xsl:for-each select="./re">
                                <h5>
                                    <xsl:value-of
                                        select="replace(concat(upper-case(substring(@type, 1, 1)), substring(@type, 2)), '_', ' ')"
                                    />
                                </h5>
                                <xsl:for-each select="./re">
                                    <h6>
                                        <xsl:value-of
                                            select="replace(concat(upper-case(substring(@type, 1, 1)), substring(@type, 2)), '_', ' ')"
                                        />
                                    </h6>

                                    <p>
                                        <i>
                                            <xsl:value-of select="./xr"/>
                                        </i>
                                    </p>
                                    <xsl:for-each select="./figure">
                                        <!-- On créé une ancre pour chaque image, ainsi quand elles sont mentionnées dans le commentaire l'utilisateur peut les voir -->
                                        <p>
                                            <xsl:attribute name="id">
                                                <xsl:value-of select="./graphic/@xml:id"/>
                                            </xsl:attribute>
                                            <b><xsl:value-of select="@n"/>. </b>
                                            <xsl:value-of select="./ab"/>
                                        </p>
                                        <p>
                                            <a href="{graphic/@url}">Voir la notice sur Beazley
                                                archive</a>
                                        </p>

                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>




                    </div>

                    <!-- Extraction du commentaire -->

                    <!-- Notons que les numéros auquel fait mention le commentaire "n'existent pas" car nous n'avons pas encodé nos notices en totalité dans le cadre de cet exercice -->
                    <div>
                        <h2>
                            <xsl:value-of
                                select="replace(concat(upper-case(substring(./entry/re[@type = 'commentaire']/@type, 1, 1)), substring(./entry/re[@type = 'commentaire']/@type, 2)), '_', ' ')"
                            />
                        </h2>

                        <div>
                            <xsl:for-each select="./entry/re[@type = 'commentaire']/node()">
                                <!-- On doit mettre node() pour que cette boucle et les conditions s'appliquent sur tous les noeuds (éléments, attributs, texte...), sans cela cela ne fonctionnerait pas -->
                                <!-- Pour éviter que les commentaires soient pris en compte -->
                                <xsl:if test="not(self::comment())">
                                    <xsl:choose>
                                        <!-- Si le nœud est un élément 'name', appliquer le formatage en gras -->
                                        <xsl:when test="self::name">
                                            <b>
                                                <xsl:value-of select="."/>
                                                <xsl:text> </xsl:text>
                                            </b>
                                        </xsl:when>
                                        <!-- Si le nœud est un élément 'persName', appliquer le formatage en italique -->
                                        <xsl:when test="self::persName">
                                            <i>
                                                <xsl:value-of select="."/>
                                            </i>
                                        </xsl:when>

                                        <!-- Traitement pour 'ref', création de lien -->
                                        <xsl:when test="self::ref">

                                            <i>
                                                <a href="#{@target}">
                                                  <xsl:value-of select="."/>
                                                </a>
                                            </i>
                                        </xsl:when>
                                        <!-- Pour les autres nœuds (y compris les nœuds textuels), copier le texte tel quel -->
                                        <xsl:otherwise>
                                            <xsl:value-of select="."/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                            </xsl:for-each>
                        </div>





                    </div>


















                    <xsl:copy-of select="$footer"/>
                </body>

            </html>
        </xsl:result-document>
    </xsl:template>





</xsl:stylesheet>
