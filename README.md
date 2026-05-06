# TDWG Ontology

TDWG has created a series of RDF and OWL ontology documents with associated documentation. The ontologies described by these documents are known in aggregate as the "TDWG Ontology". These ontologies are no longer under development and the documents are archived in this repository.  

Although none of the TDWG ontologies ever became TDWG Standards, some are in use in the wild. It is not recommended that new projects use them.

## License

The ontologies and all other documents in this repository are available under TDWG's standard license: [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

## Background

The TDWG ontologies were intended to facilitate understanding and exchange of biodiversity data. Their original home was at [http://rs.tdwg.org/ontology/voc/Ontology.owl](http://rs.tdwg.org/ontology/voc/Ontology.owl). For a detailed history of the ontology see Section 2.4 of the [Report of the TDWG Vocabulary Management Task Group (VoMaG)](https://github.com/tdwg/vocab/blob/master/gbif_TDWG_Vocabulary_Management_Task_Group_en_v1.0.pdf); Permanent URL: [http://www.gbif.org/resource/80862](http://www.gbif.org/resource/80862). 

## Replacements for deprecated components of the TDWG Ontology that have been used in the past

The following individual ontologies appear to be in use by at least one provider in the past. However, as of 2026, there are new TDWG standards whose terms should be used in lieu of the terms described by these ontologies.

Ontology components replaced by the Latimer Core vocabulary at <http://rs.tdwg.org/ltc/doc/list/>:
- [http://rs.tdwg.org/ontology/voc/Collection](ontology/voc/Collection.rdf)
- [http://rs.tdwg.org/ontology/voc/CollectionType](ontology/voc/CollectionType.rdf)
- [http://rs.tdwg.org/ontology/voc/Institution](ontology/voc/Institution.rdf)

Ontology components replaced the Taxon Concept Schema (TCS) vocabulary (2025-12-11 verson or later) at <http://rs.tdwg.org/tcs/doc/terms/>:
- [http://rs.tdwg.org/ontology/voc/TaxonConcept](ontology/voc/TaxonConcept.rdf)
- [http://rs.tdwg.org/ontology/voc/TaxonName](ontology/voc/TaxonName.rdf)
- [http://rs.tdwg.org/ontology/voc/TaxonRank](ontology/voc/TaxonRank.rdf)
- [http://rs.tdwg.org/ontology/voc/Common](ontology/voc/Common.rdf)

## Other deprecated components of the TDWG Ontology

The following parts of the ontology were never widely used and have been deprecated:  

- [http://rs.tdwg.org/ontology/Base](ontology/Base.rdf)
- [http://rs.tdwg.org/ontology/Core](ontology/Core.rdf)
- [http://rs.tdwg.org/ontology/Taxonomy.owl](ontology/Taxonomy.owl)
- [http://rs.tdwg.org/ontology/voc/ContactDetails](ontology/voc/ContactDetails.rdf)
- [http://rs.tdwg.org/ontology/voc/CyclicityTerm](ontology/voc/CyclicityTerm.rdf)
- [http://rs.tdwg.org/ontology/voc/DigitalImage](ontology/voc/DigitalImage.rdf)
- [http://rs.tdwg.org/ontology/voc/GeographicRegion](ontology/voc/GeographicRegion.rdf)
- [http://rs.tdwg.org/ontology/voc/InstitutionType](ontology/voc/InstitutionType.rdf)
- [http://rs.tdwg.org/ontology/voc/OccurrenceRecord](ontology/voc/OccurrenceRecord.rdf)
- [http://rs.tdwg.org/ontology/voc/OccurrenceStatusTerm](ontology/voc/OccurrenceStatusTerm.rdf)
- [http://rs.tdwg.org/ontology/voc/Person](ontology/voc/Person.rdf)
- [http://rs.tdwg.org/ontology/voc/Procedure](ontology/voc/Procedure.rdf)
- [http://rs.tdwg.org/ontology/voc/PublicationCitation](ontology/voc/PublicationCitation.rdf)
- [http://rs.tdwg.org/ontology/voc/SpeciesProfileModel](ontology/voc/SpeciesProfileModel.rdf)
- [http://rs.tdwg.org/ontology/voc/Specimen](ontology/voc/Specimen.rdf)
- [http://rs.tdwg.org/ontology/voc/SPMInfoItems](ontology/voc/SPMInfoItems.rdf)
- [http://rs.tdwg.org/ontology/voc/TaxonOccurrence](ontology/voc/TaxonOccurrence.rdf)
- [http://rs.tdwg.org/ontology/voc/TaxonOccurrenceInteraction](ontology/voc/TaxonOccurrenceInteraction.rdf)
- [http://rs.tdwg.org/ontology/voc/Team](ontology/voc/Team.rdf)
- [http://rs.tdwg.org/ontology/voc/TeamWithSource](ontology/voc/TeamWithSource.rdf)
 

## Details of modifications made to the TDWG ontologies based on the VoMaG Report

Section 2.6.1 of the [VoMaG report)](https://github.com/tdwg/vocab/blob/master/gbif_TDWG_Vocabulary_Management_Task_Group_en_v1.0.pdf) contains a series of recommendations regarding the fate of the various TDWG ontologies. Those recommendations have been implemented and are summarized as follows:

1. Clarify that documents having the extension .owl (TaxonConcept.owl, TaxonName.owl, and TaxonRank.owl) are not the authoritative documents by indicating in their RDF that they are deprecated and replaced by the corresponding documents having the extension .rdf (TaxonConcept.rdf, TaxonName.rdf, and TaxonRank.rdf). (Recommendation 2.4)

2. Remove the XML stylesheet references from all documents. (See the text of Recommendation 2.5 for the rationale for this change.)

3. Deprecate individual ontologies that do not appear to be in use and which may have well-known alternatives (listed above).  Increment the version of each deprecated ontology by 0.1 and update the dcterms:modified value. (Recommendations 2.7 and 2.8)

4. Document [recommended replacements](replacements.md) for deprecated ontologies and [indicate the replacements in RDF](https://raw.githubusercontent.com/tdwg/ontology/master/replacements.rdf) using the property dcterms:isReplacedBy. **Note: this has not been completed and is not likely to be done at any point in the future.**  (Recommendation 2.8)

5. Remove rdfs:subClassOf relationships that link classes of the non-deprecated ontologies to deprecated external ontologies. Increment the version of each modified ontology by 0.1 and update the dcterms:modified value. (Recommendation 2.7 and 2.9)

6. The Collection, CollectionType, and Institution ontologies were based on the stalled Natural Collections Description (NCD) draft TDWG standard [http://www.tdwg.org/standards/312/](http://www.tdwg.org/standards/312/). Recommendation 2.10 of the [VoMaG report](https://github.com/tdwg/vocab/blob/master/gbif_TDWG_Vocabulary_Management_Task_Group_en_v1.0.pdf) recommends evaluation of the status of the draft NCD standard. The NCD work was replaced by the Latimer Core standard, which is now ratified. So these ontologies are now deprecated.

7. The TaxonConcept, TaxonName, and TaxonRank ontologies were based on the ratified Taxonomic Concept Transfer Schema (TCS) Current (2005) TDWG Standard [http://www.tdwg.org/standards/117/](http://www.tdwg.org/standards/117/).  Recommendation 2.11 of the [VoMaG report](https://github.com/tdwg/vocab/blob/master/gbif_TDWG_Vocabulary_Management_Task_Group_en_v1.0.pdf) recommends examination of the status of these three ontologies with the possibility of replacing them upon the creation of a new TCS standard based on current Linked Data/Semantic Web best practices.  With the ratification of the 2025-12-11 version of TCS, these ontologies are now deprecated.
