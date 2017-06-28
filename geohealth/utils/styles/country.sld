<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:ogc="http://www.opengis.net/ogc"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                       xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd"
                       version="1.0.0">
   <NamedLayer>
      <Name>country</Name>
      <UserStyle>
         <Name>country</Name>
         <Title>País</Title>
         <FeatureTypeStyle>
            <Name>country-place</Name>
            <Rule>
               <Name>Nombre en 6.5M y 3M</Name>
               <MinScaleDenominator>2183920</MinScaleDenominator>
               <MaxScaleDenominator>4367831</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>the_geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>NAME</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Bold</CssParameter>
                     <CssParameter name="font-size">20</CssParameter>
                     <CssParameter name="font-style">normal</CssParameter>
                     <CssParameter name="font-weight">bold</CssParameter>
                  </Font>
                  <LabelPlacement>
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
                  </LabelPlacement>
                  <Halo>
                     <Radius>2</Radius>
                     <Fill>
                        <CssParameter name="fill">#ffffff</CssParameter>
                     </Fill>
                  </Halo>
                  <Fill>
                     <CssParameter name="fill">#443355</CssParameter>
                  </Fill>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 12.5M y 6.5M</Name>
               <MinScaleDenominator>4367831</MinScaleDenominator>
               <MaxScaleDenominator>8735652</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>the_geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>NAME</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Bold</CssParameter>
                     <CssParameter name="font-size">18</CssParameter>
                     <CssParameter name="font-style">normal</CssParameter>
                     <CssParameter name="font-weight">bold</CssParameter>
                  </Font>
                  <LabelPlacement>
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
                  </LabelPlacement>
                  <Halo>
                     <Radius>2</Radius>
                     <Fill>
                        <CssParameter name="fill">#ffffff</CssParameter>
                     </Fill>
                  </Halo>
                  <Fill>
                     <CssParameter name="fill">#443355</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">80</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 25M y 12.5M</Name>
               <MinScaleDenominator>8735652</MinScaleDenominator>
               <MaxScaleDenominator>17471295</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>the_geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>NAME</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Bold</CssParameter>
                     <CssParameter name="font-size">17</CssParameter>
                     <CssParameter name="font-style">normal</CssParameter>
                     <CssParameter name="font-weight">bold</CssParameter>
                  </Font>
                  <LabelPlacement>
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
                  </LabelPlacement>
                  <Halo>
                     <Radius>2</Radius>
                     <Fill>
                        <CssParameter name="fill">#ffffff</CssParameter>
                     </Fill>
                  </Halo>
                  <Fill>
                     <CssParameter name="fill">#443355</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 50M y 25M</Name>
               <MinScaleDenominator>17471295</MinScaleDenominator>
               <MaxScaleDenominator>34942581</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>the_geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>NAME</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Bold</CssParameter>
                     <CssParameter name="font-size">17</CssParameter>
                     <CssParameter name="font-style">normal</CssParameter>
                     <CssParameter name="font-weight">bold</CssParameter>
                  </Font>
                  <LabelPlacement>
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
                  </LabelPlacement>
                  <Halo>
                     <Radius>1</Radius>
                     <Fill>
                        <CssParameter name="fill">#ffffff</CssParameter>
                     </Fill>
                  </Halo>
                  <Fill>
                     <CssParameter name="fill">#443355</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 100M y 50M</Name>
               <MinScaleDenominator>34942581</MinScaleDenominator>
               <MaxScaleDenominator>69885153</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>the_geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>NAME</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Bold</CssParameter>
                     <CssParameter name="font-size">16</CssParameter>
                     <CssParameter name="font-style">normal</CssParameter>
                     <CssParameter name="font-weight">bold</CssParameter>
                  </Font>
                  <LabelPlacement>
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
                  </LabelPlacement>
                  <Halo>
                     <Radius>1</Radius>
                     <Fill>
                        <CssParameter name="fill">#ffffff</CssParameter>
                     </Fill>
                  </Halo>
                  <Fill>
                     <CssParameter name="fill">#443355</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">40</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
         </FeatureTypeStyle>
         <FeatureTypeStyle>
            <Name>country-line</Name>
            <Rule>
               <Name>Límite &lt; 100M</Name>
               <MaxScaleDenominator>69885153</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#554466</CssParameter>
                     <CssParameter name="stroke-width">0.5</CssParameter>
                     <CssParameter name="stroke-linejoin">round</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>
         </FeatureTypeStyle>
         <FeatureTypeStyle>
            <Name>country-hideline</Name>
            <Rule>
               <ogc:Filter>
                  <ogc:PropertyIsEqualTo>
                     <ogc:PropertyName>ISO_A3</ogc:PropertyName>
                     <ogc:Literal>PRY</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
               </ogc:Filter>
               <MinScaleDenominator>272998</MinScaleDenominator>
               <MaxScaleDenominator>4367831</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#ffffff</CssParameter>
                     <CssParameter name="stroke-width">2</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>