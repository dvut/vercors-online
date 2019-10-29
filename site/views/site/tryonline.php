<?php
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\widgets\DetailView;
use f4soft\codemirror\CodeMirror;
?>

<div class="example-view">
	<h1>Try VerCors online</h1>
	<p>Does the following program verify?</p>
	
	<div class="example-form">
		<label class="control-label" for="example-backendid">Language</label>
		<?= Html::dropDownList('lang', '1', ArrayHelper::map($languages, 'extension', 'extension'), ['class' => 'form-control']) ?>
		<?php $this->registerJs("$('select[name=lang]').on('change', function () {
			$('input[name=language]').val($(this).val());
		})"); ?>
	</div>
	
	<div style="margin-top: 12pt">
		<label class="control-label" for="example-backendid">Code</label>
		<?= Codemirror::widget([
			'name' => 'examplecode',
			'value' => '// start here...',
			'clientOptions' => [
				'lineNumbers' => true,
				'matchBrackets' => true,
				'indentUnit' => 2,
				'indentWithTabs' => true
			]
		]) ?>

		<?php $this->registerJs("editor.on('change', function () {
			editor.save();
		})"); ?>
	</div>
	<div id="verification-results" style="margin: 12pt 0 12pt 0; font-style: italic">
		Note, verification may take a while and has a time-out of 20 seconds.
	</div>
	<div>
		<?= Html::hiddenInput('language', 'pvl') ?>
			
		<?= Html::button('Verify this!', [
			'class' => 'btn btn-success',
			'id' => 'verifythis'
		]) ?>
	</div>
</div>
