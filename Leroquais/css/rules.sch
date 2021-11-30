<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
  
  
  
    <!--  *****************    -->
    <!--    physDesc        -->
    <!--  *****************    -->

    <pattern id="physDesc1">
        <rule context="//tei:msDesc/tei:physDesc" role="error">
            <assert
                test="child::tei:objectDesc and child::tei:decoDesc and child::tei:bindingDesc">
                La description doit contenir une description matérielle, du décor (même absent) et de la reliure (même absente)
            </assert>
        </rule>
    </pattern>
   <!-- <pattern id="physDesc2">
        <rule context="//tei:msDesc/tei:physDesc" role="information">
            <assert
                test="child::tei:handDesc and child::tei:scriptDesc and child::tei:additions ">
                Vérifier description des mains (handDesc), de l'écriture (scriptDesc) et des additions (additions)
            </assert>
        </rule>
    </pattern>-->
    
    
    <!--  *****************    -->
    <!--    objectDesc        -->
    <!--  *****************    -->
    
    
    <pattern id="objectDesc1">
        <rule context="//tei:objectDesc" role="error">
            <assert
                test="child::tei:supportDesc and child::tei:layoutDesc">
                La description doit contenir une description de la matère et de la mise en page
            </assert>
        </rule>
  
        <rule context="//tei:supportDesc" role="error">
            <assert
                test="@material='paper' or @material='parch' or @material='mixed' ">
                Renseigner l'attribut @material avec les valeurs "paper|parch|mixed"
            </assert>
            <assert
                test="@material = 'paper' or @material='parch' or (@material='mixed' and . ='')">
                Préciser l'agencement des matériaux
            </assert>
        </rule>
    
    </pattern>
    
    
    
    
       
    <!--  *****************    -->
    <!--    decoDesc         -->
    <!--  *****************    -->
    
 <!--   <pattern id="decoNote">
        <rule context="//tei:decoNote" role="warning">
            <assert
                test="
                contains(@rend, 'miniature')
                or
                contains(@rend, 'historié')
                or
                contains(@rend, 'orné')
                or
                contains(@rend, 'filigrané')
                or
                contains(@rend, 'encadrement')
                or
                contains(@rend, 'rubrique')
                or
                contains(@rend, 'couleur')
                or
                contains(@rend, 'tableau')
                or
                contains(@rend, 'héraldique')
                or
                contains(@rend, 'pied-de-mouche')
                or
                contains(@rend, 'dessin')
                or
                contains(@rend, 'carte')
                or
                contains(@rend, 'absence')
                or
                contains(@rend, 'gravure')
                "
                > Please specify the type of decoration</assert>
            <!-\-            
            
            Miniatures pleine page 
            Miniatures 
            Initiales historiées 
            Initiales ornées 
            Initiales filigranées 
            Encadrements, bordures 
            Rubriques 
            Lettres de couleur 
            Tableaux, diagrammes 
            Héraldique 
            Pas de décor -\->
        </rule>
    </pattern>
    
 --> 
<!--  *****************    -->
<!--    HISTORY         -->
<!--  *****************    -->
    
    <pattern id="provenance">
        <rule context="//tei:provenance" role="warning">
            <assert
                test="
                    (child::tei:orgName
                    or child::tei:placeName
                    or child::tei:persName)
                    and child::tei:p"
                > Provenance must contain (orgName or placeName or persName) and (p)</assert>
        </rule>
        <rule context="//tei:provenance/tei:p" role="warning">
            <assert
                test="
                    count(tei:locus or tei:bibl) = 1
                    and count(tei:q or tei:desc) = 1
                    and count(tei:date)"
                >p in provenance must have following elements: locus or bibl, date, and either q or
                desc if non textual source</assert>
            <assert
                test="
                    (*[1] = tei:locus or *[1] = tei:bibl)
                    and *[2] = tei:date
                    and (*[3] = tei:q or *[3] = tei:desc)"
                >Following order must be respected: locus/bibl, date, q/desc</assert>
        </rule>
    </pattern>
    <pattern id="locus">
        <rule context="//tei:locus" role="information">
            <assert
                test="
                matches(@n, '^([\d]+[rv][abcd]*)$')
                    or matches(@from, '^([\d]+[rv])([abcd])*$')
                    or matches(@to, '^([\d]+[rv])([abcd])*$')
                    or matches(., '^([A-K\d]+[rv])([abcd])*([\-]([A-K\d]*)([rv])([abcd]*))*$')
                    or contains(., 'reliure')
                    or starts-with(., 'Reliure')
                    or contains(., 'garde')
                    or starts-with(., 'Garde')
                    or contains(., 'contreplat')
                    or starts-with(., 'Contreplat')
                    or contains(., 'plat')
                    or starts-with(., 'Plat')
                    or contains(., 'passim')
                    or starts-with(., 'Passim')"
                > Vérifier la foliotation </assert>
        </rule>
    </pattern>
    <pattern id="bibl">
        <rule context="//tei:bibl" role="information">
            <assert test="@sameAs or @type = 'CoteMedium' or @type = 'BAPSO'"> Vérifier les
                attributs de cette référence bibliographique </assert>
        </rule>
        </pattern>
    <pattern id="bibl2">
        <rule context="//tei:bibl/@sameAs" role="error">

            <assert test="substring-after(., '#') = document('../notices/biblio-saint-omer.xml')//tei:biblStruct/@xml:id">
                Cette référence n'est pas dans la bibliographie4
               
            </assert>
        </rule>
        
    </pattern>
    <pattern id="msItem">
        <rule context="//tei:msItem" role="warning">
            <assert
                test="*[1] = tei:locus">L'élément msItem doit commencer par l'indication des feuillets</assert>
            <assert test="tei:title or tei:rubric or tei:incipit">Un élément msItem doit contenir au moins un titre ou, à défaut, une rubrique (titre initial, &lt;rubric>) et/ou un incipit</assert>
        </rule>
    </pattern>
    
    

</schema>
