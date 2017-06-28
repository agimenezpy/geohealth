<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:ogc="http://www.opengis.net/ogc"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                       xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd"
                       version="1.0.0">
   <NamedLayer>
      <Name>departamento</Name>
      <UserStyle>
         <Name>departamento</Name>
         <Title>Departamento</Title>
         <FeatureTypeStyle>
            <Name>departamento-line</Name>
            <Rule>
               <Name>Límite &lt; 750K</Name>
               <MaxScaleDenominator>545987</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke-opacity">0.1</CssParameter>
                     <CssParameter name="stroke-width">6</CssParameter>
                     <CssParameter name="stroke">#332244</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>
            <Rule>
               <Name>Límite en 12.5M y 750K</Name>
               <MinScaleDenominator>545987</MinScaleDenominator>
               <MaxScaleDenominator>8735652</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#332244</CssParameter>
                     <CssParameter name="stroke-width">0.9</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>
         </FeatureTypeStyle>
         <FeatureTypeStyle>
            <Name>departamento-place</Name>
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
                     <CssParameter name="font-family">Open Sans Bold Italic</CssParameter>
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
                     <CssParameter name="fill">#a2a2a2</CssParameter>
                  </Fill>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 1.5M y 750K</Name>
               <MinScaleDenominator>545987</MinScaleDenominator>
               <MaxScaleDenominator>1091965</MaxScaleDenominator>
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
                     <CssParameter name="font-family">Open Sans Bold Italic</CssParameter>
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
                     <CssParameter name="fill">#888888</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">80</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 3M y 1.5M</Name>
               <MinScaleDenominator>1091965</MinScaleDenominator>
               <MaxScaleDenominator>2183920</MaxScaleDenominator>
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
                     <CssParameter name="font-family">Open Sans Bold Italic</CssParameter>
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
                     <CssParameter name="fill">#888888</CssParameter>
                  </Fill>
                  <VendorOption name="autoWrap">50</VendorOption>
                  <VendorOption name="spaceAround">-1</VendorOption>
                  <VendorOption name="conflictResolution">false</VendorOption>
               </TextSymbolizer>
            </Rule>
            <Rule>
               <Name>Nombre en 6.5M y 3M</Name>
               <MinScaleDenominator>2183920</MinScaleDenominator>
               <MaxScaleDenominator>4367831</MaxScaleDenominator>
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
                     <CssParameter name="font-family">Open Sans Bold Italic</CssParameter>
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