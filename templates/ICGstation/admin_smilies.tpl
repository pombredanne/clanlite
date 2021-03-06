<div class="big_cadre">
	<h1>{TITRE}</h1>
	<div class="big_cadre">
		<h1>{TITRE_GESTION}</h1>
		<form method="post" action="{ICI}" class="visible">
			<p>
				<span><label for="text">{TXT}&nbsp;:</label></span>
				<span><input name="text" type="text" id="text" value="{TEXT}" onblur="formverif(this.id,'nbr','2')" /></span>
			</p>
			<p>
				<span><label for="img">{IMAGES}&nbsp;:</label></span>
				<span><select name="img" id="img" onblur="formverif(this.id,'autre','0')">
				  <option value="0">{CHOISIR}</option>
				  <!-- BEGIN list_img -->
				  <option value="{list_img.VALEUR}" {list_img.SELECTED}>{list_img.VALEUR}</option>
				  <!-- END list_img -->
				</select></span>
			</p>
			<p>
				<span><label for="def">{TXT_DEF}&nbsp;:</label></span>
				<span><input name="def" type="text" id="def" value="{DEF}" onblur="formverif(this.id,'nbr','2')" /></span>
			</p>
			<p>
				<span>
					<input name="for" type="hidden" id="for" value="{ID}" />
					<!-- BEGIN rajouter -->
					<input type="submit" name="envoyer" value="{rajouter.ENVOYER}" />
					<!-- END rajouter -->
					<!-- BEGIN edit -->
					<input type="submit" name="envois_edit" value="{edit.EDITER}" />
					<!-- END edit -->
				</span>
			</p>
		</form>
	</div>
	<div class="big_cadre">
		<h1>{TITRE_LISTE}</h1>
		<div class="news">
		<table class="table">
			<thead>
				<tr>
					<th>{TXT}</th>
					<th>{IMAGES}</th>
					<th>{TXT_DEF}</th>
					<th>{ACTION}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BEGIN list_smilies -->
				<tr>
					<td nowrap>{list_smilies.TEXT}</td>
					<td nowrap><img src="../images/smilies/{list_smilies.IMG}" alt="{list_smilies.DEF}" width="{list_smilies.WIDTH}" height="{list_smilies.HEIGHT}" /></td>
					<td>{list_smilies.DEF}</td>
					<td>
						<form action="{ICI}" method="post">
							<input name="Supprimer" type="submit" value="{list_smilies.SUPPRIMER}" onclick="return demande('{TXT_CON_DELL}')" />
							<input name="for" type="hidden" value="{list_smilies.ID}" />
							<input name="Editer" type="submit" value="{list_smilies.EDITER}" />
						</form>
					</td>
				</tr>
				<!-- END list_smilies -->
			</tbody>
		</table>
		</div>
	</div>
</div>