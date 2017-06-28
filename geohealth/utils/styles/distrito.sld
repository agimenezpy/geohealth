<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:ogc="http://www.opengis.net/ogc"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                       xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd"
                       version="1.0.0">
   <NamedLayer>
      <Name>distrito</Name>
      <UserStyle>
         <Name>distrito</Name>
         <Title>Distrito</Title>
         <FeatureTypeStyle>
            <Name>distrito-line</Name>
            <Rule>
               <Name>Límite &lt; 750K</Name>
               <MaxScaleDenominator>545987</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#332244</CssParameter>
                     <CssParameter name="stroke-width">2</CssParameter>
                     <CssParameter name="stroke-dashoffset">2</CssParameter>
                     <CssParameter name="stroke-dasharray">5</CssParameter>
                     <CssParameter name="stroke-opacity">0.1</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>
         </FeatureTypeStyle>
         <FeatureTypeStyle>
            <Name>distrito-place</Name>
            <Rule>
               <Name>Nombre en 5K y 2.5K</Name>
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
                     <CssParameter name="font-family">Open Sans Semibold</CssParameter>
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
                     <CssParameter name="fill">#666666</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 12.5K y 5K</Name>
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
                     <CssParameter name="font-family">Open Sans Semibold</CssParameter>
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
                     <CssParameter name="fill">#666666</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 25K y 12.5K</Name>
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
                     <CssParameter name="font-family">Open Sans Semibold</CssParameter>
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
                     <CssParameter name="fill">#666666</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 50K y 25K</Name>
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
                     <CssParameter name="font-family">Open Sans Semibold</CssParameter>
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
                     <CssParameter name="fill">#666666</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 100K y 50K</Name>
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
                     <CssParameter name="font-family">Open Sans Semibold</CssParameter>
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
                     <CssParameter name="fill">#666666</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 200K y 100K</Name>
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
                     <CssParameter name="font-family">Open Sans Semibold</CssParameter>
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
                     <CssParameter name="fill">#666666</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 400K y 200K</Name>
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
                     <CssParameter name="font-family">Open Sans Semibold</CssParameter>
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
                     <CssParameter name="fill">#666666</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 750K y 400K</Name>
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
                     <CssParameter name="font-family">Open Sans Semibold</CssParameter>
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
                     <CssParameter name="fill">#666666</CssParameter>
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