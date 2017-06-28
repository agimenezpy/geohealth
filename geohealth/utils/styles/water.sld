<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:ogc="http://www.opengis.net/ogc"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                       xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd"
                       version="1.0.0">
   <NamedLayer>
      <Name>water</Name>
      <UserStyle>
         <Name>water</Name>
         <FeatureTypeStyle>
            <Rule>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#c4dff6</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#f0f7fd</CssParameter>
                     <CssParameter name="stroke-width">5</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>