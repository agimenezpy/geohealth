<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:ogc="http://www.opengis.net/ogc"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                       xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd"
                       version="1.0.0">
   <NamedLayer>
      <Name>microcuenca</Name>
      <UserStyle>
         <Name>microcuenca</Name>
         <Title>Microcuenca</Title>
         <FeatureTypeStyle>
            <Name>microcuenca-poly</Name>
            <Rule>
               <Name>SAN PEDRO</Name>
               <ogc:Filter>
                  <ogc:PropertyIsEqualTo>
                     <ogc:PropertyName>departamento</ogc:PropertyName>
                     <ogc:Literal>SAN PEDRO</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
               </ogc:Filter>
               <MaxScaleDenominator>4367831</MaxScaleDenominator>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill-opacity">0.8</CssParameter>
                     <CssParameter name="fill">#edaa88</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#e68a5c</CssParameter>
                     <CssParameter name="stroke-width">3</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>
            <Rule>
               <Name>CAAGUAZU</Name>
               <ogc:Filter>
                  <ogc:PropertyIsEqualTo>
                     <ogc:PropertyName>departamento</ogc:PropertyName>
                     <ogc:Literal>CAAGUAZU</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
               </ogc:Filter>
               <MaxScaleDenominator>4367831</MaxScaleDenominator>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill-opacity">0.8</CssParameter>
                     <CssParameter name="fill">#ed8888</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke-width">3</CssParameter>
                     <CssParameter name="stroke">#e65c5c</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>
         </FeatureTypeStyle>
         <FeatureTypeStyle>
            <Name>microcuenca-place</Name>
            <Rule>
               <MinScaleDenominator>2142</MinScaleDenominator>
               <MaxScaleDenominator>4275</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>nombre</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Semibold Italic</CssParameter>
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
                     <Radius>2</Radius>
                     <Fill>
                        <CssParameter name="fill">#ffffff</CssParameter>
                     </Fill>
                  </Halo>
                  <Fill>
                     <CssParameter name="fill">#888888</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>4275</MinScaleDenominator>
               <MaxScaleDenominator>8540</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>nombre</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Semibold Italic</CssParameter>
                     <CssParameter name="font-size">15</CssParameter>
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
                     <CssParameter name="fill">#888888</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>8540</MinScaleDenominator>
               <MaxScaleDenominator>17071</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>nombre</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Semibold Italic</CssParameter>
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
                     <Radius>2</Radius>
                     <Fill>
                        <CssParameter name="fill">#ffffff</CssParameter>
                     </Fill>
                  </Halo>
                  <Fill>
                     <CssParameter name="fill">#888888</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>17071</MinScaleDenominator>
               <MaxScaleDenominator>34133</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>nombre</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Semibold Italic</CssParameter>
                     <CssParameter name="font-size">15</CssParameter>
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
                     <CssParameter name="fill">#888888</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>34133</MinScaleDenominator>
               <MaxScaleDenominator>68257</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>nombre</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Semibold Italic</CssParameter>
                     <CssParameter name="font-size">14</CssParameter>
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
                     <CssParameter name="fill">#888888</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>68257</MinScaleDenominator>
               <MaxScaleDenominator>136504</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>nombre</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Semibold Italic</CssParameter>
                     <CssParameter name="font-size">13</CssParameter>
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
                     <CssParameter name="fill">#888888</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>136504</MinScaleDenominator>
               <MaxScaleDenominator>272998</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>nombre</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Semibold Italic</CssParameter>
                     <CssParameter name="font-size">12</CssParameter>
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
                     <CssParameter name="fill">#888888</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>272998</MinScaleDenominator>
               <MaxScaleDenominator>545987</MaxScaleDenominator>
               <TextSymbolizer>
                  <Geometry>
                     <ogc:Function name="centroid">
                        <ogc:PropertyName>geom</ogc:PropertyName>
                     </ogc:Function>
                  </Geometry>
                  <Label>
                     <ogc:PropertyName>nombre</ogc:PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Open Sans Semibold Italic</CssParameter>
                     <CssParameter name="font-size">11</CssParameter>
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
                     <CssParameter name="fill">#888888</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>