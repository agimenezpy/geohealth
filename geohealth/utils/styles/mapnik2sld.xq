xquery version "1.0";

(:~
: User: agimenez
: Date: 27/07/14
: Time: 14:53
: To change this template use File | Settings | File Templates.
:)

import module namespace fnp = "http://mapnik2sld.org/procesors" at "procesors.xq";
declare default element namespace "http://www.opengis.net/sld";
declare namespace ns0 = "http://mapnik2sld.org";
declare namespace ns1 = "http://mapnik.org";


declare function ns0:Mapnik2SLD($map_element as element(ns1:Map), $layer_name as xs:string) as
element (StyledLayerDescriptor) {
    <StyledLayerDescriptor version="1.0.0"
    xmlns:ogc="http://www.opengis.net/ogc"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd">
        {
            for $layer in $map_element/ns1:Layer where $layer[@name=$layer_name] return
            <NamedLayer>
                <Name>{xs:string($layer/@name) }</Name>
                <UserStyle>
                    <Name>{xs:string($layer/@name)}</Name>
                { for $title in $fnp:mappings/fnp:Map[fnp:Type='LAYER_TITLE' and fnp:Code=$layer/@name] return
                    <Title>{ $title/fnp:Value/text() }</Title>}
                {
                for $styleName in $layer/ns1:StyleName
                let $style := $map_element/ns1:Style[@name = $styleName] return
                if (fn:count($style/*) > 0) then
                        <FeatureTypeStyle>
                        <Name>{xs:string($style/@name)}</Name>
                        {
                            for $rule in $style/ns1:Rule return
                            <Rule>
                                { for $rname in $fnp:mappings/fnp:Map[fnp:Type='RULE_NAME' and fnp:Code=$style/@name] return
                                   <Name>{ fnp:get_rule_name($rname/fnp:Value/text(), $rule)}</Name> }
                                { for $element in $rule/ns1:Filter return
                                    fnp:process_filter($element) }
                                { for $element in $rule/ns1:MinScaleDenominator return
                                    fnp:process_tag(xs:QName('MinScaleDenominator'), $element) }
                                { for $element in $rule/ns1:MaxScaleDenominator return
                                    fnp:process_tag(xs:QName('MaxScaleDenominator'), $element) }
                                { for $element in $rule/ns1:MarkersSymbolizer return
                                    fnp:process_marker($element) }
                                { for $element in $rule/ns1:LineSymbolizer return
                                    fnp:process_line($element) }
                                { for $element in $rule/ns1:PolygonSymbolizer return
                                    fnp:process_polygon($element) }
                                { for $element in $rule/ns1:TextSymbolizer return
                                    fnp:process_text($layer/@name, $element, $map_element) }
                            </Rule>
                        }
                        </FeatureTypeStyle>
                else ()
                }
                </UserStyle>
            </NamedLayer>
        }
    </StyledLayerDescriptor>
};

declare variable $input_doc as xs:string external;
declare variable $layer_name as xs:string external;

(:trace(fn:tokenize("([NAME] + 1)", '>=|<=|[=><]'), "text"):)
ns0:Mapnik2SLD(fn:doc($input_doc)/node(), $layer_name)