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
        <layer class="LinePatternFill" locked="0" pass="0" enabled="1">
          <prop k="angle" v="45"/>
          <prop k="color" v="0,0,0,80"/>
          <prop k="distance" v="3"/>
          <prop k="distance_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="distance_unit" v="MM"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol type="line" name="@0@0" clip_to_extent="1" alpha="1">
            <layer class="SimpleLine" locked="0" pass="0" enabled="1">
              <prop k="capstyle" v="square"/>
              <prop k="customdash" v="5;2"/>
              <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="customdash_unit" v="MM"/>
              <prop k="draw_inside_polygon" v="0"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="line_color" v="0,0,0,80"/>
              <prop k="line_style" v="solid"/>
              <prop k="line_width" v="0.3"/>
              <prop k="line_width_unit" v="MM"/>
              <prop k="offset" v="0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="use_custom_dash" v="0"/>
              <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer class="SimpleFill" locked="0" pass="0" enabled="1">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="0,0,0,80"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,144"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.15"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="no"/>
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
    <field name="OBJECTID">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="NP_NAME">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="DESIG_DATE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Edit_Date">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="AREA_HA">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ISIS_ID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Centre_X">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Centre_Y">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="METADATA">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="GlobalID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="OBJECTID" index="0" name=""/>
    <alias field="NP_NAME" index="1" name=""/>
    <alias field="DESIG_DATE" index="2" name=""/>
    <alias field="Edit_Date" index="3" name=""/>
    <alias field="AREA_HA" index="4" name=""/>
    <alias field="ISIS_ID" index="5" name=""/>
    <alias field="Centre_X" index="6" name=""/>
    <alias field="Centre_Y" index="7" name=""/>
    <alias field="METADATA" index="8" name=""/>
    <alias field="GlobalID" index="9" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="OBJECTID" expression="" applyOnUpdate="0"/>
    <default field="NP_NAME" expression="" applyOnUpdate="0"/>
    <default field="DESIG_DATE" expression="" applyOnUpdate="0"/>
    <default field="Edit_Date" expression="" applyOnUpdate="0"/>
    <default field="AREA_HA" expression="" applyOnUpdate="0"/>
    <default field="ISIS_ID" expression="" applyOnUpdate="0"/>
    <default field="Centre_X" expression="" applyOnUpdate="0"/>
    <default field="Centre_Y" expression="" applyOnUpdate="0"/>
    <default field="METADATA" expression="" applyOnUpdate="0"/>
    <default field="GlobalID" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="OBJECTID" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="NP_NAME" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="DESIG_DATE" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="Edit_Date" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="AREA_HA" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="ISIS_ID" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="Centre_X" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="Centre_Y" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="METADATA" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
    <constraint field="GlobalID" constraints="0" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="OBJECTID" exp="" desc=""/>
    <constraint field="NP_NAME" exp="" desc=""/>
    <constraint field="DESIG_DATE" exp="" desc=""/>
    <constraint field="Edit_Date" exp="" desc=""/>
    <constraint field="AREA_HA" exp="" desc=""/>
    <constraint field="ISIS_ID" exp="" desc=""/>
    <constraint field="Centre_X" exp="" desc=""/>
    <constraint field="Centre_Y" exp="" desc=""/>
    <constraint field="METADATA" exp="" desc=""/>
    <constraint field="GlobalID" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column type="field" hidden="0" name="OBJECTID" width="-1"/>
      <column type="field" hidden="0" name="NP_NAME" width="-1"/>
      <column type="field" hidden="0" name="DESIG_DATE" width="-1"/>
      <column type="field" hidden="0" name="Edit_Date" width="-1"/>
      <column type="field" hidden="0" name="AREA_HA" width="-1"/>
      <column type="field" hidden="0" name="ISIS_ID" width="-1"/>
      <column type="field" hidden="0" name="Centre_X" width="-1"/>
      <column type="field" hidden="0" name="Centre_Y" width="-1"/>
      <column type="field" hidden="0" name="METADATA" width="-1"/>
      <column type="field" hidden="0" name="GlobalID" width="-1"/>
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
    <field editable="1" name="AREA_HA"/>
    <field editable="1" name="Centre_X"/>
    <field editable="1" name="Centre_Y"/>
    <field editable="1" name="DESIG_DATE"/>
    <field editable="1" name="Edit_Date"/>
    <field editable="1" name="GlobalID"/>
    <field editable="1" name="ISIS_ID"/>
    <field editable="1" name="METADATA"/>
    <field editable="1" name="NP_NAME"/>
    <field editable="1" name="OBJECTID"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="AREA_HA"/>
    <field labelOnTop="0" name="Centre_X"/>
    <field labelOnTop="0" name="Centre_Y"/>
    <field labelOnTop="0" name="DESIG_DATE"/>
    <field labelOnTop="0" name="Edit_Date"/>
    <field labelOnTop="0" name="GlobalID"/>
    <field labelOnTop="0" name="ISIS_ID"/>
    <field labelOnTop="0" name="METADATA"/>
    <field labelOnTop="0" name="NP_NAME"/>
    <field labelOnTop="0" name="OBJECTID"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>OBJECTID</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
