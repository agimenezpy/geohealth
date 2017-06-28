<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:ogc="http://www.opengis.net/ogc"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                       xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd"
                       version="1.0.0">
   <NamedLayer>
      <Name>beneficiario</Name>
      <UserStyle>
         <Name>beneficiario</Name>
         <FeatureTypeStyle>
            <Name>beneficiario-marker</Name>
            <Rule>
               <Name>SAN PEDRO</Name>
               <ogc:Filter>
                  <ogc:PropertyIsEqualTo>
                     <ogc:PropertyName>departamento</ogc:PropertyName>
                     <ogc:Literal>SAN PEDRO</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
               </ogc:Filter>
               <MaxScaleDenominator>1091965</MaxScaleDenominator>
               <PointSymbolizer>
                  <Graphic>
                     <Mark>
                        <WellKnownName>circle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#b8e6b8</CssParameter>
                        </Fill>
                        <Stroke>
                           <CssParameter name="stroke">#daf2c1</CssParameter>
                        </Stroke>
                     </Mark>
                     <Size>6</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <Rule>
               <Name>CAAGUAZU</Name>
               <ogc:Filter>
                  <ogc:PropertyIsEqualTo>
                     <ogc:PropertyName>departamento</ogc:PropertyName>
                     <ogc:Literal>CAAGUAZU</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
               </ogc:Filter>
               <MaxScaleDenominator>1091965</MaxScaleDenominator>
               <PointSymbolizer>
                  <Graphic>
                     <Mark>
                        <WellKnownName>circle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#ff4455</CssParameter>
                        </Fill>
                        <Stroke>
                           <CssParameter name="stroke">#881133</CssParameter>
                        </Stroke>
                     </Mark>
                     <Size>6</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>