<?php
namespace Org\Util;
//e签宝电子合同
class Tsign{
	
	private $istest;
	private $projectId;
	private $projectSecret;
	private $equipId;
	private $token;
	private $login_url;  //身份认证接口地址
	private $accountadd_url;  //创建个人账户接口地址
	private $tempperseal_url; //创建个人模板印章接口地址
	private $generatepdf_url;   //Pdf合同模板填充接口
	private $sign_url;   //发起个人用户自动签署
	private $docarchive_url;   //合同归档
	private $docstatus_url;   //查询合同签约状态

	public function __construct($projectId='', $projectSecret='',$equipId='',$istest=false) {
		$this->projectId = $projectId;
		$this->projectSecret = $projectSecret;
		$this->equipId = $equipId;
		$this->istest = $istest;
		if($this->istest){
			$this->login_url='https://testoapi.tsign.cn/openservice/api/v1.0/platform/login';
			$this->accountadd_url='https://testoapi.tsign.cn/openservice/api/v1.0/account/add';
			$this->tempperseal_url='https://testoapi.tsign.cn/openservice/api/v1.0/account/tempperseal';
			$this->generatepdf_url='https://testoapi.tsign.cn/openservice/api/v1.0/pdf/template/generatePdf';
			$this->sign_url='https://testoapi.tsign.cn/openservice/api/v1.0/signflow/sign';
			$this->docarchive_url='https://testoapi.tsign.cn/openservice/api/v1.0/signflow/docarchive';
			$this->docstatus_url='https://testoapi.tsign.cn/openservice/api/v1.0/signflow/docstatus';
		}else{
			$this->login_url='https://oapi.tsign.cn/openservice/api/v1.0/platform/login';
			$this->accountadd_url='https://oapi.tsign.cn/openservice/api/v1.0/account/add';
			$this->tempperseal_url='https://oapi.tsign.cn/openservice/api/v1.0/account/tempperseal';
			$this->generatepdf_url='https://oapi.tsign.cn/openservice/api/v1.0/pdf/template/generatePdf';
			$this->sign_url='https://oapi.tsign.cn/openservice/api/v1.0/signflow/sign';
			$this->docarchive_url='https://oapi.tsign.cn/openservice/api/v1.0/signflow/docarchive';
			$this->docstatus_url='https://oapi.tsign.cn/openservice/api/v1.0/signflow/docstatus';
		}

		$this->token=$this->getAccessToken();

	}
 
  
	//身份认证接口 获取Token
	private function getAccessToken(){
		$data = json_decode(@file_get_contents('Public/tsign/access_token-'.$this->equipId.'.json'));

		if (!$data || $data->expire_time < time()) {
			
			$postArr = array (
				'projectId'  =>  $this->projectId, //用户账号
				'projectSecret' => $this->projectSecret,  //
				'equipId' => $this->equipId
			);
			$header=array('Content-Type: application/json; charset=utf-8');

			$res = json_decode($this->curlPost($this->login_url,$postArr,$header),true);

			if(isset($res['code']) && $res['code']==0 && isset($res['data']['token'])){
				$access_token = $res['data']['token'];
			}else{
				$this->log(__SELF__,serialize($res));
				$access_token='';
			}

			if($access_token!=''){
				$data->expire_time = time()+3600*24*10;
				$data->access_token = $access_token;
				$fp = fopen('Public/tsign/access_token-'.$this->equipId.'.json', "w");
				fwrite($fp, json_encode($data));
				fclose($fp);
			}
		}else{
			$access_token = $data->access_token;
		}

		return $access_token;
	}
	
	//创建个人账户
	public function addPersonAccount($accountinfo=array()){
		if ($this->token == null || $this->token=='') {
			return false;
		}
		if(isset($accountinfo['name'])){
			if(trim($accountinfo['name'])==''){
				return false;
			}
		}else{
			return false;
		}
		if(isset($accountinfo['identityType'])){
			if(trim($accountinfo['identityType'])==''){
				return false;
			}
		}else{
			return false;
		}
		if(isset($accountinfo['identityNum'])){
			if(trim($accountinfo['identityNum'])==''){
				return false;
			}
		}else{
			return false;
		}
		if(isset($accountinfo['mobile'])){
			if(trim($accountinfo['mobile'])==''){
				return false;
			}
		}else{
			return false;
		}
		if(isset($accountinfo['status'])){
			if(trim($accountinfo['status'])==''){
				return false;
			}
		}else{
			return false;
		}
		
        $header=array('Content-Type: application/json; charset=utf-8','token:'.$this->token,'equipId:'.$this->equipId);

		$res = json_decode($this->curlPost($this->accountadd_url,$accountinfo,$header),true);

		if(isset($res['code']) && $res['code']==0 && isset($res['data']['accountUid'])){
			return $res['data'];
		}else{
			$this->log(__SELF__,serialize($res));
			return false;
		}
	}
	
	//创建个人模板印章
	public function addtempperseal($tempperseal=array()){
		if ($this->token == null || $this->token=='') {
			return false;
		}
		if(isset($tempperseal['accountUid'])){
			if(trim($tempperseal['accountUid'])==''){
				return false;
			}
		}else{
			return false;
		}
		if(isset($tempperseal['sealName'])){
			if(trim($tempperseal['sealName'])==''){
				return false;
			}
		}else{
			return false;
		}
		if(isset($tempperseal['color'])){
			if(trim($tempperseal['color'])==''){
				return false;
			}
		}else{
			return false;
		}
		if(isset($tempperseal['type'])){
			if(trim($tempperseal['type'])==''){
				return false;
			}
		}else{
			return false;
		}

		
        $header=array('Content-Type: application/json; charset=utf-8','token:'.$this->token,'equipId:'.$this->equipId);

		$res = json_decode($this->curlPost($this->tempperseal_url,$tempperseal,$header),true);

		if(isset($res['code']) && $res['code']==0 && isset($res['data']['sealId'])){
			return $res['data'];
		}else{
			$this->log(__SELF__,serialize($res));
			return false;
		}
	}
	
	
	//Pdf合同模板填充
	public function generatepdf($pdfinfo=array()){
        if ($this->token == null || $this->token=='') {
			return false;
		}

		if(isset($pdfinfo['templateId'])){
			if(trim($pdfinfo['templateId'])==''){
				return false;
			}
		}else{
			return false;
		}
		if(isset($pdfinfo['docId'])){
		}else{
			return false;
		}
		if(isset($pdfinfo['docTitle'])){
			if(trim($pdfinfo['docTitle'])==''){
				return false;
			}
		}else{
			return false;
		}
		if(isset($pdfinfo['userFormkeyvaluepair'])){

		}else{
			return false;
		}
		
		

       $header=array('Content-Type: application/json; charset=utf-8','token:'.$this->token,'equipId:'.$this->equipId);
	   
		$res = json_decode($this->curlPost($this->generatepdf_url,$pdfinfo,$header),true);

		if(isset($res['code']) && $res['code']==0 && isset($res['data']['docId'])){
			return $res['data'];
		}else{
			$this->log(__SELF__,serialize($res));
			return false;
		}
		
	}
	
	
  
  	//发起个人/企业用户自动签署
	public function sign($signinfo=array()){
		if ($this->token == null || $this->token=='') {
			return false;
		}
		if(isset($signinfo['thirdParticipantId'])){
			if(trim($signinfo['thirdParticipantId'])==''){
				return false;
			}
		}else{
			return false;
		}
		
		if(isset($signinfo['docId'])){
			if(trim($signinfo['docId'])==''){
				return false;
			}
		}else{
			return false;
		}
		if(isset($signinfo['signType'])){
			if(trim($signinfo['signType'])==''){
				return false;
			}
		}else{
			return false;
		}
		
		if(isset($signinfo['sealId'])){
			if(trim($signinfo['sealId'])==''){
				return false;
			}
		}else{
			return false;
		}

		
        $header=array('Content-Type: application/json; charset=utf-8','token:'.$this->token,'equipId:'.$this->equipId);

		$res = json_decode($this->curlPost($this->sign_url,$signinfo,$header),true);

		if(isset($res['code']) && $res['code']==0 && isset($res['data']['thirdParticipantId'])){
			return $res['data'];
		}else{
			$this->log(__SELF__,serialize($res));
			return false;
		}
	}
	
	//合同归档
	public function docarchive($docid=array()){
        if ($this->token == null || $this->token=='') {
			return false;
		}
		if(isset($docid['docId'])){
			if(trim($docid['docId'])==''){
				return false;
			}
		}else{
			return false;
		}
		
        $header=array('Content-Type: application/json; charset=utf-8','token:'.$this->token,'equipId:'.$this->equipId);

		$res = json_decode($this->curlPost($this->docarchive_url,$docid,$header),true);

		if(isset($res['code']) && $res['code']==0){
			return true;
		}else{
			$this->log(__SELF__,serialize($res));
			return false;
		}
	}
	
	//查询合同签约状态
	public function docstatus($docid=array()){
        if ($this->token == null || $this->token=='') {
			return false;
		}
		if(isset($docid['docId'])){
			if(trim($docid['docId'])==''){
				return false;
			}
		}else{
			return false;
		}
		
        $header=array('Content-Type: application/json; charset=utf-8','token:'.$this->token,'equipId:'.$this->equipId);

		$res = json_decode($this->curlPost($this->docstatus_url,$docid,$header),true);

		if(isset($res['code']) && $res['code']==0 && isset($res['data']['docId'])){
			return $res['data'];
		}else{
			$this->log(__SELF__,serialize($res));
			return false;
		}
	}
  

  
	/**
	 * 通过CURL发送HTTP请求
	 * @param string $url  //请求URL
	 * @param array $postFields //请求参数 
	 * @return mixed
	 */
	private function curlPost($url,$postFields,$header){
		$postFields = json_encode($postFields);
		$ch = curl_init ();
		curl_setopt( $ch, CURLOPT_URL, $url ); 
		curl_setopt( $ch, CURLOPT_HTTPHEADER, $header);
		curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt( $ch, CURLOPT_POST, 1 );
		curl_setopt( $ch, CURLOPT_POSTFIELDS, $postFields);
		curl_setopt( $ch, CURLOPT_TIMEOUT,500); 
		curl_setopt( $ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, 0);
		$ret = curl_exec ( $ch );
		if (false == $ret) {
			$result = curl_error(  $ch);
		} else {
			$rsp = curl_getinfo( $ch, CURLINFO_HTTP_CODE);
			if (200 != $rsp) {
				$result = "请求状态 ". $rsp . " " . curl_error($ch);
			} else {
				$result = $ret;
			}
		}
		curl_close ( $ch );
		return $result;
	}
	
	private function httpGet($url) {
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_TIMEOUT, 500);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
		curl_setopt($curl, CURLOPT_URL, $url);

		$res = curl_exec($curl);
		curl_close($curl);

		return $res;
	}
  
  
	private function log($url,$result) {
        if($this->istest) {
            $str = PHP_EOL . '【地址】：' . $url;
            $str .= PHP_EOL . '【返回】: ' . $result . PHP_EOL;
			
            $fp = @fopen(BASE_PATH . '/Public/tsign/debug-' . date('Y-m-d') . '.log', 'a+');
			$log_str = date('Y-m-d H:i:s') . ' > ' . $str . PHP_EOL;
            fwrite($fp, $log_str, strlen($log_str));
			fclose($fp);
        }
	}
}

