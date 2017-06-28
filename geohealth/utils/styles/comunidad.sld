<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:ogc="http://www.opengis.net/ogc"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                       xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd"
                       version="1.0.0">
   <NamedLayer>
      <Name>comunidad</Name>
      <UserStyle>
         <Name>comunidad</Name>
         <FeatureTypeStyle>
            <Name>comunidad-marker</Name>
            <Rule>
               <MaxScaleDenominator>1091965</MaxScaleDenominator>
               <PointSymbolizer>
                  <Graphic>
                     <Mark>
                        <WellKnownName>circle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#ffeec7</CssParameter>
                        </Fill>
                        <Stroke>
                           <CssParameter name="stroke">#f2e8b6</CssParameter>
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