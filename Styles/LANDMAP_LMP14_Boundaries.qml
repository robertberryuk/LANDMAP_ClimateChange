<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.2-Madeira" simplifyDrawingHints="1" styleCategories="AllStyleCategories" labelsEnabled="0" maxScale="0" simplifyLocal="1" simplifyMaxScale="1" simplifyDrawingTol="1" minScale="1e+08" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="singleSymbol" enableorderby="0" symbollevels="0" forceraster="0">
    <symbols>
      <symbol alpha="1" type="fill" clip_to_extent="1" name="0">
        <layer locked="0" pass="0" class="SimpleFill" enabled="1">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="133,182,111,0" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.1" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="no" k="style"/>
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
    <DiagramCategory maxScaleDenominator="1e+08" sizeType="MM" width="15" penColor="#000000" minimumSize="0" sizeScale="3x:0,0,0,0,0,0" penWidth="0" enabled="0" barWidth="5" rotationOffset="270" backgroundAlpha="255" scaleBasedVisibility="0" lineSizeScale="3x:0,0,0,0,0,0" minScaleDenominator="0" lineSizeType="MM" penAlpha="255" diagramOrientation="Up" scaleDependency="Area" height="15" labelPlacementMethod="XHeight" backgroundColor="#ffffff" opacity="1">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" obstacle="0" showAll="1" placement="1" dist="0" zIndex="0" linePlacementFlags="18">
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
    <field name="SurveyID">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="LMP14_CODE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="LMP14_D_L">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="LMP14_D_S">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="LMP09_CODE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="LMP09_D_L">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="LMP09_D_S">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" field="SurveyID" name=""/>
    <alias index="1" field="LMP14_CODE" name=""/>
    <alias index="2" field="LMP14_D_L" name=""/>
    <alias index="3" field="LMP14_D_S" name=""/>
    <alias index="4" field="LMP09_CODE" name=""/>
    <alias index="5" field="LMP09_D_L" name=""/>
    <alias index="6" field="LMP09_D_S" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="SurveyID" applyOnUpdate="0" expression=""/>
    <default field="LMP14_CODE" applyOnUpdate="0" expression=""/>
    <default field="LMP14_D_L" applyOnUpdate="0" expression=""/>
    <default field="LMP14_D_S" applyOnUpdate="0" expression=""/>
    <default field="LMP09_CODE" applyOnUpdate="0" expression=""/>
    <default field="LMP09_D_L" applyOnUpdate="0" expression=""/>
    <default field="LMP09_D_S" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint field="SurveyID" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="LMP14_CODE" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="LMP14_D_L" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="LMP14_D_S" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="LMP09_CODE" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="LMP09_D_L" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="LMP09_D_S" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="SurveyID" exp="" desc=""/>
    <constraint field="LMP14_CODE" exp="" desc=""/>
    <constraint field="LMP14_D_L" exp="" desc=""/>
    <constraint field="LMP14_D_S" exp="" desc=""/>
    <constraint field="LMP09_CODE" exp="" desc=""/>
    <constraint field="LMP09_D_L" exp="" desc=""/>
    <constraint field="LMP09_D_S" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column type="field" name="SurveyID" hidden="0" width="-1"/>
      <column type="field" name="LMP14_CODE" hidden="0" width="-1"/>
      <column type="field" name="LMP14_D_L" hidden="0" width="-1"/>
      <column type="field" name="LMP14_D_S" hidden="0" width="-1"/>
      <column type="field" name="LMP09_CODE" hidden="0" width="-1"/>
      <column type="field" name="LMP09_D_L" hidden="0" width="-1"/>
      <column type="field" name="LMP09_D_S" hidden="0" width="-1"/>
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
    <field name="LMP09_CODE" editable="1"/>
    <field name="LMP09_D_L" editable="1"/>
    <field name="LMP09_D_S" editable="1"/>
    <field name="LMP14_CODE" editable="1"/>
    <field name="LMP14_D_L" editable="1"/>
    <field name="LMP14_D_S" editable="1"/>
    <field name="SurveyID" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="LMP09_CODE" labelOnTop="0"/>
    <field name="LMP09_D_L" labelOnTop="0"/>
    <field name="LMP09_D_S" labelOnTop="0"/>
    <field name="LMP14_CODE" labelOnTop="0"/>
    <field name="LMP14_D_L" labelOnTop="0"/>
    <field name="LMP14_D_S" labelOnTop="0"/>
    <field name="SurveyID" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>SurveyID</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
