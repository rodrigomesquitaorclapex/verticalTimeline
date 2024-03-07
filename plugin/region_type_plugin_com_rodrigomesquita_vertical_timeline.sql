prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>89532025765818702
,p_default_application_id=>580
,p_default_id_offset=>0
,p_default_owner=>'GLAS'
);
end;
/
 
prompt APPLICATION 580 - Laser*GLAS
--
-- Application Export:
--   Application:     580
--   Name:            Laser*GLAS
--   Date and Time:   14:04 Thursday March 7, 2024
--   Exported By:     DMAKOVAC
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 525784781462001787
--   Manifest End
--   Version:         20.2.0.00.20
--   Instance ID:     248285828437830
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/com_rodrigomesquita_vertical_timeline
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(525784781462001787)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.RODRIGOMESQUITA.VERTICAL_TIMELINE'
,p_display_name=>'Vertical Timeline'
,p_supported_ui_types=>'DESKTOP'
,p_css_file_urls=>'#PLUGIN_FILES#vertical_timeline#MIN#.css'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function f_render',
'(',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean ',
')',
'return apex_plugin.t_region_render_result',
'as',
'    l_col_text      p_region.attribute_01%type := p_region.attribute_01;',
'    l_col_subtext   p_region.attribute_02%type := p_region.attribute_02;',
'    l_col_desc      p_region.attribute_03%type := p_region.attribute_03;',
'    l_col_icon      p_region.attribute_04%type := p_region.attribute_04;',
'',
'    l_val_text      varchar(4000);',
'    l_val_subtext   varchar(4000);    ',
'    l_val_desc      varchar(4000);',
'    l_val_icon      varchar(4000);',
'',
'    l_region_id p_region.static_id%type    := nvl(p_region.static_id, p_region.id);',
'    l_source    p_region.source%type       := p_region.source;',
'',
'    l_context   apex_exec.t_context;',
'',
'    l_result apex_plugin.t_region_render_result;',
'begin',
'',
'--debug',
'if apex_application.g_debug and substr(:DEBUG,6) >= 6',
'then',
'    apex_plugin_util.debug_region( ',
'        p_plugin => p_plugin',
'        , p_region => p_region',
'    );',
'end if;',
'apex_debug.message(''region source -> %s'', l_source);',
'',
'l_context := apex_exec.open_query_context(',
'    p_location          => apex_exec.c_location_local_db',
'    , p_sql_query       => l_source',
'    , p_total_row_count => true',
');',
'',
'apex_debug.message(''cols -> text: %s, subtext: %s, desc: %s, icon: %s'', l_col_text, l_col_subtext, l_col_desc, l_col_icon);',
'',
'sys.htp.p(''<ul class="vt-container">'');',
'while apex_exec.next_row(l_context)',
'loop',
'    l_val_text      := case when l_col_text     is not null then apex_exec.get_varchar2(l_context, l_col_text)      else null end;',
'    l_val_subtext   := case when l_col_subtext  is not null then apex_exec.get_varchar2(l_context, l_col_subtext)   else null end;',
'    l_val_desc      := case when l_col_desc     is not null then apex_exec.get_varchar2(l_context, l_col_desc)      else null end;',
'    l_val_icon      := case when l_col_icon     is not null then apex_exec.get_varchar2(l_context, l_col_icon)      else null end;',
'',
'    sys.htp.p(''<li>'');',
'    sys.htp.p(''<span class="fa ''||l_val_icon||'' vt-icon" aria-hidden="true"></span>                     '');',
'    sys.htp.p(''   <div class="vt-header">                                                               '');',
'    sys.htp.p(''        <div class="vt_header_text">''||l_val_text||''<br> ''||l_val_subtext||''</div>       '');',
'    -- sys.htp.p(''        <div>{if APEX$HAS_ACTION_BUTTONS/} #MENU_ACTION# {endif/}</div>  '');',
'    sys.htp.p(''   </div>                                                                                '');',
'    sys.htp.p(''<div class="vt-item-text">''||l_val_desc||''</div>                                         '');',
'    sys.htp.p(''</li>'');',
'end loop;',
'sys.htp.p(''</ul>'');',
'',
'',
'return l_result;',
'',
'end;'))
,p_api_version=>2
,p_render_function=>'f_render'
,p_standard_attributes=>'SOURCE_SQL'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>12
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(525793887451033844)
,p_plugin_id=>wwv_flow_api.id(525784781462001787)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Text'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(525794810804035713)
,p_plugin_id=>wwv_flow_api.id(525784781462001787)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'SubText'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(525795813552040195)
,p_plugin_id=>wwv_flow_api.id(525784781462001787)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Description'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(525796441546043392)
,p_plugin_id=>wwv_flow_api.id(525784781462001787)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Icon'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(525878995551629230)
,p_plugin_id=>wwv_flow_api.id(525784781462001787)
,p_name=>'SOURCE_SQL'
,p_depending_on_has_to_exist=>true
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'SELECT',
'  ''Order Received'' AS event_text,',
'  ''01-AUG-2023'' AS event_date,',
'  ''9:00 AM''  as event_time,',
'  ''fa-shopping-cart'' as card_icon,',
'  ''Y'' edit_flag,',
'  ''Y'' cancel_flag,',
'  ''N'' track_flag,',
'  ''N'' review_flag,',
'  ''N'' return_flag',
'FROM DUAL',
'UNION ALL',
'SELECT',
'  ''Order is being processed in our warehouse'' AS event_text,',
'  ''02-AUG-2023'' as event_date,',
'  ''10:00 AM''  as event_time,',
'  ''fa-package'' as card_icon,',
'  ''N'' edit_flag,',
'  ''Y'' cancel_flag,',
'  ''N'' track_flag,',
'  ''N'' review_flag,',
'  ''N'' return_flag',
'FROM DUAL',
'UNION ALL',
'SELECT',
'  ''Your order is shipped'' AS event_text,',
'  ''02-AUG-2023'' as event_date,',
'  ''1:00 PM'' as event_time,',
'  ''fa-plane'' as card_icon,',
'  ''N'' edit_flag,',
'  ''N'' cancel_flag,',
'  ''Y'' track_flag,',
'  ''N'' review_flag,',
'  ''N'' return_flag',
'FROM DUAL',
'UNION ALL',
'SELECT',
'  ''Your order has arrived in Leeds - UK'' AS event_text,',
'  ''03-AUG-2023'' as event_date,',
'  ''2:00 PM'' as event_time,',
'  ''fa-map-pin'' as card_icon,',
'  ''N'' edit_flag,',
'  ''N'' cancel_flag,',
'  ''Y'' track_flag,',
'  ''N'' review_flag,',
'  ''N'' return_flag',
'FROM DUAL',
'UNION ALL',
'SELECT',
'  ''Your order has been pickup by the driver'' AS event_text,',
'  ''03-AUG-2023'' as event_date,',
'  ''03:00 PM'' as event_time,',
'  ''fa-truck'' as card_icon,',
'  ''N'' edit_flag,',
'  ''N'' cancel_flag,',
'  ''Y'' track_flag,',
'  ''N'' review_flag,',
'  ''N'' return_flag',
'FROM DUAL',
'UNION ALL',
'SELECT',
'  ''The order has been delivered'' AS event_text,',
'  ''03-AUG-2023'' as event_date,',
'  ''06:00 PM'' as event_time,',
'  ''fa-home'' as card_icon,',
'  ''N'' edit_flag,',
'  ''N'' cancel_flag,',
'  ''N'' track_flag,',
'  ''Y'' review_flag,',
'  ''Y'' return_flag',
'FROM DUAL',
'</pre>'))
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E76742D69636F6E207B0A202020206C6566743A202D343370783B0A20202020746F703A203270783B0A20202020636F6C6F723A20766172282D2D612D626173652D6C696E6B2D746578742D636F6C6F72293B0A7D0A2E76742D636F6E7461696E657220';
wwv_flow_api.g_varchar2_table(2) := '7B0A202077696474683A206175746F3B0A20206D617267696E3A206175746F3B0A2020646973706C61793A20626C6F636B3B0A2020706F736974696F6E3A2072656C61746976653B0A20206D61782D77696474683A20313030253B0A7D0A0A2E76742D63';
wwv_flow_api.g_varchar2_table(3) := '6F6E7461696E657220207B0A202070616464696E673A20303B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A7D0A0A2E76742D636F6E7461696E6572206C69207B0A202020206C6973742D7374796C653A206E6F6E653B0A202020206D';
wwv_flow_api.g_varchar2_table(4) := '617267696E3A206175746F3B0A202020206D617267696E2D6C6566743A206175746F3B0A202020206D696E2D6865696768743A20353070783B0A20202020626F726465722D6C6566743A203130707820736F6C696420766172282D2D612D626173652D6C';
wwv_flow_api.g_varchar2_table(5) := '696E6B2D746578742D636F6C6F72293B0A2020202070616464696E673A203020302030707820333070783B0A20202020706F736974696F6E3A2072656C61746976653B0A202020206D617267696E2D72696768743A206175746F3B0A7D0A0A2E76742D63';
wwv_flow_api.g_varchar2_table(6) := '6F6E7461696E657220206C693A6C6173742D6368696C64207B0A2020626F726465722D6C6566743A20303B0A20206C6566743A20313070783B0A20206D617267696E2D72696768743A20313070783B0A7D0A0A2E76742D636F6E7461696E6572206C693A';
wwv_flow_api.g_varchar2_table(7) := '3A6265666F7265207B0A20202020706F736974696F6E3A206162736F6C7574653B0A202020206C6566743A202D323070783B0A20202020746F703A202D3570783B0A20202020636F6E74656E743A202220223B0A20202020626F726465723A2033707820';
wwv_flow_api.g_varchar2_table(8) := '736F6C696420766172282D2D612D626173652D6C696E6B2D746578742D636F6C6F72293B0A20202020626F726465722D7261646975733A20353030253B0A202020206261636B67726F756E643A20236666666666663B0A202020206865696768743A2033';
wwv_flow_api.g_varchar2_table(9) := '3070783B0A2020202077696474683A20333070783B0A7D0A0A2E76742D636F6E7461696E6572206C69202E76742D686561646572207B0A2020636F6C6F723A20766172282D2D612D626173652D6C696E6B2D746578742D636F6C6F72293B0A2020706F73';
wwv_flow_api.g_varchar2_table(10) := '6974696F6E3A2072656C61746976653B0A2020666F6E742D73697A653A20313270783B0A2020746F703A202D323570783B0A2020646973706C61793A20666C65783B0A7D0A0A2E76745F6865616465725F74657874207B0A2020202077696474683A2031';
wwv_flow_api.g_varchar2_table(11) := '363070783B0A7D0A0A2E76742D6974656D2D74657874207B0A20202F2A636F6C6F723A20766172282D2D612D626173652D6C696E6B2D746578742D636F6C6F72293B2A2F0A2020746F703A202D323570783B0A2020706F736974696F6E3A2072656C6174';
wwv_flow_api.g_varchar2_table(12) := '6976653B0A7D0A0A0A0A0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(525882027438762932)
,p_plugin_id=>wwv_flow_api.id(525784781462001787)
,p_file_name=>'vertical_timeline.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E76742D69636F6E7B6C6566743A2D343370783B746F703A3270783B636F6C6F723A766172282D2D612D626173652D6C696E6B2D746578742D636F6C6F72297D2E76742D636F6E7461696E65727B77696474683A6175746F3B6D617267696E3A6175746F';
wwv_flow_api.g_varchar2_table(2) := '3B706F736974696F6E3A72656C61746976653B6D61782D77696474683A313030253B70616464696E673A303B646973706C61793A696E6C696E652D626C6F636B7D2E76742D636F6E7461696E6572206C697B6C6973742D7374796C653A6E6F6E653B6D69';
wwv_flow_api.g_varchar2_table(3) := '6E2D6865696768743A353070783B626F726465722D6C6566743A3130707820736F6C696420766172282D2D612D626173652D6C696E6B2D746578742D636F6C6F72293B70616464696E673A302030203020333070783B706F736974696F6E3A72656C6174';
wwv_flow_api.g_varchar2_table(4) := '6976653B6D617267696E3A6175746F7D2E76742D636F6E7461696E6572206C693A6C6173742D6368696C647B626F726465722D6C6566743A303B6C6566743A313070783B6D617267696E2D72696768743A313070787D2E76742D636F6E7461696E657220';
wwv_flow_api.g_varchar2_table(5) := '6C693A3A6265666F72657B706F736974696F6E3A6162736F6C7574653B6C6566743A2D323070783B746F703A2D3570783B636F6E74656E743A2220223B626F726465723A33707820736F6C696420766172282D2D612D626173652D6C696E6B2D74657874';
wwv_flow_api.g_varchar2_table(6) := '2D636F6C6F72293B626F726465722D7261646975733A353030253B6261636B67726F756E643A236666663B6865696768743A333070783B77696474683A333070787D2E76742D636F6E7461696E6572206C69202E76742D6865616465727B636F6C6F723A';
wwv_flow_api.g_varchar2_table(7) := '766172282D2D612D626173652D6C696E6B2D746578742D636F6C6F72293B706F736974696F6E3A72656C61746976653B666F6E742D73697A653A313270783B746F703A2D323570783B646973706C61793A666C65787D2E76745F6865616465725F746578';
wwv_flow_api.g_varchar2_table(8) := '747B77696474683A31363070787D2E76742D6974656D2D746578747B746F703A2D323570783B706F736974696F6E3A72656C61746976657D0A2F2A2320736F757263654D617070696E6755524C3D766572746963616C5F74696D656C696E652E6373732E';
wwv_flow_api.g_varchar2_table(9) := '6D61702A2F';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(525882359824762935)
,p_plugin_id=>wwv_flow_api.id(525784781462001787)
,p_file_name=>'vertical_timeline.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C22736F7572636573223A5B22766572746963616C5F74696D656C696E652E637373225D2C226E616D6573223A5B5D2C226D617070696E6773223A22414141412C512C434143492C552C434143412C4F2C434143412C6D43';
wwv_flow_api.g_varchar2_table(2) := '2C4341454A2C612C434143452C552C434143412C572C434145412C69422C434143412C632C434149412C532C434143412C6F422C434147462C67422C434143492C652C434147412C652C434143412C6F442C434143412C6B422C434143412C69422C4341';
wwv_flow_api.g_varchar2_table(3) := '43412C572C4341474A2C32422C434143452C612C434143412C532C434143412C69422C434147462C77422C434143492C69422C434143412C552C434143412C512C434143412C572C434143412C38432C434143412C6B422C434143412C652C434143412C';
wwv_flow_api.g_varchar2_table(4) := '572C434143412C552C4341474A2C32422C434143452C6D432C434143412C69422C434143412C632C434143412C532C434143412C592C434147462C652C434143492C572C4341474A2C612C434145452C532C434143412C6942222C2266696C65223A2276';
wwv_flow_api.g_varchar2_table(5) := '6572746963616C5F74696D656C696E652E637373222C22736F7572636573436F6E74656E74223A5B222E76742D69636F6E207B5C6E202020206C6566743A202D343370783B5C6E20202020746F703A203270783B5C6E20202020636F6C6F723A20766172';
wwv_flow_api.g_varchar2_table(6) := '282D2D612D626173652D6C696E6B2D746578742D636F6C6F72293B5C6E7D5C6E2E76742D636F6E7461696E6572207B5C6E202077696474683A206175746F3B5C6E20206D617267696E3A206175746F3B5C6E2020646973706C61793A20626C6F636B3B5C';
wwv_flow_api.g_varchar2_table(7) := '6E2020706F736974696F6E3A2072656C61746976653B5C6E20206D61782D77696474683A20313030253B5C6E7D5C6E5C6E2E76742D636F6E7461696E657220207B5C6E202070616464696E673A20303B5C6E2020646973706C61793A20696E6C696E652D';
wwv_flow_api.g_varchar2_table(8) := '626C6F636B3B5C6E7D5C6E5C6E2E76742D636F6E7461696E6572206C69207B5C6E202020206C6973742D7374796C653A206E6F6E653B5C6E202020206D617267696E3A206175746F3B5C6E202020206D617267696E2D6C6566743A206175746F3B5C6E20';
wwv_flow_api.g_varchar2_table(9) := '2020206D696E2D6865696768743A20353070783B5C6E20202020626F726465722D6C6566743A203130707820736F6C696420766172282D2D612D626173652D6C696E6B2D746578742D636F6C6F72293B5C6E2020202070616464696E673A203020302030';
wwv_flow_api.g_varchar2_table(10) := '707820333070783B5C6E20202020706F736974696F6E3A2072656C61746976653B5C6E202020206D617267696E2D72696768743A206175746F3B5C6E7D5C6E5C6E2E76742D636F6E7461696E657220206C693A6C6173742D6368696C64207B5C6E202062';
wwv_flow_api.g_varchar2_table(11) := '6F726465722D6C6566743A20303B5C6E20206C6566743A20313070783B5C6E20206D617267696E2D72696768743A20313070783B5C6E7D5C6E5C6E2E76742D636F6E7461696E6572206C693A3A6265666F7265207B5C6E20202020706F736974696F6E3A';
wwv_flow_api.g_varchar2_table(12) := '206162736F6C7574653B5C6E202020206C6566743A202D323070783B5C6E20202020746F703A202D3570783B5C6E20202020636F6E74656E743A205C22205C223B5C6E20202020626F726465723A2033707820736F6C696420766172282D2D612D626173';
wwv_flow_api.g_varchar2_table(13) := '652D6C696E6B2D746578742D636F6C6F72293B5C6E20202020626F726465722D7261646975733A20353030253B5C6E202020206261636B67726F756E643A20236666666666663B5C6E202020206865696768743A20333070783B5C6E2020202077696474';
wwv_flow_api.g_varchar2_table(14) := '683A20333070783B5C6E7D5C6E5C6E2E76742D636F6E7461696E6572206C69202E76742D686561646572207B5C6E2020636F6C6F723A20766172282D2D612D626173652D6C696E6B2D746578742D636F6C6F72293B5C6E2020706F736974696F6E3A2072';
wwv_flow_api.g_varchar2_table(15) := '656C61746976653B5C6E2020666F6E742D73697A653A20313270783B5C6E2020746F703A202D323570783B5C6E2020646973706C61793A20666C65783B5C6E7D5C6E5C6E2E76745F6865616465725F74657874207B5C6E2020202077696474683A203136';
wwv_flow_api.g_varchar2_table(16) := '3070783B5C6E7D5C6E5C6E2E76742D6974656D2D74657874207B5C6E20202F2A636F6C6F723A20766172282D2D612D626173652D6C696E6B2D746578742D636F6C6F72293B2A2F5C6E2020746F703A202D323570783B5C6E2020706F736974696F6E3A20';
wwv_flow_api.g_varchar2_table(17) := '72656C61746976653B5C6E7D5C6E5C6E5C6E5C6E5C6E225D7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(525883615461775625)
,p_plugin_id=>wwv_flow_api.id(525784781462001787)
,p_file_name=>'vertical_timeline.css.map'
,p_mime_type=>'application/json'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
