<div class="big_cadre">
	<h1>{TITRE}</h1>
	<div class="big_cadre">
		<h1>{TITRE_GESTION}</h1>
		<form method="post" action="{ICI}" class="visible">
			<p>
				<span><label for="SRC">{TXT_SOURCE}&nbsp;:</label></span>
				<span><input name="SRC" id="SRC" type="text" value="{SCR}" onblur="formverif(this.id,'nbr','5')" /></span>
			</p>
			<p>
				<span><label for="AUTOPLAY">{TXT_AUTO_PLAY}&nbsp;:</label></span>
				<span>
					<select name="AUTOPLAY" id="AUTOPLAY" onblur="formverif(this.id,'change','0')" />
						<option value="0">{CHOISIR}</option>
						<option value="TRUE" {CHECK_AUTOPLAY_1}>{OUI}</option>
						<option value="FALSE" {CHECK_AUTOPLAY_0}>{NON}</option>
					</select>
				</span>
			</p>
			<p>
				<span><label for="LOOP">{TXT_LOOP}&nbsp;:</label></span>
				<span>
					<select name="LOOP" onblur="formverif(this.id,'change','0')">
						<option value="0">{CHOISIR}</option>
						<option value="TRUE" {CHECK_LOOP_1}>{OUI}</option>
						<option value="FALSE" {CHECK_LOOP_0}>{NON}</option>
					</select>
				</span>
			</p>
			<p>
				<span><label for="chanteur">{TXT_ARTISTE}&nbsp;:</label></span>
				<span><input name="chanteur" type="text" id="chanteur" value="{CHANTEUR}" onblur="formverif(this.id,'nbr','3')" /></span>
			</p>
			<p>
				<span><label for="SRC">{TXT_TITRE}&nbsp;:</label></span>
				<span><input name="titre" type="text" id="titre" value="{TITRE_MP3}" onblur="formverif(this.id,'nbr','3')" /></span>
			</p>
			<p>
				<span>
					<!-- BEGIN rajouter -->
					<input type="submit" name="Envoyer" value="{rajouter.ENVOYER}" />
					<!-- END rajouter -->
					<!-- BEGIN edit -->
					<input type="submit" name="Editer" value="Editer" />
					<!-- END edit -->
					<input name="for" type="hidden" id="for" value="{ID}" />
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
						<th>{TXT_TITRE}</th>
						<th>{TXT_ARTISTE}</th>
						<th>{ACTION}</th>
					</tr>
				</thead>
				<tbody>
					<!-- BEGIN liste --> 
					<tr> 
						<td><a href="{liste.SRC}" onclick="window.open('{liste.SRC}');return false;">{liste.TITRE}</a></td> 
						<td>{liste.CHANTEUR}</td> 
						<td>
							<form action="{ICI}" method="post"> 
								<input name="dell" type="submit" value="{liste.SUPPRIMER}" onclick="return demande('{TXT_CON_DELL}')" /> 
								<input name="for" type="hidden" value="{liste.ID}" /> 
								<input name="edit" type="submit" value="{liste.EDITER}" /> 
							</form>
						</td> 
					</tr> 
					<!-- END liste --> 
				</tbody>
			</table>
		</div>
	</div>
</div>