# TDWG Ontology

TDWG has a series of RDF and OWL ontology documents with associated documentation. The ontologies described by these documents are known in aggregate as the "TDWG Ontology". They are archived in this repository.

These ontologies are used to define exchange and understanding of biodiversity data. Their original home was at [http://rs.tdwg.org/ontology/voc/Ontology.owl](http://rs.tdwg.org/ontology/voc/Ontology.owl). For background on the history of the ontology see Section 2.4 of the [Report of the TDWG Vocabulary Management Task Group (VoMaG)](https://github.com/tdwg/vocab/blob/master/gbif_TDWG_Vocabulary_Management_Task_Group_en_v1.0.pdf); Permanent URL: [http://www.gbif.org/resource/80862](http://www.gbif.org/resource/80862). 

The TDWG Ontology is no longer under development.  The following individual ontologies do not have well-known alternatives and appear to be in use by at least one provider:

- http://rs.tdwg.org/ontology/voc/Collection
- http://rs.tdwg.org/ontology/voc/CollectionType
- http://rs.tdwg.org/ontology/voc/Common
- http://rs.tdwg.org/ontology/voc/Institution
- http://rs.tdwg.org/ontology/voc/TaxonConcept
- http://rs.tdwg.org/ontology/voc/TaxonName
- http://rs.tdwg.org/ontology/voc/TaxonRank

Other parts of the ontology (listed below) were never widely used and have been deprecated. See the [recommended replacements page](replacements.md) for recommended alternatives to deprecated portions of the ontology. 

Section 2.6.1 of the [VoMaG report)](https://github.com/tdwg/vocab/blob/master/gbif_TDWG_Vocabulary_Management_Task_Group_en_v1.0.pdf) contains a series of recommendations regarding the fate of the various TDWG ontologies. Those recommendations have been implemented and are summarized as follows:

1. Clarify that documents having the extension .owl (TaxonConcept.owl, TaxonName.owl, and TaxonRank.owl) are not the authoritative documents by indicating in their RDF that they are deprecated and replaced by the corresponding documents having the extension .rdf (TaxonConcept.rdf, TaxonName.rdf, and TaxonRank.rdf). (Recommendation 2.4)

2. Remove the XML stylesheet references from all documents. (See the text of Recommendation 2.5 for the rationale for this change.)

3. Deprecate individual ontologies that do not appear to be in use and which may have well-known alternatives.  Those ontologies are:

- http://rs.tdwg.org/ontology/Base
- http://rs.tdwg.org/ontology/Core
- http://rs.tdwg.org/ontology/Taxonomy.owl
- http://rs.tdwg.org/ontology/voc/ContactDetails
- http://rs.tdwg.org/ontology/voc/CyclicityTerm
- http://rs.tdwg.org/ontology/voc/DigitalImage
- http://rs.tdwg.org/ontology/voc/GeographicRegion
- http://rs.tdwg.org/ontology/voc/InstitutionType
- http://rs.tdwg.org/ontology/voc/OccurrenceRecord
- http://rs.tdwg.org/ontology/voc/OccurrenceStatusTerm
- http://rs.tdwg.org/ontology/voc/Person
- http://rs.tdwg.org/ontology/voc/Procedure
- http://rs.tdwg.org/ontology/voc/PublicationCitation
- http://rs.tdwg.org/ontology/voc/SpeciesProfileModel
- http://rs.tdwg.org/ontology/voc/Specimen
- http://rs.tdwg.org/ontology/voc/SPMInfoItems
- http://rs.tdwg.org/ontology/voc/TaxonOccurrence
- http://rs.tdwg.org/ontology/voc/TaxonOccurrenceInteraction
- http://rs.tdwg.org/ontology/voc/Team
- http://rs.tdwg.org/ontology/voc/TeamWithSource

Increment the version of each deprecated ontology by 0.1 and update the dcterms:modified value. (Recommendations 2.7 and 2.8)

4. Document [recommended replacements](replacements.md) for deprecated ontologies and [indicate the replacements in RDF](https://raw.githubusercontent.com/tdwg/ontology/master/replacements.rdf) using the property dcterms:isReplacedBy. **Note: this is a work in progress in consultation with the TDWG RDF/OWL Task Group.**  (Recommendation 2.8)

