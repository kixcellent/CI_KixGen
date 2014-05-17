<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	/**
	 * This is just a general placeholder controller
	 *
	 * It is a good idea, to create your users a page 
	 * to launch general functions or display some stats.
	 */
	public function index()
	{
		//$this->load->library( 'template' );
		$this->load->helper( 'template' );
		$this->load->helper( 'url' );
        $this->load->model( 'model_auth' );

        $this->logged_in = $this->model_auth->check( TRUE );
        $this->data['logged_in'] = $this->logged_in;

   		$this->data['template'] = 'dashboard';
   		$this->load->view( 'frame_admin.php', $this->data);
	}
}

/* End of file dashboard.php */
/* Location: ./application/controllers/dashboard.php */