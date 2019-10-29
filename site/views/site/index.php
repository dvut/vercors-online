<?php

use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;

/* @var $this yii\web\View */

$this->title = 'VerCors Example Database';
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>VerCors Example Database</h1>
        <p class="lead">A list of example programs and case studies verified by the VerCors verification toolset</p>
    </div>

    <div class="body-content">
        <div class="row">
            <div class="col-lg-4">
                <h2>About VerCors</h2>
                <p>VerCors is a toolset for practical mechanised verification of parallel and concurrent software under different concurrency models, notably heterogeneous and homogeneous threading. VerCors has verification support for multiple languages with concurrency features, such as Java, OpenCL (i.e. GPU kernels and atomics), and OpenMP for C (i.e. compiler directives). VerCors uses separation logic with permission accounting as its logical foundation.</p>
								<p><a class="btn btn-default" href="/site/tryonline">Try online &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Download</h2>
                <p>The source code of VerCors is publicly available and can be downloaded from <a href="https://github.com/utwente-fmt/vercors" target="_blank">Github</a>. Installation instructions and example verification cases are also provided. VerCors has been tested on Linux, MacOS X, and on Windows (via Cygwin). Limited documentation of the annotation language is provided at the <a href="https://github.com/utwente-fmt/vercors/wiki" target="_blank">Github Wiki</a>. </p>

                <p><a class="btn btn-default" href="https://github.com/utwente-fmt/vercors" target="_blank">Download VerCors &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Contact</h2>
                <p>For questions and (technical) support, email to "w.h.m.oortwijn at utwente dot nl". Bug reports and feature requests can be submitted via the <a href="https://github.com/utwente-fmt/vercors/issues" target="_blank">issue tracker</a> on Github. A complete list of papers related to the VerCors project is given <a href="http://eprints.eemcs.utwente.nl/view/project/VerCors.html" target="_blank">here</a>.</p>

                <p><a class="btn btn-default" href="http://www.yiiframework.com/extensions/" target="_blank">Contact us &raquo;</a></p>
            </div>
        </div>
				
				<br />
				<div class="container">
						<div class="row">
							<h2>Example database</h2>
					    <?= GridView::widget([
					        'dataProvider' => $dataProvider,
					        'filterModel' => $searchModel,
					        'columns' => [
					            'id',
											'title',
			
											['attribute' => 'feature', 'label' => 'Verification features', 'filter' => ArrayHelper::map($features, 'id', 'name'), 'value' => function ($data) {
												return $data->featuresText();
											}],
											['attribute' => 'source', 'label' => 'Example source', 'filter' => ArrayHelper::map($sources, 'id', 'name'), 'value' => function ($data) {
												return $data->sourcesText();
											}],
											
											['attribute' => 'languagename', 'label' => 'Language', 'value' => 'language.name'],
											
											['label' => 'More information', 'format' => 'raw', 'value' => function ($data) {
												return Html::a('more info', [
													'/site/example', 'id' => $data->id
												]);
											}]
					        ],
					    ]); ?>
						</div>
				</div>
    </div>
</div>
