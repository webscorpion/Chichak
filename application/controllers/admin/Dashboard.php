<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public $admin_data;
	public $image_list;
	public $image_folders = "";
	function __construct()
	{
		parent::__construct();
		$this->load->model('admin/admin_model');

		$this->admin_data['base_url'] = base_url('admin');
		$this->admin_data['site_url'] = base_url();
		$this->admin_data['theme'] = base_url('administrator/templates/admin');
		$this->admin_data['unapproved_comments_count'] = $this->admin_model->unapproved_comments_count();

		if ($this->session->userdata('admin_logged') != 1) {
			redirect(base_url() . 'admin');
		}

	}


	public function index(){

		$this->admin_data['title'] = "داشبورد مدیریت";
		$this->admin_data['page'] = "main";
		$this->admin_data['Posts'] = $this->admin_model->get_posts();
		

		$i = 0;
		foreach ($this->admin_data['Posts'] as $posts) {

			if ($posts['status'] == 1) {
				$this->admin_data['Posts'][$i]['status'] = "<option value='1' selected>منتشر شده</option>
				<option value='2'>ویژه</option>
				<option value='3'>پیش نویس</option>";
			} elseif ($posts['status'] == 2) {
				$this->admin_data['Posts'][$i]['status'] = "<option value='1'>منتشر شده</option>
				<option value='2' selected>ویژه</option>
				<option value='3'></option>";
			} elseif ($posts['status'] == 3) {
				$this->admin_data['Posts'][$i]['status'] = "<option value='1'>منتشر شده</option>
				<option value='2'>ویژه</option>
				<option value='3' selected>پیش نویس</option>";
			} elseif ($posts['status'] == 4) {
				$this->admin_data['Posts'][$i]['status'] = "<option value='1'>منتشر شده</option>
				<option value='2'>ویژه</option>
				<option value='3'>پیش نویس</option>";
			}
			
			$i++;
		} //foreach 

		$this->parser->parse('admin_panel', $this->admin_data);

	}




}