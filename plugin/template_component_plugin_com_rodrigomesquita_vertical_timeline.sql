prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>7805672918286188
,p_default_application_id=>127
,p_default_id_offset=>0
,p_default_owner=>'WKSP_RODRIGO'
);
end;
/
 
prompt APPLICATION 127 - Plugins
--
-- Application Export:
--   Application:     127
--   Name:            Plugins
--   Date and Time:   15:02 Wednesday November 15, 2023
--   Exported By:     RODRIGO.MESQUITA
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 675469715610051403
--   Manifest End
--   Version:         23.1.5
--   Instance ID:     7605533469494042
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/template_component/com_rodrigomesquita_vertical_timeline
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(675469715610051403)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '')
,p_name=>'COM.RODRIGOMESQUITA.VERTICAL_TIMELINE'
,p_display_name=>'Vertical Timeline'
,p_supported_component_types=>'REPORT'
,p_css_file_urls=>'#PLUGIN_FILES#vertical_timeline#MIN#.css'
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if APEX$IS_LAZY_LOADING/}',
'  <div><span aria-hidden="true" class="fa fa-refresh fa-2x fa-anim-spin"></span></div>',
'{else/}',
'    <span class="fa #VT_ICON# vt-icon" aria-hidden="true"></span>',
'       <div class="vt-header">',
'            <div class="vt_header_text">#VT_TEXT#<br> #VT_SUBTEXT#</div>',
'            <div>{if APEX$HAS_ACTION_BUTTONS/} #MENU_ACTION# {endif/}</div>',
'       </div>',
'    <div class="vt-item-text">#VT_DESC#</div>',
'{endif/}'))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>2
,p_report_body_template=>'<ul class="vt-container">#APEX$ROWS#</ul>'
,p_report_row_template=>'<li #APEX$ROW_IDENTIFICATION#>#APEX$PARTIAL#</li>'
,p_report_placeholder_count=>3
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'  Oracle APEX Template Component Plugin <STRONG>Vertical Timeline<STRONG>',
'</p>',
'<p>',
'  Author: <code>Rodrigo Mesquita</code><br/>',
'  E-mail: <code>rodrigomesquita.ti@gmail.com</code><br/>',
'  X: <code>@mesquitarod</code><br/>',
'  Plugin home page: <code>https://github.com/rodrigomesquitaorclapex/verticalTimeline</code>',
'  License: Licensed under the MIT (LICENSE.txt) license.',
'</p>'))
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/rodrigomesquitaorclapex/verticalTimeline'
,p_files_version=>10
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(675470444568051471)
,p_plugin_id=>wwv_flow_imp.id(675469715610051403)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'VT_DESC'
,p_prompt=>'Description'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(675470774199051471)
,p_plugin_id=>wwv_flow_imp.id(675469715610051403)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'VT_ICON'
,p_prompt=>'Icon Class'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(675471191242051471)
,p_plugin_id=>wwv_flow_imp.id(675469715610051403)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'VT_SUBTEXT'
,p_prompt=>'Subtext'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(675471573226051472)
,p_plugin_id=>wwv_flow_imp.id(675469715610051403)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'VT_TEXT'
,p_prompt=>'Text'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_act_template(
 p_id=>wwv_flow_imp.id(675483459590088583)
,p_plugin_id=>wwv_flow_imp.id(675469715610051403)
,p_name=>'Menu'
,p_type=>'MENU'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button class="t-Button t-Button--noLabel  t-Button--icon t-Button--tiny t-Button--link" {if IS_DISABLED/}disabled{endif/} type="button" data-menu="#MENU_ID#">',
'    <span class="rw-Button-icon oj-ux-ico-overflow-h" aria-hidden="true"></span>',
'    <span class="t-Icon fa fa-bars" aria-hidden="true"></span>',
'</button> #MENU#'))
);
wwv_flow_imp_shared.create_plugin_act_position(
 p_id=>wwv_flow_imp.id(675482952375083221)
,p_plugin_id=>wwv_flow_imp.id(675469715610051403)
,p_name=>'Menu'
,p_static_id=>'MENU_ACTION'
,p_display_sequence=>10
,p_type=>'LINK'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E76742D69636F6E207B0A202020206C6566743A202D343370783B0A20202020746F703A203270783B0A20202020636F6C6F723A20766172282D2D752D636F6C6F722D32293B0A7D0A2E76742D636F6E7461696E6572207B0A202077696474683A206175';
wwv_flow_imp.g_varchar2_table(2) := '746F3B0A20206D617267696E3A206175746F3B0A2020646973706C61793A20626C6F636B3B0A2020706F736974696F6E3A2072656C61746976653B0A20206D61782D77696474683A20313030253B0A7D0A0A2E76742D636F6E7461696E657220207B0A20';
wwv_flow_imp.g_varchar2_table(3) := '2070616464696E673A20303B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A7D0A0A2E76742D636F6E7461696E6572206C69207B0A202020206C6973742D7374796C653A206E6F6E653B0A202020206D617267696E3A206175746F3B0A';
wwv_flow_imp.g_varchar2_table(4) := '202020206D617267696E2D6C6566743A206175746F3B0A202020206D696E2D6865696768743A20353070783B0A20202020626F726465722D6C6566743A203130707820736F6C696420766172282D2D752D636F6C6F722D32293B0A202020207061646469';
wwv_flow_imp.g_varchar2_table(5) := '6E673A203020302030707820333070783B0A20202020706F736974696F6E3A2072656C61746976653B0A202020206D617267696E2D72696768743A206175746F3B0A7D0A0A2E76742D636F6E7461696E657220206C693A6C6173742D6368696C64207B0A';
wwv_flow_imp.g_varchar2_table(6) := '2020626F726465722D6C6566743A20303B0A20206C6566743A20313070783B0A20206D617267696E2D72696768743A20313070783B0A7D0A0A2E76742D636F6E7461696E6572206C693A3A6265666F7265207B0A20202020706F736974696F6E3A206162';
wwv_flow_imp.g_varchar2_table(7) := '736F6C7574653B0A202020206C6566743A202D323070783B0A20202020746F703A202D3570783B0A20202020636F6E74656E743A202220223B0A20202020626F726465723A2033707820736F6C696420766172282D2D752D636F6C6F722D32293B0A2020';
wwv_flow_imp.g_varchar2_table(8) := '2020626F726465722D7261646975733A20353030253B0A202020206261636B67726F756E643A20236666666666663B0A202020206865696768743A20333070783B0A2020202077696474683A20333070783B0A7D0A0A2E76742D636F6E7461696E657220';
wwv_flow_imp.g_varchar2_table(9) := '6C69202E76742D686561646572207B0A2020636F6C6F723A20766172282D2D752D636F6C6F722D32293B0A2020706F736974696F6E3A2072656C61746976653B0A2020666F6E742D73697A653A20313270783B0A2020746F703A202D323570783B0A2020';
wwv_flow_imp.g_varchar2_table(10) := '646973706C61793A20666C65783B0A7D0A0A2E76745F6865616465725F74657874207B0A2020202077696474683A2031363070783B0A7D0A0A2E76742D6974656D2D74657874207B0A2020636F6C6F723A20766172282D2D75742D6669656C642D6C6162';
wwv_flow_imp.g_varchar2_table(11) := '656C2D746578742D636F6C6F72293B0A2020746F703A202D323570783B0A2020706F736974696F6E3A2072656C61746976653B0A7D0A0A0A0A0A';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(675481332972073120)
,p_plugin_id=>wwv_flow_imp.id(675469715610051403)
,p_file_name=>'vertical_timeline.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E76742D69636F6E7B6C6566743A2D343370783B746F703A3270783B636F6C6F723A766172282D2D752D636F6C6F722D32297D2E76742D636F6E7461696E65727B77696474683A6175746F3B6D617267696E3A6175746F3B706F736974696F6E3A72656C';
wwv_flow_imp.g_varchar2_table(2) := '61746976653B6D61782D77696474683A313030253B70616464696E673A303B646973706C61793A696E6C696E652D626C6F636B7D2E76742D636F6E7461696E6572206C697B6C6973742D7374796C653A6E6F6E653B6D696E2D6865696768743A35307078';
wwv_flow_imp.g_varchar2_table(3) := '3B626F726465722D6C6566743A3130707820736F6C696420766172282D2D752D636F6C6F722D32293B70616464696E673A302030203020333070783B706F736974696F6E3A72656C61746976653B6D617267696E3A6175746F7D2E76742D636F6E746169';
wwv_flow_imp.g_varchar2_table(4) := '6E6572206C693A6C6173742D6368696C647B626F726465722D6C6566743A303B6C6566743A313070783B6D617267696E2D72696768743A313070787D2E76742D636F6E7461696E6572206C693A3A6265666F72657B706F736974696F6E3A6162736F6C75';
wwv_flow_imp.g_varchar2_table(5) := '74653B6C6566743A2D323070783B746F703A2D3570783B636F6E74656E743A2220223B626F726465723A33707820736F6C696420766172282D2D752D636F6C6F722D32293B626F726465722D7261646975733A353030253B6261636B67726F756E643A23';
wwv_flow_imp.g_varchar2_table(6) := '6666663B6865696768743A333070783B77696474683A333070787D2E76742D636F6E7461696E6572206C69202E76742D6865616465727B636F6C6F723A766172282D2D752D636F6C6F722D32293B706F736974696F6E3A72656C61746976653B666F6E74';
wwv_flow_imp.g_varchar2_table(7) := '2D73697A653A313270783B746F703A2D323570783B646973706C61793A666C65787D2E76745F6865616465725F746578747B77696474683A31363070787D2E76742D6974656D2D746578747B636F6C6F723A766172282D2D75742D6669656C642D6C6162';
wwv_flow_imp.g_varchar2_table(8) := '656C2D746578742D636F6C6F72293B746F703A2D323570783B706F736974696F6E3A72656C61746976657D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(675481595895073122)
,p_plugin_id=>wwv_flow_imp.id(675469715610051403)
,p_file_name=>'vertical_timeline.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
