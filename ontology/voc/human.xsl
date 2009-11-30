<?xml version="1.0" encoding="UTF-8"?>
<!-- $Rev: 1321 $ -->
<!-- $Date: 2007-09-10 16:23:32 +0100 (Mon, 10 Sep 2007) $ -->
<!-- $Author: RogerHyam $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" version="1.0"
     xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dc="http://purl.org/dc/elements/1.1/"
     xmlns:tcom="http://rs.tdwg.org/ontology/voc/Common#" xmlns:owl="http://www.w3.org/2002/07/owl#"
     xmlns:tbase="http://rs.tdwg.org/ontology/Base#">
     <xsl:output method="html" encoding="UTF-8" indent="yes"/>
     <xsl:variable name="wikiPrefix">http://wiki.tdwg.org/twiki/bin/view/TAG/OntDiscuss</xsl:variable>
     <xsl:variable name="ontologyName">
          <xsl:choose>
               <xsl:when test="contains(/rdf:RDF/owl:Ontology/@rdf:about, '/ontology/voc/')">
                    <xsl:value-of
                         select="substring-after(/rdf:RDF/owl:Ontology/@rdf:about, '/ontology/voc/')"
                    />
               </xsl:when>
               <xsl:otherwise>
                    <xsl:value-of
                         select="substring-after(/rdf:RDF/owl:Ontology/@rdf:about, '/ontology/')"/>
               </xsl:otherwise>
          </xsl:choose>
     </xsl:variable>
     <xsl:template match="rdf:RDF">
          <html>
               <head>
                    <title><xsl:value-of select="$ontologyName"/> - Vocabulary</title>
                    <link rel="stylesheet" type="text/css" href="human.css"/>
               </head>
               <body>
                    <div class="container">

                         <div id="RDF-header">
                              <div id="logoBox">
                                   <a href="http://www.tdwg.org">
                                        <img src="images/logo_RDF.gif" alt="TDWG logo" width="117"
                                             height="67" border="0" id="logo"/>
                                   </a>
                              </div>
                              <div id="RDF-header-title"> TDWG LSID Vocabularies </div>
                         </div>

                         <div id="RDF-title-bar">
                              <img src="images/left-bar-top.gif" alt="left bar top"/>
                         </div>

                         <div id="left-bar">
                              <div id="left-bar-menu">
                                   <a href="http://www.tdwg.org">TDWG home</a>
                                   <div class="separator"><hr/></div>
                                   <a href="http://wiki.tdwg.org/twiki/bin/view/TAG/LsidVocs">LSID Vocs Docs</a>
                                   <div class="separator"><hr/></div>
                                   <a href="http://rs.tdwg.org/ontology/voc/Collection">Collection</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/CollectionType">CollectionType</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/Common">Common</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/ContactDetails">ContactDetails</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/CyclicityTerm">CyclicityTerm</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/DigitalImage">DigitalImage</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/GeographicRegion">GeographicRegion</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/Institution">Institution</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/InstitutionType">InstitutionType</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/OccurrenceStatusTerm">OccurrenceStatusT.</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/Person">Person</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/Procedure">Procedure</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/PublicationCitation">PublicationCitation</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/SPMInfoItems">SPMInfoItems</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/SpeciesProfileModel">SpeciesProfileModel</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/Specimen">Specimen</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/TaxonConcept">TaxonConcept</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/TaxonName">TaxonName</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/TaxonOccurrence">TaxonOccurrence</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/TaxonOccurrenceInteraction">T.O.Interaction</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/TaxonRank">TaxonRank</a><br/>
                                   <a href="http://rs.tdwg.org/ontology/voc/Team">Team</a><br/>
                              </div>
                         </div>

                         <div id="RDF-main">

                              <h1>
                                   <xsl:value-of select="owl:Ontology/dc:title"/>
                              </h1>
                              <p>(This is an HTML view of the OWL/RDF vocabulary. Use View-Source to
                                   see the underlying RDF.) </p>
                              <xsl:apply-templates select="owl:Ontology"/>
                              <xsl:apply-templates select="owl:Class"/>
                              <xsl:if
                                   test="//rdf:RDF/owl:ObjectProperty[not(rdfs:domain/@rdf:resource)]">
                                   <h3>Top Level Data Properties</h3>
                                   <div class="TopProperties">
                                        <xsl:apply-templates
                                             select="//rdf:RDF/owl:DatatypeProperty[not(rdfs:domain/@rdf:resource)]">
                                             <xsl:sort select="@rdf:ID"/>
                                        </xsl:apply-templates>
                                   </div>
                              </xsl:if>
                              <xsl:if
                                   test="//rdf:RDF/owl:ObjectProperty[not(rdfs:domain/@rdf:resource)]">
                                   <h3>Top Level Object Properties</h3>
                                   <div class="TopProperties">
                                        <xsl:apply-templates
                                             select="//rdf:RDF/owl:ObjectProperty[not(rdfs:domain/@rdf:resource)]">
                                             <xsl:sort select="@rdf:ID"/>
                                        </xsl:apply-templates>
                                   </div>
                              </xsl:if>
                         </div>
                    </div>
               </body>
          </html>
     </xsl:template>
     <xsl:template match="owl:Ontology">
          <h2>Ontology: <xsl:value-of select="dc:title"/></h2>
          <dl>
               <dt>Location</dt>
               <dd>
                    <a>
                         <xsl:attribute name="href">
                              <xsl:value-of select="@rdf:about"/>
                         </xsl:attribute>
                         <xsl:value-of select="@rdf:about"/>
                    </a>
               </dd>
               <xsl:apply-templates select="*"/>

          </dl>
          <dl>
               <dt>
                    <a>
                         <xsl:attribute name="href">
                              <xsl:value-of select="concat($wikiPrefix, $ontologyName)"/>
                         </xsl:attribute> Discussion Page. </a>
               </dt>
               <dd>Discussions related to this vocabulary on the wiki.</dd>
          </dl>

     </xsl:template>


     <xsl:template match="owl:Class">

          <xsl:variable name="currentClass">
               <xsl:value-of select="concat('#', @rdf:ID)"/>
          </xsl:variable>

          <a>
               <xsl:attribute name="name">
                    <xsl:value-of select="@rdf:ID"/>
               </xsl:attribute>
          </a>

          <h2>Class: <xsl:value-of select="@rdf:ID"/>
               <xsl:value-of select="@rdf:about"/>
          </h2>
          <xsl:if
               test="count(//rdf:RDF/owl:*[rdfs:domain/@rdf:resource =                $currentClass]) &gt; 0">
               <table>
                    <tr>
                         <th>Property Name</th>
                         <th>Range</th>
                         <th>Comment</th>
                    </tr>
                    <xsl:apply-templates mode="table-row"
                         select="//rdf:RDF/owl:*[rdfs:domain/@rdf:resource =                     $currentClass]">
                         <xsl:sort select="@rdf:ID"/>
                    </xsl:apply-templates>
               </table>
          </xsl:if>
          <dl>
               <xsl:apply-templates select="rdfs:*"/>
          </dl>

          <dl>
               <xsl:apply-templates select="tcom:*"/>
          </dl>
          <dl>
               <dt>
                    <a href="http://rs.tdwg.org/ontology/voc/Common.rdf">Common Properties</a>
               </dt>
               <dd>Common properties defined in <a href="http://rs.tdwg.org/ontology/voc/Common.rdf"
                         >http://rs.tdwg.org/ontology/voc/Common.rdf</a> are available for use in
                    this class.</dd>
          </dl>
          <dl>
               <dt>
                    <a>
                         <xsl:attribute name="href">
                              <xsl:value-of select="concat($wikiPrefix, $ontologyName ,@rdf:ID)"/>
                         </xsl:attribute> Discussion Page. </a>
               </dt>
               <dd>Discussions related to this class on the wiki.</dd>
          </dl>


          <div class="ClassProperties">

               <xsl:apply-templates
                    select="//rdf:RDF/owl:*[rdfs:domain/@rdf:resource =                $currentClass]">
                    <xsl:sort select="@rdf:ID"/>
               </xsl:apply-templates>

          </div>

          <xsl:variable name="className">
               <xsl:value-of select="@rdf:ID"/>
          </xsl:variable>

          <div class="ClassIndividuals">
               <xsl:if test="count(//*[name(.) = $className]) &gt; 0">
                    <table>
                         <tr>
                              <th>Term</th>
                              <th>Definition</th>
                         </tr>
                         <xsl:apply-templates mode="individual-table-row"
                              select="//*[name(.) = $className]">
                              <xsl:sort select="@rdf:ID"/>
                         </xsl:apply-templates>
                    </table>
               </xsl:if>
               <xsl:apply-templates select="//*[name(.) = $className]" mode="individual"/>
          </div>

     </xsl:template>

     <xsl:template match="*" mode="individual">
          <a>
               <xsl:attribute name="name">
                    <xsl:value-of select="@rdf:ID"/>
               </xsl:attribute>
          </a>
          <h3>Term: <xsl:value-of select="@rdf:ID"/></h3>
          <xsl:apply-templates select="*"/>
     </xsl:template>

     <xsl:template match="*" mode="individual-table-row">
          <tr>
               <td>
                    <a>
                         <xsl:attribute name="href">
                              <xsl:value-of select="concat('#',@rdf:ID)"/>
                         </xsl:attribute>
                         <xsl:value-of select="@rdf:ID"/>
                    </a>
               </td>
               <td>
                    <xsl:value-of select="tbase:definition"/>
               </td>
          </tr>
     </xsl:template>

     <xsl:template match="owl:DatatypeProperty">
          <a>
               <xsl:attribute name="name">
                    <xsl:value-of select="@rdf:ID"/>
               </xsl:attribute>
          </a>
          <h3>Data Property: <xsl:choose>
                    <xsl:when test="substring(rdfs:domain/@rdf:resource,2)">
                         <xsl:value-of select="substring(rdfs:domain/@rdf:resource,2)"/>
                    </xsl:when>
                    <xsl:otherwise>*</xsl:otherwise>
               </xsl:choose> -&gt; <xsl:value-of select="@rdf:ID"/></h3>



          <xsl:if test="descendant::rdfs:*">
               <dl>
                    <xsl:apply-templates select="rdfs:*"/>
               </dl>
          </xsl:if>

          <xsl:if test="descendant::tcom:*">
               <dl>
                    <xsl:apply-templates select="tcom:*"/>
               </dl>
          </xsl:if>

          <xsl:if test="descendant::dc:*">
               <dl>
                    <xsl:apply-templates select="dc:*"/>
               </dl>
          </xsl:if>


          <xsl:if test="descendant::owl:*">
               <dl>
                    <xsl:apply-templates select="owl:*"/>
               </dl>
          </xsl:if>

          <dl>
               <dt>
                    <a>
                         <xsl:attribute name="href">
                              <xsl:value-of
                                   select="concat($wikiPrefix, $ontologyName, substring(rdfs:domain/@rdf:resource,2) ,@rdf:ID)"
                              />
                         </xsl:attribute> Discussion Page. </a>
               </dt>
               <dd>Discussions related to this property on the wiki.</dd>
          </dl>
     </xsl:template>

     <xsl:template match="owl:ObjectProperty">
          <a>
               <xsl:attribute name="name">
                    <xsl:value-of select="@rdf:ID"/>
               </xsl:attribute>
          </a>
          <h3>Object Property: <xsl:choose>
                    <xsl:when test="substring(rdfs:domain/@rdf:resource,2)">
                         <xsl:value-of select="substring(rdfs:domain/@rdf:resource,2)"/>
                    </xsl:when>
                    <xsl:otherwise>*</xsl:otherwise>
               </xsl:choose> -&gt; <xsl:value-of select="@rdf:ID"/></h3>

          <xsl:if test="descendant::rdfs:*">
               <dl>
                    <xsl:apply-templates select="rdfs:*"/>
               </dl>
          </xsl:if>
          <xsl:if test="descendant::tcom:*">
               <dl>
                    <xsl:apply-templates select="tcom:*"/>
               </dl>
          </xsl:if>
          <xsl:if test="descendant::dc:*">
               <dl>
                    <xsl:apply-templates select="dc:*"/>
               </dl>
          </xsl:if>
          <xsl:if test="descendant::owl:*">
               <dl>
                    <xsl:apply-templates select="owl:*"/>
               </dl>
          </xsl:if>
          <dl>
               <dt>
                    <a>
                         <xsl:attribute name="href">
                              <xsl:value-of
                                   select="concat($wikiPrefix, $ontologyName, substring(rdfs:domain/@rdf:resource,2) ,@rdf:ID)"
                              />
                         </xsl:attribute> Discussion Page. </a>
               </dt>
               <dd>Discussions related to this property on the wiki.</dd>
          </dl>
     </xsl:template>

     <!-- Common Properties -->
     <xsl:template match="tcom:tcsEquivalence">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://rs.tdwg.org/ontology/voc/Common#tcsEquivalence</xsl:attribute> TCS
                    Equivalent</a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>

     <xsl:template match="tcom:berlinModelEquivalence">
          <dt>
               <a>
                    <xsl:attribute name="href"
                         >http://rs.tdwg.org/ontology/voc/Common#berlinModelEquivalence</xsl:attribute>
                    Berlin Model Equivalent</a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>

     <xsl:template match="tcom:abcdEquivalence">
          <dt>
               <a>
                    <xsl:attribute name="href"
                         >http://rs.tdwg.org/ontology/voc/Common#abcdEquivalence</xsl:attribute>
                    ABCD Equivalent</a>

          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>

     <xsl:template match="tcom:darwinCoreEquivalence">
          <dt>
               <a>
                    <xsl:attribute name="href"
                         >http://rs.tdwg.org/ontology/voc/Common#darwinCoreEquivalence</xsl:attribute>
                    DarwinCore Equivalent</a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>


     <!-- RDFS links -->
     <xsl:template match="rdfs:label">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://www.w3.org/2000/01/rdf-schema#label</xsl:attribute> Label </a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>

     <xsl:template match="rdfs:comment">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://www.w3.org/2000/01/rdf-schema#comment</xsl:attribute> Comment </a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>

     <xsl:template match="rdfs:isDefinedBy">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://www.w3.org/2000/01/rdf-schema#isDefinedBy</xsl:attribute> Is Defined By
               </a>
          </dt>
          <dd>
               <a>
                    <xsl:attribute name="href">
                         <xsl:value-of select="./@rdf:resource"/>
                    </xsl:attribute>
                    <xsl:value-of select="./@rdf:resource"/>
               </a>
          </dd>
     </xsl:template>

     <xsl:template match="rdfs:subClassOf">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://www.w3.org/2000/01/rdf-schema#subClassOf</xsl:attribute> Sub Class Of
               </a>
          </dt>
          <dd>
               <a>
                    <xsl:attribute name="href">
                         <xsl:value-of select="./@rdf:resource"/>
                    </xsl:attribute>
                    <xsl:value-of select="./@rdf:resource"/>
               </a>
          </dd>
     </xsl:template>
     <xsl:template match="rdfs:range">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://www.w3.org/2000/01/rdf-schema#range</xsl:attribute> Range </a>
          </dt>
          <dd>
               <a>
                    <xsl:attribute name="href">
                         <xsl:value-of select="./@rdf:resource"/>
                    </xsl:attribute>
                    <xsl:value-of select="./@rdf:resource"/>
               </a>
          </dd>
     </xsl:template>

     <xsl:template match="rdfs:domain">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://www.w3.org/2000/01/rdf-schema#domain</xsl:attribute> Class </a>
          </dt>
          <dd>
               <a>
                    <xsl:attribute name="href">
                         <xsl:value-of select="./@rdf:resource"/>
                    </xsl:attribute>
                    <xsl:value-of select="./@rdf:resource"/>
               </a>
          </dd>
     </xsl:template>

     <!-- DC Links -->
     <xsl:template match="dc:title">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://purl.org/dc/elements/1.1/title</xsl:attribute>Title</a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>
     <xsl:template match="dc:creator">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://purl.org/dc/elements/1.1/creator</xsl:attribute>Creator</a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>

     <xsl:template match="dc:publisher">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://purl.org/dc/elements/1.1/publisher</xsl:attribute>Publisher</a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>

     <xsl:template match="dc:description">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://purl.org/dc/elements/1.1/description</xsl:attribute>Description</a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>

     <xsl:template match="dc:relation">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://purl.org/dc/elements/1.1/relation/</xsl:attribute>Relation</a>
          </dt>
          <dd>
               <a>
                    <xsl:attribute name="href">
                         <xsl:value-of select="./@rdf:resource"/>
                    </xsl:attribute>
                    <xsl:value-of select="./@rdf:resource"/>
               </a>
          </dd>
     </xsl:template>

     <xsl:template match="dcterms:issued">
          <dt>
               <a>
                    <xsl:attribute name="href"
               >http://purl.org/dc/terms/issued</xsl:attribute>Issued</a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>

     <xsl:template match="dcterms:modified">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://purl.org/dc/terms/modified</xsl:attribute>Modified</a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>

     <!-- OWL links -->
     <xsl:template match="owl:versionInfo">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://www.w3.org/2002/07/owl#versionInfo</xsl:attribute>Version Info</a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>
     <xsl:template match="owl:sameAs">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://www.w3.org/2002/07/owl#sameAs</xsl:attribute>Same As</a>
          </dt>
          <dd>
               <a>
                    <xsl:attribute name="href">
                         <xsl:value-of select="@rdf:resource"/>
                    </xsl:attribute>
                    <xsl:value-of select="@rdf:resource"/>
               </a>

          </dd>
     </xsl:template>


     <!-- tbase links -->
     <xsl:template match="tbase:definition">
          <dt>
               <a>
                    <xsl:attribute name="href"
                    >http://rs.tdwg.org/ontology/Base#definition</xsl:attribute>Definition</a>
          </dt>
          <dd>
               <xsl:value-of select="."/>
          </dd>
     </xsl:template>

     <xsl:template mode="table-row" match="owl:DatatypeProperty">
          <tr>
               <td>
                    <a>
                         <xsl:attribute name="href">
                              <xsl:value-of select="concat('#',@rdf:ID)"/>
                         </xsl:attribute>
                         <xsl:value-of select="@rdf:ID"/>
                    </a>
               </td>
               <td>
                    <xsl:value-of select="substring-after(rdfs:range/@rdf:resource, '#')  "/>
               </td>
               <td>
                    <xsl:value-of select="rdfs:comment"/>
               </td>
          </tr>
     </xsl:template>


     <xsl:template mode="table-row" match="owl:ObjectProperty">
          <tr>
               <td>
                    <a>
                         <xsl:attribute name="href">
                              <xsl:value-of select="concat('#',@rdf:ID)"/>
                         </xsl:attribute>
                         <xsl:value-of select="@rdf:ID"/>
                    </a>
               </td>
               <td>
                    <a>
                         <xsl:attribute name="href">
                              <xsl:value-of select="rdfs:range/@rdf:resource"/>
                         </xsl:attribute>
                         <xsl:value-of select="substring-after(rdfs:range/@rdf:resource, '#')  "/>
                    </a>
               </td>
               <td>
                    <xsl:value-of select="rdfs:comment"/>
               </td>
          </tr>
     </xsl:template>

</xsl:stylesheet>
