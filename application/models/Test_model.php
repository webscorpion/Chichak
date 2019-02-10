 <?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Test_model extends CI_model {

	public function get(){

		return $this->db->get('tag')->result_array();
	}


}