<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

	/**
	 * Template Helper
	 *
	 * @author 	Francis S. Crisostomo
	 * @version January 11, 2014 v1.0
	 * @purpose this loads the header and footer (and any common data) for each page.
	 * this helper is set automatically in config/autoload.php
	 */	

if (!function_exists('renderPage')) {

	/**
	 * @param $view 	: page content to load
	 * @param $tpl_vars	: template variables to pass into the page content
	 * @param $data 	: data variables to load in a page
	 */

	function renderPage($view, $tpl_vars, $data)
	{
		$ci = &get_instance();
		if($tpl_vars['login'] == true)
		{
			$ci->load->view('admin/test_header', $tpl_vars, $data);
			$ci->load->view($view, $tpl_vars, $data);
			$ci->load->view('admin/test_footer', $tpl_vars, $data);
		}
		else
		{
			$ci->load->view('header', $tpl_vars, $data);
			$ci->load->view($view, $tpl_vars, $data);
			$ci->load->view('footer', $tpl_vars, $data);
		}

	}

}

/* End of file template_helper.php */
/* Location: ./application/helpers/template_helper.php */