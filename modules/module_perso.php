<?php
/****************************************************************************
 *	Fichier		: module_perso.php											*
 *	Copyright	: (C) 2007 ClanLite											*
 *	Email		: support@clanlite.org										*
 *																			*
 *   This program is free software; you can redistribute it and/or modify	*
 *   it under the terms of the GNU General Public License as published by	*
 *   the Free Software Foundation; either version 2 of the License, or		*
 *   (at your option) any later version.									*
 ***************************************************************************/
if (defined('CL_AUTH'))
{
	if( !empty($get_nfo_module) )
	{
		$filename = basename(__FILE__);
		$nom = 'Module perso';
		return;
	}
	if( !empty($module_installtion) || !empty($module_deinstaller) )
	{
		return;
	}
	$template->assign_block_vars('modules_'.$modules['place'], array( 
		'TITRE' => $modules['nom'],
		'IN' => $modules['config']
	));
	return;
}
if( !empty($_GET['config_modul_admin']) || !empty($_POST['Submit_module_perso_module']) )
{
	define('CL_AUTH', true);
	$root_path = './../';
	$action_membre= 'where_module_module_custom';
	$niveau_secu = 16;
	require($root_path.'conf/template.php');
	require($root_path.'conf/conf-php.php');
	require($root_path.'controle/cook.php');
	$_POST = pure_var($_POST);
	$id_module = (!empty($_POST['id_module']))? $_POST['id_module'] : $_GET['id_module'];
	if ( !empty($_POST['Submit_module_perso_module']) )
	{
		$sql = "UPDATE ".$config['prefix']."modules SET config='".$_POST['contenu']."' WHERE id ='".$id_module."'";
		if (!$rsql->requete_sql($sql))
		{
			sql_error($sql, $rsql->error, __LINE__, __FILE__);
		}
		redirec_text($root_path.'administration/modules.php' ,$langue['redirection_module_custom_edit'], 'admin');
	}
	require($root_path.'conf/frame_admin.php');
	$template = new Template($root_path.'templates/'.$session_cl['skin']);
	$template->set_filenames( array('body' => 'modules/module_perso.tpl'));
	liste_smilies_bbcode(true, '', 25);
	$sql = "SELECT config FROM ".$config['prefix']."modules WHERE id ='".$id_module."'";
	if (! ($get = $rsql->requete_sql($sql)) )
	{
		sql_error($sql, $rsql->error, __LINE__, __FILE__);
	}
	$recherche = $rsql->s_array($get);
	$template->assign_vars(array(
		'ICI' => session_in_url('module_perso.php'),
		'TITRE' => $langue['titre_module_module_custom'],
		'ID'=> $id_module,
		'TXT_CONTENU' => $langue['module_custom_contenu'],
		'CONTENU' => $recherche['config'],
		'EDITER' => $langue['editer'],
	));
	$template->pparse('body');
	require($root_path.'conf/frame_admin.php');
	return;
}
?>