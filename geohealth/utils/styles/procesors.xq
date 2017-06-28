xquery version "1.0";

(:~
: User: agimenez
: Date: 27/07/14
: Time: 16:36
: To change this template use File | Settings | File Templates.
:)

module namespace fnp = "http://mapnik2sld.org/procesors";
declare default element namespace "http://www.opengis.net/sld";
import module namespace functx = "http://www.functx.com" at "functx.xq";
declare namespace ogc = "http://www.opengis.net/ogc";
declare namespace ns0 = "http://mapnik2sld.org";
declare namespace ns1 = "http://mapnik.org";

declare variable $fnp:mappings as element() := fn:doc('mapping.xml')/fnp:Mapping;

declare function fnp:mScaleTogScale($scale as xs:string) as xs:integer {
    let $scale := $scale return
        if ($scale = '1000000000') then 559081144
        else if ($scale = '500000000') then 279540572
        else if ($scale = '200000000') then 139770286
        else if ($scale = '100000000') then 69885143
        else if ($scale = '50000000') then 34942571
        else if ($scale = '25000000') then 17471285
        else if ($scale = '12500000') then 8735642
        else if ($scale = '6500000') then 4367821
        else if ($scale = '3000000') then 2183910
        else if ($scale = '1500000') then 1091955
        else if ($scale = '750000') then 545977
        else if ($scale = '400000') then 272988
        else if ($scale = '200000') then 136494
        else if ($scale = '100000') then 68247
        else if ($scale = '50000') then 34123
        else if ($scale = '25000') then 17061
        else if ($scale = '12500') then 8530
        else if ($scale = '5000') then 4265
        else if ($scale = '2500') then 2132
        else if ($scale = '1500') then 1066
        else if ($scale = '750') then 533
        else if ($scale = '500') then 266
        else if ($scale = '250') then 133
        else if ($scale = '100') then 66
        else 0
};

declare function fnp:get_operator($operator as xs:string) as xs:QName {
     let $op := $operator return
        if ($op = '=') then xs:QName('ogc:PropertyIsEqualTo')
        else if ($op = '!=') then xs:QName('ogc:PropertyIsNotEqualTo')
        else if ($op = '<') then xs:QName('ogc:PropertyIsLessThan')
        else if ($op = '<=') then xs:QName('ogc:PropertyIsLessThanOrEqualTo')
        else if ($op = '>') then xs:QName('ogc:PropertyIsGreaterThan')
        else if ($op = '>=') then xs:QName('ogc:PropertyIsGreaterThanOrEqualTo')
        else xs:QName('ogc:PropertyIsEqualTo')
};

declare function fnp:get_var($var as xs:string) as xs:string {
    for $ret in functx:trim(fn:replace($var, '[\[\]]', ''))
    let $maps := $fnp:mappings/fnp:Map[fnp:Type='FIELD_NAME' and fnp:Code=$ret] return
        if (fn:concat($maps/fnp:Value/text(), '') != '') then
            $maps/fnp:Value/text()
        else
            $ret
};

declare function fnp:get_literal($literal as xs:string) as xs:string {
    let $ret := 1 return
        functx:trim(fn:replace($literal, '[''"]', ''))
};

declare function fnp:get_exp($exp as xs:string) as element()* {
    let $operator := functx:get-matches($exp, '>=|<=|[=><]') return
        let $expr := fn:tokenize(fn:replace($exp, '[()]', ''), $operator[2]) return
            element {fnp:get_operator($operator[2])} {
             (<ogc:PropertyName>
                {fnp:get_var($expr[1])}
             </ogc:PropertyName>,
             <ogc:Literal>
                {fnp:get_literal($expr[2])}
             </ogc:Literal>)}
};

declare function fnp:get_op($exp as xs:string, $oper as xs:string) as element()* {
  let $isComp := fn:contains($exp, fn:concat(' ', $oper, ' ')) return
      if ($isComp = true() and $oper = 'or') then
        element {xs:QName('ogc:Or')} {
            for $expr in fn:tokenize($exp, fn:concat(' ', $oper, ' ')) return
                fnp:get_op($expr, 'and')
        }
      else if ($isComp = true() and $oper = 'and') then
        element {xs:QName('ogc:And')} {
            for $expr in fn:tokenize($exp, fn:concat(' ', $oper, ' ')) return
                fnp:get_exp($expr)
        }
      else
        fnp:get_exp($exp)
};

declare function fnp:get_rule_name($name as xs:string, $rule as element(ns1:Rule)) as xs:string {
    let $max := fn:concat($rule/ns1:MaxScaleDenominator/text(), ''),
        $min := fn:concat($rule/ns1:MinScaleDenominator/text(), ''),
        $filtro := fn:concat($rule/ns1:Filter/text(), '')
        return
        if ($filtro != '') then
            fnp:get_op($filtro, 'or')/ogc:Literal/text()
        else if ($max != '' and $min != '') then
            fn:concat($name, ' en ', fnp:get_scale($max), ' y ', fnp:get_scale($min))
        else if ($max != '') then
            fn:concat($name, ' < ', fnp:get_scale($max))
        else if ($min != '') then
            fn:concat($name, ' > ', fnp:get_scale($min))
        else
            ''

};

declare function fnp:get_scale($scale as xs:string) as xs:string {
    let $dscale := xs:integer($scale) return
        if ($dscale >= 1000000) then
            fn:concat($dscale div 1000000, 'M')
        else if ($dscale >= 1000) then
            fn:concat($dscale div 1000, 'K')
        else
            $scale

};

declare function fnp:process_filter($element as element(ns1:Filter)) as element(ogc:Filter) {
    <ogc:Filter>
        {
            fnp:get_op($element/text(), 'or')
        }
    </ogc:Filter>
};

declare function fnp:process_tag($tag_name as xs:QName, $element as element()) as
element()* {
    let $item := $element return
        if (fn:concat($item/text(), '') != '') then
            let $num := $item/text() return
                element {$tag_name} {fnp:mScaleTogScale($num) + 10}
        else ()
};

declare function fnp:process_marker($element as element(ns1:MarkersSymbolizer))
as element(PointSymbolizer) {
  <PointSymbolizer>
    <Graphic>
        <Mark>
            <WellKnownName>circle</WellKnownName>
            {
                for $prop in $element/@* where fn:contains(xs:string(node-name($prop)), 'fill') return
                <Fill>
                {
                    element {xs:QName('CssParameter')} { attribute {xs:QName('name')} {xs:string(node-name($prop))}, xs:string($prop) }
                }
                </Fill>
            }
            {
                for $prop in $element/@* where fn:contains(xs:string(node-name($prop)), 'stroke') return
                <Stroke>
                {
                    element {xs:QName('CssParameter')} { attribute {xs:QName('name')} {xs:string(node-name($prop))}, xs:string($prop) }
                }
                </Stroke>
            }
        </Mark>
        {
        for $prop in $element/@* where fn:contains(xs:string(node-name($prop)), 'width') return
            <Size>{ xs:string($prop) }</Size>
        }
    </Graphic>
  </PointSymbolizer>
};

declare function fnp:process_line($element as element(ns1:LineSymbolizer)) as
element(LineSymbolizer) {
    <LineSymbolizer>
        <Stroke>
            {
                for $prop in $element/@* where fn:contains(xs:string(node-name($prop)), 'stroke') return
                    element {xs:QName('CssParameter')} { attribute {xs:QName('name')} {xs:string(node-name($prop))}, xs:string($prop) }
            }
        </Stroke>
    </LineSymbolizer>
};

declare function fnp:process_polygon($element as element(ns1:PolygonSymbolizer)) as
element(PolygonSymbolizer) {
    <PolygonSymbolizer>
        <Fill>
        {
            for $prop in $element/@* where fn:contains(xs:string(node-name($prop)), 'fill') return
                 element {xs:QName('CssParameter')} { attribute {xs:QName('name')} {xs:string(node-name($prop))}, xs:string($prop) }
        }
        </Fill>
    </PolygonSymbolizer>
};

declare function fnp:process_text($layer as xs:string, $element as element(ns1:TextSymbolizer), $doc as element(ns1:Map)) as
element(TextSymbolizer) {
    <TextSymbolizer>
    {
        for $attr in $element/@*[xs:string(node-name(.)) = "placement"] return
        if ($attr = "point") then
            <Geometry>
               <ogc:Function name="centroid">
                  <ogc:PropertyName>{let $gname := $fnp:mappings/fnp:Map[fnp:Type='GEOM_NAME' and fnp:Code=$layer] return if (fn:concat($gname/fnp:Value/text(), '') != '') then $gname/fnp:Value/text() else 'geom'}</ogc:PropertyName>
               </ogc:Function>
           </Geometry>
        else ()
    }
    {
        let $name := $element/text() return
            <Label><ogc:PropertyName>{fnp:get_var($name)}</ogc:PropertyName></Label>
    }
    {
        for $attr in $element/@*[xs:string(node-name(.)) = "fontset-name"]
        let $font := $doc/ns1:FontSet[@name = $attr] return
        <Font>
            <CssParameter name="font-family">{xs:string($font/ns1:Font[1]/@face-name)}</CssParameter>
            <CssParameter name="font-size">{
                let $size := $element/@size return
                    if (fn:concat(xs:string($size), '') != '') then
                        xs:string($size)
                    else
                        10
            }</CssParameter>
            <CssParameter name="font-style">{
                let $fname := $font/ns1:Font[1]/@face-name return
                    if (fn:matches($fname, '[Ii]talics')) then
                            "italics"
                        else
                            "normal"
            }</CssParameter>
            <CssParameter name="font-weight">{
                let $fname := $font/ns1:Font[1]/@face-name return
                    if (fn:matches($fname, '[Bb]old')) then
                        "bold"
                    else
                        "normal"
            }</CssParameter>
        </Font>
    }
    {
        for $attr in $element/@*[xs:string(node-name(.)) = "placement"] return
        <LabelPlacement>{
            if ($attr = "point") then
                <PointPlacement>
                    <AnchorPoint>
                        <AnchorPointX>
                            <ogc:Literal>0.5</ogc:Literal>
                        </AnchorPointX>
                        <AnchorPointY>
                            <ogc:Literal>0.5</ogc:Literal>
                        </AnchorPointY>
                    </AnchorPoint>
                    <Rotation>
                        <ogc:Literal>0</ogc:Literal>
                    </Rotation>
                </PointPlacement>
            else ()
        }</LabelPlacement>
    }
    {
        let $halo := $element/@*[fn:contains(xs:string(node-name(.)), 'halo')] return
        if (fn:count($halo) > 1) then
        <Halo>
            { for $attr in $element/@*[xs:string(node-name(.)) = "halo-radius"] return
                <Radius>{xs:string($attr)}</Radius>
            }
            { for $attr in $element/@*[xs:string(node-name(.)) = "halo-fill"] return
                <Fill>
                    <CssParameter name="fill">{xs:string($attr)}</CssParameter>
                </Fill>
            }
        </Halo>
        else ()
    }
    {
        for $attr in $element/@*[xs:string(node-name(.)) = "fill"] return
        <Fill>
            <CssParameter name="fill">{xs:string($attr)}</CssParameter>
        </Fill>

    }
    {
        for $attr in $element/@*[xs:string(node-name(.)) = "wrap-width"] return
        <VendorOption name="autoWrap">{xs:string($attr)}</VendorOption>
    }
    {
        for $attr in $element/@*[xs:string(node-name(.)) = "allow-overlap"] return
        <VendorOption name="spaceAround">-1</VendorOption>
    }
        <VendorOption name="conflictResolution">false</VendorOption>
    </TextSymbolizer>
};