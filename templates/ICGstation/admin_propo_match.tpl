<div class="big_cadre">
	<h1>{TITRE}</h1>
	<!-- BEGIN notification -->
	<div class="big_cadre">
		<h1>{notification.TITRE}</h1>
		<form method="post" action="{ICI}" class="visible">
			<p>
				<span><label for="From">{notification.ADR_EXPEDITEUR}&nbsp;:</label></span>
				<span><input name="From" type="text" id="From" value="{notification.MASTER_MAIL}" onblur="formverif(this.id,'mail','')" /></span>
			</p>
			<p>
				<span><label for="Reply">{notification.ADR_RETOUR}&nbsp;:</label></span>
				<span><input name="Reply" type="text" id="Reply" value="{notification.MASTER_MAIL}" onblur="formverif(this.id,'mail','')" /></span>
			</p>
			<p>
				<span><label for="mail">{notification.ENVOYER_A}&nbsp;:</label></span>
				<span><input name="mail" type="text" id="mail" value="{notification.TO}" onblur="formverif(this.id,'mail','')" /></span>
			</p>
			<p>
				<span><label for="jj">{notification.TXT}&nbsp;:</label></span>
				<span><textarea name="texte" id="texte" cols="40" rows="8" onblur="formverif(this.id,'nbr','4')">{notification.TEXTE}</textarea></span>
			</p>
			<p>
				<span><input type="submit" name="envois_mail" value="{notification.ENVOYER}" /><input name="id" type="hidden" value="{notification.ID}" /><input name="envois" type="hidden" id="envois" value="{notification.ENVOIS}" /></span>
			</p>
		</form>
	</div>
	<!-- END notification --> 
	<div class="big_cadre">
		<h1>{TITRE_LISTE}</h1>
		<div class="news">
			<table class="table">
				<thead>
					<tr>
						<th>{CLAN}</th>
						<th>{CONTACTER}</th>
						<th>{DATE}</th>
						<th>{HEURE}</th>
						<th>{NOMBRE_PAR_TEAM}</th>
						<th>{INFO}</t>
						<th>{ACTION}</th>
						<th>{REPONCE}</th>
					</tr>
				</thead>
				<tbody>
					<!-- BEGIN propo -->
					<tr>
						<td><a href="{propo.URL_CLAN}" onclick="window.open('{propo.URL_CLAN}');return false;">{propo.CLAN}</a></td>
						<td><a href="mailto:{propo.MAIL}"><img src="../images/msg.gif" alt="{propo.ALT_MAIL}" /></a><a href='javascript:DoInstantMessage("{propo.NOM}","{propo.CLAN}");'><img src="../images/icon_msnm.gif" alt="{propo.ALT_MSN}" /></a></td>
						<td>{propo.DATE}</td>
						<td>{propo.TIME}</td>
						<td>{propo.VS}</td>
						<td>{propo.INFO}</td>
						<td>
							<form method="post" action="{ICI}">
								<input name="id" type="hidden" value="{propo.ID}" />
								<input name="voir" type="hidden" value="{propo.VOIR}" />
								<input type="submit" name="del" value="{propo.DELL}" onclick="return demande('{TXT_CON_DELL}')" />
							</form>
						</td>
						<td>
							<form method="post" action="{ICI}">
								<input name="id" type="hidden" value="{propo.ID}" />
								<input type="submit" name="envois_oui" value="{propo.OUI}" />
								<input type="submit" name="envois_non" value="{propo.NON}" />
							</form>
						</td>
					</tr>
					<!-- END propo -->
				</tbody>
			</table>
		</div>
	</div>
</div>