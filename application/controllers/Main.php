 <?php
 defined('BASEPATH') OR exit('No direct script access allowed');

 class Main extends CI_Controller {

 	public $view_data;

 	function __construct()
 	{
 		parent :: __construct();
 		$this->view_data['theme'] = base_url('users/templates/theme0');
 		$this->view_data['site_url'] = base_url();
 		$this->load->model('Test_model');
 		$this->load->library('pagination');


 	}


 	public function index(){
 		$data = $this->Test_model->get();
 		var_dump($data);
 	}


}
