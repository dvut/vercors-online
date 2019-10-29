<?php

namespace app\controllers;

use Yii;
use app\models\ExampleSearch;
use app\models\Example;
use app\models\Feature;
use app\models\Language;
use app\models\Source;
use app\models\LoginForm;
use yii\filters\AccessControl;
use yii\filters\Cors;
use yii\filters\VerbFilter;
use yii\web\Controller;

class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ]
        ];
    }
		
    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex() {
      $searchModel = new ExampleSearch();
      $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
			
			return $this->render('index', [
        'searchModel' => $searchModel,
        'dataProvider' => $dataProvider,
				'features' => Feature::find()->orderBy('name')->all(),
				'sources' => Source::find()->orderBy('name')->all(),
			]);
    }
		
		private function configureEditor() {
			$this->getView()->registerJsFile(
				'@web/js/vercorsonline.js',
				['depends' => [\yii\web\JqueryAsset::className()]]
			);
		}
		
		public function actionExample($id) {
			$this->configureEditor();
			
			return $this->render('example', [
				'model' => $this->findExample($id),
   		 ]);
		}
		
    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout() {
			Yii::$app->user->logout();
			return $this->goHome();
    }
		
		public function actionTryonline() {
			$this->configureEditor();
			
			return $this->render('tryonline', [
				'languages' => Language::find()->all()
			]);
		}
		
		public function actionVerify() {
			// only accept POST requests
			if (!Yii::$app->request->post()) {
				throw new NotFoundHttpException('The requested page does not exist.');
			}
			
			// construct the input JSON string for the POST request
			$sourcecode = Yii::$app->request->post()['Source'];
			$data = array('Version' => '1.0', 'Source' => $sourcecode);
			$data_json = json_encode($data);
			
			// determine the request of the Rise4fun server
			$language = Yii::$app->request->post()['Language'];
			$url = Yii::$app->params['Rise4FunHost'] . '/' . $language . '/run';
			
			// build the POST request to the VerCors verification server
			$request = curl_init();
			curl_setopt($request, CURLOPT_URL, $url);
			curl_setopt($request, CURLOPT_FOLLOWLOCATION, true);
			curl_setopt($request, CURLOPT_POST, true);
			curl_setopt($request, CURLOPT_RETURNTRANSFER, true);  
			curl_setopt($request, CURLOPT_POSTFIELDS, $data_json);
			curl_setopt($request, CURLOPT_HTTPHEADER, array(
				'Content-Type: application/json',
				'Content-Length: ' . strlen($data_json))
			);

			// perform the POST request
			$response = curl_exec($request);
			curl_close($request);

			// output the response of the POST request
			Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
			return $response;
		}
		
    /**
     * Finds the Example model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Example the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findExample($id) {
        if (($model = Example::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
