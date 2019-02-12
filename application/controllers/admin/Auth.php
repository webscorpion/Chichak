<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public $admin_data;

	function __construct()
	{
		parent::__construct();
		$this->admin_data['base_url'] = base_url('admin');
		$this->admin_data['theme'] = base_url('administrator/templates/admin');
		$this->load->model('admin/admin_model');
		$this->load->library('form_validation');
	}

	
public function index()
	{
		
		$this->admin_data['title'] = "ورود به سایت";
		$this->admin_data['page'] = "login";

		if ($this->session->has_userdata('admin_username')) {
			if ($this->session->userdata['admin_username'] == $this->input->cookie('admin_username',TRUE)) {
				redirect(base_url() . 'admin/dashboard');
			}
		}
		
		$this->parser->parse('admin_panel', $this->admin_data);
	} //index


	public function login(){
		
		if ($this->input->server('REQUEST_METHOD') == "POST") {

			$this->form_validation->set_rules('username', 'username', 'trim|required|min_length[5]',
				array(
					'required' => '<span class="alert alert-danger d-block clearfix p-1">پر کردن نام کاربری الزامی میباشد.</span>', 
					'min_length' => '<span class="alert alert-danger d-block clearfix p-1">نام کاربری حداقل 5 حرفی میباشد.</span>'
				)
			);

			$this->form_validation->set_rules('password', 'password', 'trim|required|min_length[6]',
				array(
					'required' => '<span class="alert alert-danger d-block clearfix p-1">پر کردن پسورد الزامی میباشد.</span>', 
					'min_length' => '<span class="alert alert-danger d-block clearfix p-1">پسورد حداقل 6 رقمی میباشد.</span>'
				)
			);

			$admin_data = array(
				'username' => $this->input->post('username',TRUE),
				'password' => md5($this->input->post('password',TRUE)),
			);

			if($this->form_validation->run() == false){
			        $this->admin_data['title'] = "ورود به سایت";
				$this->admin_data['page'] = "login";
				$this->admin_data['admin-message'] = "admin message goes here";
				$this->parser->parse('admin_panel', $this->admin_data);
			}
			
			elseif (!$this->admin_model->login($admin_data)) {
				redirect(base_url('admin?login-error=1'));
				
			} else {

				$admin_login = array(
					'admin_username' => $this->input->post('username',TRUE),
					'admin_id' => $this->admin_model->return_adminid($this->input->post('username',TRUE))[0]['id'],
					'admin_logged' => 1, 
				);
				$this->session->set_userdata($admin_login );
				$this->input->set_cookie('admin_username', $this->input->post('username',TRUE), '864000');
				redirect(base_url('admin/dashboard'));
			}
		}
	}


	public function register(){
		
		if ($this->input->server('REQUEST_METHOD') == "POST") {
			
			if (empty($this->input->post('fname',TRUE)) || empty($this->input->post('lname',TRUE)) || empty($this->input->post('email',TRUE)) || empty($this->input->post('password',TRUE))) {
				redirect(base_url('admin?error=1'));
			} elseif ($this->input->post('password',TRUE) != $this->input->post('repassword',TRUE)) {
				redirect(base_url('admin?error=2'));
			} elseif ($this->input->post('password',TRUE) == $this->input->post('repassword',TRUE)) {
				if (strlen($this->input->post('password',TRUE)) < 6) {
					redirect(base_url('admin?error=3'));
				}
			}
			
			$admin_data = array(
				'fname' => $this->input->post('fname',TRUE),
				'lname' => $this->input->post('lname',TRUE),
				'email' => $this->input->post('email',TRUE),
				'password' => md5($this->input->post('password',TRUE)),
			);

			if ($this->admin_model->register($admin_data)) {
				redirect(base_url('admin?error=0'));
			} else {
				redirect(base_url('admin?error=4'));
			}
		}
	}

	public function fix(){
		$this->session->sess_destroy();
		$this->session->unset_userdata('__ci_last_regenerate');
		session_destroy();
		var_dump($this->session->userdata);
	}

	public function test(){
		echo "OK";
	}


}