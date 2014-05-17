# Welcome to CI_KixGen
CI_KixGen is a CASE application built upon CodeIgniter that lets you generate your basic Models, Views and Controllers for each table in your database. CI_KixGen creates a complete, working CodeIgniter installation that is password protected, beautifully designed, easily usable.

# What is new in 2.2?
CI_KixGen now supports code templates which means you can select different templates when you generate your code. You can also manage the resources easily, which means you can "import" totally different folders in the generated application. The generator GUI is also polished to be more aesthetic. 

# How does it work?
With some exaggeration the process is this simple:

* You design the database
* Configure the database tables and fields in CI_KixGen
* Click generate
* Take the application

# User guide
Start exploring CI_KixGen in details on the [GitHub wiki pages](https://github.com/kixcellent/CI_KixGen/wiki).

# Credits
CI_KixGen is originally created by Ömür Yolcu Iskender, later heavily updated by KiXcellent. 

# License
This application comes with two different licenses:

* The CI_KixGen application that you use to genereate the source code is licensec under GNU GPLv3 license.
* The source code / models, views, controllers / you generate with CI_KixGen is licensed under MIT license.



===============================================

Installation

Follow these steps to install CI_KixGen on your system:

Download the zip file from here
Unpack it to the location your choice
Open application/config/config.php and set up base_url
Open application/config/database.php and set up the database. You can pick any database you want. CI_KixGen will let you choose from all the databases available.
Create an "output" directory in the root of your CI_KixGen installation and make it writable.
Point you browser to the installation directory and if all goes well, you should see a big green line, saying: “The output directory is writable, have fun using CI_KixGen”

replacing the following line on:
ci_kixgen/application/views/welcome_view.php (around line 165)

iframe src="" frameborder="0" width="100%" id="configurator_frame" name="configurator_frame"

===============================================

Using the configurator

After successfully installing CI_KixGen you can pick any of your existing database to build your next project upon. Just select it from the dropdown menu and hit the "Configure table data" link.

The configurator uses a unique table (sf_config) to store the meta data that you will set up for each field. If you want to configure the database for the first time, it will tell you to create it in the first place.

If the sf_config table exists then you have two options:

Manage the sf_config table

Reset config table delete all settings you made, but keep the config table's fields. This could come handy if you made too much mistake or for whatever reason you need to start over.
Regenerate config table truncates config table and refills it from your database schema. This is a hard reset for your config table. If you made significant changes to your schema, then you might want to choose this. All your settings will be lost.
Update config table scans your schema, if you made changes, like a new table or field, it will be added to the config table. This is a friendly solution. If you have added a new field to any table, then press this function to see it the configurator below.
Set up the table's fields.

Label This will be used as a human readable representation of your field. For example your file is named c_user_sec_question then you can name it to User security question and when you list the table in the administration area, you will see this label as the column header. For ID fields simple type "ID"
Field type this is what I refer as widgets. Pick that best suits your needs. Read more about widgets at the widgets section.
Description if you want to give your users a hint about the filed they are about to fill, then type it here. The description will appear on the administration area, under the input widget.
Hide in listing this is very simple. If you do not wish a certain table field to be appear in the list view, then you should check this. For example you probably don't want to list a blog's full description where you list the blog posts.



===============================================

Widgets

In the configurator you can set the Field type to a number of possible widgets. When you generate your source code CI_KixGen matches your table fields with the config table's settings. You can choose from the following options:

Default input
Nothing special, an input element is generated with the name attribute of the matching field.
Checkbox
A standard checkbox is displayed. The value of the checkbox is 1. If you uncheck it, then CI_KixGen stores a zero value.
Textarea
A simple textarea is generated, nothing special, like the default input.
WYSIWYG editor
The textarea will be powered by a CLEditor. You can switch to MarkItUp editor, it is a Wiki syntax editor, for painless text editing :) The MarkItUp is in the kixgen/editor/markitup directory. You have to manually change the code to make it work.
File upload *
A single file upload will be possible if you add this widget.
Date picker *
A jQuery UI plugin that helps you to pick the date you want.
Dropdown from enum data set *
A 'select' html tag is generated with the available options of the enum set.
Dropdown from a related table *
A 'select' html tag is generated with the actual values of an other table. This widget represents a one to one table relation. 
Alternatively you can self join a table. For example you can have a category table where you select the field parent_id to be joined.
Checkboxes from a related table *
Many checkboxes are generated from a related table. The checkbox's values are stored in a switch table. This widget represents a one to many table relation.



===============================================

Database design guide

This is the most important step, not just in CI_KixGen, but in many fields of web development. CI_KixGen works by analysing your database schema and creating the application based on that. Let’s see it:

Turn mandatory validation ON / OFF

Set a field to NULL if you want to skip validation and make it NOT required, otherwise it’s always mandatory to fill in all the forms.

Validation lengths

Watch the fields length. Form validation will not accept more characters, than you set in your schema.

Table relationships

If you want to create a one to many relationship between tables, you have to create a switch table. This will be discussed later in detail.

Dropdown lists

You are able to manage enum values in a HTML select list, so get use of this.

Checkboxes

If you want checkboxes on your application set the field to int(1) and NULL at the same time, because probably you don't want to set it to be mandatory checked.

File upload fields

For file upload support, set the field to varchar(36), because the file names are MD5 hashed. You can turn this off in the uploader model.

Dates

Date are automatically converted from human readable format to UNIX timestamp, so if you want dates to be handled, set your timestamp field to int(10) and the app converts the rest.

General tip

TIP: It’s a good idea to give your fields a prefix. Example: table name is “posts” than name the fields to p_id, p_title, p_desc, p_timestamp. This will help you recognise where a field belongs to. If you have a “products” table also than use the prefix “pr_” instead of “p_” again.



===============================================

Deploying your application

After pressing the "Generate" link, take the code from the [kixgen_install_dir]/output/[database_name] directory and copy it to a location of your choice.

By default CI_KixGen uses Smarty as a template engine so make the application/compiled directory writable.

Edit the basic config files: /application/config.php and /application/database.php.

Edit /application/language/english/db_fields_lang.php in your development environment to name your enum values if you wish to.

After successfully navigating your browser to the application diretory you should see a similar page to CodeIgniters. I've added a small message "...and also thanks for using CI_KixGen.". Click the link "here" to see the login page of your administration area. The default user/pass is root-root.

To change the user/pass edit the application/controllers/login.php.

As a final step, check the Testing your application page.



===============================================

Testing your application

The last point is also very important, because this is where the incompleteness of your application emerges. Until you start modifying the generated code, you are in a very convenient position: you can regenerate the code as many time as you wish, but after you made any changes it can be a bit more difficult to update the the changes, so more brain than brawn.

Click through the administration area for clues that you weren't intended to do.

Ask the following questions to yourself question before you start the modifications:

Does my app matches the plans?
Am I able to update, setup anything that I would like to?
Is it sure that table relations will be strictly one to one?
Am I using the correct input types?
Will it be straightforward to the users what each field means?
Well, this is it. As a final test, invite a friend or co-worker to test your app. Give them simple tasks like:

Upload a book to the database
Find the author of the book
While using the system talk aloud about every thought that emerge



===============================================