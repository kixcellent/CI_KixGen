<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Description of %NAME_CONTROLLER% Controller
 *
 * @author  KiXcellent
 * @version January 01, 2014 v1.0
 * @purpose 
 */

class %NAME_CONTROLLER% extends CI_Controller 
{
	function __construct()
	{
		parent::__construct();

		//$this->load->library( 'template' ); 
		$this->load->model( '%NAME_MODEL_LOWER%' ); 
		%LOAD_UPLOAD_MODEL%
		$this->load->helper( 'form' );
		$this->load->helper( 'language' ); 
		$this->load->helper( 'url' );
        $this->load->model( 'model_auth' );

        $this->logged_in = $this->model_auth->check( TRUE );
        $this->data['logged_in'] = $this->logged_in;
        //$this->data['logged_in'] = TRUE;

		$this->lang->load( 'db_fields', 'english' ); // This is the language file
	}



    /**
     *  LISTS MODEL DATA INTO A TABLE
     */         
    function index( $page = 0 )
    {
        %MODEL_CALL%->pagination( TRUE );
		$data_info = %MODEL_CALL%->lister( $page );
        $fields = %MODEL_CALL%->fields( TRUE );
        %MANY_RELATION_RELATED_FIELDS%

        $this->data['pager'] = %MODEL_CALL%->pager;
		$this->data['%NAME_TABLE%_fields'] = $fields;
		$this->data['%NAME_TABLE%_data'] = $data_info;
        $this->data['table_name'] = '%NAME_CONTROLLER%';
        $this->data['template'] = 'list_%NAME_TABLE%';
        %MANY_RELATION_FIELD_ASSIGNS%
		$this->load->view( 'frame_admin.php', $this->data );
    }



    /**
     *  SHOWS A RECORD VIEW
     */
    function show( $id )
    {
		$data = %MODEL_CALL%->get( $id );
        $fields = %MODEL_CALL%->fields( TRUE );
        %MANY_RELATION_RELATED_FIELD%

        %MANY_RELATION_DATA_ASSIGNS%
        $this->data['id'] = $id;
		$this->data['%NAME_TABLE%_fields'] = $fields;
		$this->data['%NAME_TABLE%_data'] = $data;
		$this->data['table_name'] = '%NAME_CONTROLLER%';
		$this->data['template'] = 'show_%NAME_TABLE%';
		$this->load->view( 'frame_admin.php', $this->data );
    }



    /**
     *  SHOWS A FROM, AND HANDLES SAVING IT
     */         
    function create( $id = false )
    {
		$this->load->library('form_validation');
        
		switch ( $_SERVER ['REQUEST_METHOD'] )
        {
            case 'GET':
                $fields = %MODEL_CALL%->fields();
                %RELATED_TABLE_MODELS%
                %RELATED_TABLE_ASSIGNS%
                %MANY_RELATION_EMPTY_ASSIGNS%
                $this->data['action_mode'] = 'create';
        		$this->data['%NAME_TABLE%_fields'] = $fields;
                $this->data['metadata'] = %MODEL_CALL%->metadata();
        		$this->data['table_name'] = '%NAME_CONTROLLER%';
        		$this->data['template'] = 'form_%NAME_TABLE%';
        		$this->load->view( 'frame_admin.php', $this->data );
            break;

            /**
             *  Insert data TO %NAME_TABLE% table
             */
            case 'POST':
                $fields = %MODEL_CALL%->fields();

                /* we set the rules */
                /* don't forget to edit these */
%SET_RULES%
%VALIDATION_TRUE%
                if ( $this->form_validation->run() == FALSE %FILE_UPLOAD_VALIDATION%)
                {
                    $errors = validation_errors();
                    %FILE_UPLOAD_ERRORS%
                    %RELATED_TABLE_MODELS%
                    %RELATED_TABLE_ASSIGNS%
                    %MANY_RELATION_POST_ASSIGNS%
              		$this->data['errors'] = $errors;
              		$this->data['action_mode'] = 'create';
            		$this->data['%NAME_TABLE%_data'] = $data_post;
            		$this->data['%NAME_TABLE%_fields'] = $fields;
                    $this->data['metadata'] = %MODEL_CALL%->metadata();
            		$this->data['table_name'] = '%NAME_CONTROLLER%';
            		$this->data['template'] = 'form_%NAME_TABLE%';
            		$this->load->view( 'frame_admin.php', $this->data );
                }
                elseif ( $this->form_validation->run() == TRUE )
                {
                    $insert_id = %MODEL_CALL%->insert( $data_post );
                    %MANY_RELATION_INSERT%
					redirect( '%NAME_TABLE%' );
                }
            break;
        }
    }



    /**
     *  DISPLAYS THE POPULATED FORM OF THE RECORD
     *  This method uses the same template as the create method
     */
    function edit( $id = false )
    {
        $this->load->library('form_validation');

        switch ( $_SERVER ['REQUEST_METHOD'] )
        {
            case 'GET':
                %MODEL_CALL%->raw_data = TRUE;
        		$data = %MODEL_CALL%->get( $id );
                $fields = %MODEL_CALL%->fields();
                %RELATED_TABLE_MODELS%
                %MANY_RELATION_MODELS%
                %RELATED_TABLE_ASSIGNS%
                %MANY_RELATION_DATA_ASSIGNS%
          		$this->data['action_mode'] = 'edit';
        		$this->data['%NAME_TABLE%_data'] = $data;
        		$this->data['%NAME_TABLE%_fields'] = $fields;
                $this->data['metadata'] = %MODEL_CALL%->metadata();
        		$this->data['table_name'] = '%NAME_CONTROLLER%';
        		$this->data['template'] = 'form_%NAME_TABLE%';
        		$this->data['record_id'] = $id;
        		$this->load->view( 'frame_admin.php', $this->data );
            break;
    
            case 'POST':
    
                $fields = %MODEL_CALL%->fields();
                /* we set the rules */
                /* don't forget to edit these */
%SET_RULES%
%VALIDATION_TRUE%
                if ( $this->form_validation->run() == FALSE %FILE_UPLOAD_VALIDATION%)
                {
                    $errors = validation_errors();
                    %FILE_UPLOAD_ERRORS%
                    %RELATED_TABLE_MODELS%
                    %RELATED_TABLE_ASSIGNS%
                    %MANY_RELATION_POST_ASSIGNS%
              		$this->data['action_mode'] = 'edit';
              		$this->data['errors'] = $errors;
            		$this->data['%NAME_TABLE%_data'] = $data_post;
            		$this->data['%NAME_TABLE%_fields'] = $fields;
                    $this->data['metadata'] = %MODEL_CALL%->metadata();
            		$this->data['table_name'] = '%NAME_CONTROLLER%';
            		$this->data['template'] = 'form_%NAME_TABLE%';
        		    $this->data['record_id'] = $id;
            		$this->load->view( 'frame_admin.php', $this->data );
                }
                elseif ( $this->form_validation->run() == TRUE )
                {
				    %MODEL_CALL%->update( $id, $data_post );
				    %MANY_RELATION_UPDATE%
					redirect( '%NAME_TABLE%/show/' . $id );   
                }
            break;
        }
    }



    /**
     *  DELETE RECORD(S)
     *  The 'delete' method of the model accepts int and array  
     */
    function delete( $id = FALSE )
    {
        switch ( $_SERVER ['REQUEST_METHOD'] )
        {
            case 'GET':
                %MODEL_CALL%->delete( $id );
                redirect( $_SERVER['HTTP_REFERER'] );
            break;

            case 'POST':
                %MODEL_CALL%->delete( $this->input->post('delete_ids') );
                redirect( $_SERVER['HTTP_REFERER'] );
            break;
        }
    }
}
