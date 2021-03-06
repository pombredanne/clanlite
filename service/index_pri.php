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
$action_membre = 'where_news';
require($root_path.'conf/template.php');
require($root_path.'conf/conf-php.php');
require($root_path.'conf/frame.php');
$template = new Template($root_path.'templates/'.$session_cl['skin']);
$template->set_filenames( array('body' => 'accueil_centre.tpl'));
// on prend le nombre de news pour les news/page
$_GET['limite'] = (empty($_GET['limite']) || !is_numeric($_GET['limite']))? 0 : $_GET['limite'];
$total = get_nbr_objet('news', '');
$sql = "SELECT news.*, COUNT(reaction.id_news) FROM `".$config['prefix']."news` AS news LEFT JOIN ".$config['prefix']."reaction_news AS reaction ON news.id = reaction.id_news  GROUP BY news.id ORDER BY news.id DESC LIMIT ".$_GET['limite'].", ".$config['objet_par_page'];
if (! ($list_news = $rsql->requete_sql($sql)) )
{
	sql_error($sql, $rsql->error, __LINE__, __FILE__);
}
// on commence la boucle pour les news
$template->assign_vars( array( 
	'TITRE_NEWS' => $langue['news_titre'],
	'POSTE_LE' => $langue['poste_le'],
	'PAR' => $langue['poste_par'],
));
while ( $recherche = $rsql->s_array($list_news) ) 
{	
	switch($recherche['COUNT(reaction.id_news)'])
	{
		case 0:
			$reaction = $langue['0_reaction'];
		break;
		case 1:
			$reaction = $langue['1_reaction'];
		break;
		default:
			$reaction = sprintf($langue['plus_reaction'], $recherche['COUNT(reaction.id_news)']);
		break;
	}
	$template->assign_block_vars('news', array( 
		'BY' => $recherche['user'],
		'COMMENTAIRE' => $reaction,
		'DATE'  => adodb_date('j/n/y H:i', $recherche['date']+$session_cl['correction_heure']),
		'FOR' => session_in_url('reaction.php?for='.$recherche['id']),
		'TEXT' => bbcode($recherche['info']),
		'TITRE' => $recherche['titre']
	));
}
displayNextPreviousButtons($_GET['limite'],$total, 'multi_page', 'index_pri.php');
$template->pparse('body');
require($root_path.'conf/frame.php');
?>