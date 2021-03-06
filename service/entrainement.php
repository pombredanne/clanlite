<?php
/****************************************************************************
 *	Fichier		: 															*
 *	Copyright	: (C) 2004 ClanLite											*
 *	Email		: support@clanlite.org										*
 *																			*
 *   This program is free software; you can redistribute it and/or modify	*
 *   it under the terms of the GNU General Public License as published by	*
 *   the Free Software Foundation; either version 2 of the License, or		*
 *   (at your option) any later version.									*
 ***************************************************************************/
define('CL_AUTH', true);
$root_path = './../';
$action_membre = 'where_entrainement';
require($root_path.'conf/template.php');
require($root_path.'conf/conf-php.php');
require($root_path.'controle/cook.php');
require($root_path.'conf/frame_admin.php');
$template = new Template($root_path.'templates/'.$session_cl['skin']);
$template->set_filenames( array('body' => 'antrainement.tpl'));
$template->assign_vars(array( 
	'ENTRAINEMENT' => $langue['titre_entrainement'],
	'DATE' => $langue['date'],
	'MSG_PRIVE' => $langue['message_cote_prive'],
	'DETAILS' => $langue['d�tails'],
	'POSTEUR' => $langue['posteur'],
));
// on v�rie que l'info est pas d�p�se�e
$sql = "SELECT * FROM ".$config['prefix']."entrainement ORDER BY `id` DESC";
if (! ($get = $rsql->requete_sql($sql)) )
{
	sql_error($sql, $rsql->error, __LINE__, __FILE__);
}
while ($list_entrain = $rsql->s_array($get))
{ 
	if ($list_entrain['date'] <= $config['current_time'] )
	{
		$sql = "DELETE FROM ".$config['prefix']."entrainement WHERE id = ".$list_entrain['id'];
		if (!$rsql->requete_sql($sql))
		{
			sql_error($sql, $rsql->error, __LINE__, __FILE__);
		}
		
	}
	else
	{
		$template->assign_block_vars('entrain', array( 
			'DATE' => adodb_date('H:i j/n/Y', $list_entrain['date']+$session_cl['correction_heure']),
			'INFO' => bbcode($list_entrain['info']), 
			'CODE'  => $list_entrain['priver'],
			'POSTEUR' => $list_entrain['user'],
		));
	} 
}
$template->pparse('body');
require($root_path.'conf/frame_admin.php');
?>