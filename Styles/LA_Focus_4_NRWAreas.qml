<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" simplifyDrawingHints="1" labelsEnabled="0" hasScaleBasedVisibilityFlag="0" version="3.4.2-Madeira" simplifyMaxScale="1" simplifyLocal="1" simplifyAlgorithm="0" styleCategories="AllStyleCategories" simplifyDrawingTol="1" minScale="1e+08" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" type="singleSymbol" enableorderby="0">
    <symbols>
      <symbol type="fill" name="0" clip_to_extent="1" alpha="1">
        <layer class="SimpleFill" locked="0" pass="0" enabled="1">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="232,113,141,0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="255,255,255,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.86"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="solid"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory penColor="#000000" sizeType="MM" scaleDependency="Area" rotationOffset="270" penAlpha="255" lineSizeScale="3x:0,0,0,0,0,0" backgroundAlpha="255" scaleBasedVisibility="0" minimumSize="0" enabled="0" width="15" maxScaleDenominator="1e+08" lineSizeType="MM" penWidth="0" minScaleDenominator="0" diagramOrientation="Up" opacity="1" backgroundColor="#ffffff" labelPlacementMethod="XHeight" sizeScale="3x:0,0,0,0,0,0" height="15" barWidth="5">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" label="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings placement="1" zIndex="0" dist="0" linePlacementFlags="18" showAll="1" obstacle="0" priority="0">
    <properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="gid">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name_cy">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="code">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="gid" index="0" name=""/>
    <alias field="name" index="1" name=""/>
    <alias field="name_cy" index="2" name=""/>
    <alias field="code" index="3" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="gid" expression="" applyOnUpdate="0"/>
    <default field="name" expression="" applyOnUpdate="0"/>
    <default field="name_cy" expression="" applyOnUpdate="0"/>
    <default field="code" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="gid" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="name" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="name_cy" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="code" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="gid" exp="" desc=""/>
    <constraint field="name" exp="" desc=""/>
    <constraint field="name_cy" exp="" desc=""/>
    <constraint field="code" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column type="field" hidden="0" name="gid" width="-1"/>
      <column type="field" hidden="0" name="name" width="-1"/>
      <column type="field" hidden="0" name="name_cy" width="-1"/>
      <column type="field" hidden="0" name="code" width="-1"/>
      <column type="actions" hidden="1" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="code"/>
    <field editable="1" name="gid"/>
    <field editable="1" name="name"/>
    <field editable="1" name="name_cy"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="code"/>
    <field labelOnTop="0" name="gid"/>
    <field labelOnTop="0" name="name"/>
    <field labelOnTop="0" name="name_cy"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>gid</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
