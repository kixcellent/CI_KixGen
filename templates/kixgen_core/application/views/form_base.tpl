
        %default%
            <div class="form-group">
                <label for="%FIELD_NAME%" class="col-sm-2 control-label"><?php echo $%NAME_TABLE%_fields['%FIELD_NAME%']; ?>%IF_REQUIRED%<span class="error">*</span>%/IF_REQUIRED%</label>
                <div class="col-sm-10">
                    <input class="form-control" placeholder="<?php echo $%NAME_TABLE%_fields['%FIELD_NAME%']; ?>" type="text" maxlength="255" value="<?php if(isset($%NAME_TABLE%_data)){ echo $%NAME_TABLE%_data['%FIELD_NAME%']; } ?>" id="%FIELD_NAME%" name="%FIELD_NAME%" />
                    %IF_FIELD_DESC%<span class="instruct">%FIELD_DESC%</span>%/IF_FIELD_DESC%
                    <?php echo form_error('%FIELD_NAME%'); ?>
                </div>
            </div>
        %/default%


        %textarea%
            <div class="form-group">
                <label for="%FIELD_NAME%" class="col-sm-2 control-label"><?php echo $%NAME_TABLE%_fields['%FIELD_NAME%']; ?>%IF_REQUIRED%<span class="error">*</span>%/IF_REQUIRED%</label>
                <div class="col-sm-10">
                    <textarea rows="3" class="text_area form-control" id="%FIELD_NAME%" name="%FIELD_NAME%"><?php if(isset($%NAME_TABLE%_data)){ echo $%NAME_TABLE%_data['%FIELD_NAME%']; } ?></textarea>
                    %IF_FIELD_DESC%<span class="instruct">%FIELD_DESC%</span>%/IF_FIELD_DESC%
                    <?php echo form_error('%FIELD_NAME%'); ?>
                </div>
            </div>
        %/textarea%

        %WYSIWYG%
            <div class="form-group">
                <label for="%FIELD_NAME%" class="col-sm-2 control-label"><?php echo $%NAME_TABLE%_fields['%FIELD_NAME%']; ?>%IF_REQUIRED%<span class="error">*</span>%/IF_REQUIRED%</label>
                <div class="col-sm-10">
                    <textarea rows="3" cols="50" class="text_area form-control wysiwyg " id="%FIELD_NAME%" name="%FIELD_NAME%" ><?php if(isset($%NAME_TABLE%_data)){ echo $%NAME_TABLE%_data['%FIELD_NAME%']; } ?></textarea>
                    %IF_FIELD_DESC%<span class="instruct">%FIELD_DESC%</span>%/IF_FIELD_DESC%
                    <?php echo form_error('%FIELD_NAME%'); ?>
                </div>
            </div>
        %/WYSIWYG%


        %checkbox%
            <div class="form-group">
                <label for="%FIELD_NAME%" class="col-sm-2 control-label"><?php echo $%NAME_TABLE%_fields['%FIELD_NAME%']; ?>%IF_REQUIRED%<span class="error">*</span>%/IF_REQUIRED%</label>
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label for="chk-" class="choice">
                            <input type="checkbox" value="1" id="%FIELD_NAME%" name="%FIELD_NAME%"<?php if(isset($%NAME_TABLE%_data)){ if($%NAME_TABLE%_data.%FIELD_NAME% == 1){ echo 'checked="checked"'; } } ?> />checkbox 0
                        </label>
                        %IF_FIELD_DESC%<span class="instruct">%FIELD_DESC%</span>%/IF_FIELD_DESC%
                        <?php echo form_error('%FIELD_NAME%'); ?>
                    </div>
                </div>
            </div>
        %/checkbox%


        %file%
            <div class="form-group">
                <label for="%FIELD_NAME%" class="col-sm-2 control-label"><?php echo $%NAME_TABLE%_fields['%FIELD_NAME%']; ?>%IF_REQUIRED%<span class="error">*</span>%/IF_REQUIRED%</label>
                <div class="col-sm-10">
                    <input type="hidden" value="<?php if(isset($%NAME_TABLE%_data)){ echo $%NAME_TABLE%_data['%FIELD_NAME%']; } ?>" id="%FIELD_NAME%-original-name" name="%FIELD_NAME%-original-name" />
                    <input type="file" id="%FIELD_NAME%" name="%FIELD_NAME%" />
                    <?php if(isset($%NAME_TABLE%_data)){ ?>
                    <span>File uploaded: <a href="uploads/<?php echo $%NAME_TABLE%_data['%FIELD_NAME%']; ?>"><?php echo $%NAME_TABLE%_data['%FIELD_NAME%']; ?></a></span>
                    <?php } ?>
                    %IF_FIELD_DESC%<span class="instruct">%FIELD_DESC%</span>%/IF_FIELD_DESC%
                    <?php echo form_error('%FIELD_NAME%'); ?>
                </div>
            </div>
        %/file%


        %date%
            <div class="form-group">
                <label for="%FIELD_NAME%" class="col-sm-2 control-label"><?php echo $%NAME_TABLE%_fields['%FIELD_NAME%']; ?>%IF_REQUIRED%<span class="error">*</span>%/IF_REQUIRED%</label>
                <div class="col-sm-10">
                    <span>
                        <input class="form-control datepicker short" id="%FIELD_NAME%" name="%FIELD_NAME%" size="16" type="text" maxlength="16" value="<?php if(isset($%NAME_TABLE%_data)){ echo $%NAME_TABLE%_data['%FIELD_NAME%']; } ?>" />
                        <label>YYYY-MM-DD HH:MM</label>
                    </span>
                    <span>
                        <img src="assets/img/calendar.png" class="icon" alt="Pick date." />
                    </span>
                    %IF_FIELD_DESC%<span class="instruct">%FIELD_DESC%</span>%/IF_FIELD_DESC%
                    <?php echo form_error('%FIELD_NAME%'); ?>
                </div>
            </div>
        %/date%


        %related%
            <div class="form-group">
                <label for="%FIELD_NAME%" class="col-sm-2 control-label"><?php echo $%NAME_TABLE%_fields['%FIELD_NAME%']; ?>%IF_REQUIRED%<span class="error">*</span>%/IF_REQUIRED%</label>
                <div class="col-sm-3">
                    <select class="form-control" id="%FIELD_NAME%" name="%FIELD_NAME%" >
                        <option value="0"></option>
                        <?php foreach($related_%RELATED_TABLE% as $rel) : ?>
                        <option value="<?php echo $rel['%RELATED_TABLE%_id']; ?>"<?php if(isset($%NAME_TABLE%_data)){ if($%NAME_TABLE%_data['%FIELD_NAME%'] == $rel['%RELATED_TABLE%_id']){ echo 'selected="selected"'; } } ?> ><?php echo $rel['%RELATED_TABLE%_name']; ?></option>
                        <?php endforeach; ?>
                    </select>
                    %IF_FIELD_DESC%<span class="instruct">%FIELD_DESC%</span>%/IF_FIELD_DESC%
                    <?php echo form_error('%FIELD_NAME%'); ?>
                </div>
            </div>
        %/related%


        %many_related%
            <div class="form-group">
                <label for="%FIELD_NAME%" class="col-sm-2 control-label"><?php echo $%NAME_TABLE%_fields['%FIELD_NAME%']; ?>IF_REQUIRED%<span class="error">*</span>%/IF_REQUIRED%</label>
                <div class="col-sm-10">
                    <?php foreach($related_%RELATED_TABLE% as $rel) : ?>
                    <div class="checkbox">
                        <label for="chk-<?php echo $rel['%RELATED_TABLE%_id']; ?>" class="choice">
                            <input type="checkbox" id="chk-<?php echo $rel['%RELATED_TABLE%_id']; ?>" value="<?php echo $rel['%RELATED_TABLE%_id']; ?>" name="%FIELD_NAME%[]" <?php if(isset($%NAME_TABLE%_%RELATED_TABLE%_data)){if(in_array( $rel['%RELATED_TABLE%_id'], $%NAME_TABLE%_%RELATED_TABLE%_data )){echo 'checked="checked"'; } } ?> /><?php echo $rel['%RELATED_TABLE%_name']; ?>
                        </label>
                    </div>
                    <?php endforeach; ?>
                    <button class="button" type="button" onclick="chk_selector( 'all', this )">Select all</button>
                    <button class="button" type="button" onclick="chk_selector( 'none', this )">Select none</button>
                    %IF_FIELD_DESC%<span class="instruct">%FIELD_DESC%</span>%/IF_FIELD_DESC%
                    <?php echo form_error('%FIELD_NAME%'); ?>
                </div>
            </div>
        %/many_related%


        %enum_values%
            <div class="form-group">
                <label for="%FIELD_NAME%" class="col-sm-2 control-label"><?php echo $%NAME_TABLE%_fields['%FIELD_NAME%']; ?>%IF_REQUIRED%<span class="error">*</span>%/IF_REQUIRED%</label>
                <div class="col-sm-3">
                    <select class="form-control" name="%FIELD_NAME%" >
                        <option value="0"></option>
                        <?php foreach($metadata['%FIELD_NAME%']['enum_values'] as $k => $e) : ?>
                        <option value="<?php echo $e; ?>"<?php if(isset($%NAME_TABLE%_data['%FIELD_NAME%'])){if($%NAME_TABLE%_data == $metadata['%FIELD_NAME%']['enum_names'][$k]){ echo 'selected="selected"'; } } ?>><?php echo $metadata['%FIELD_NAME%']['enum_names'][$k]; ?></option>
                        <?php endforeach; ?>
                    </select>
                    %IF_REQUIRED%<span class="error">can't be blank</span>%/IF_REQUIRED%
                    %IF_FIELD_DESC%<span class="instruct">%FIELD_DESC%</span>%/IF_FIELD_DESC%
                    <?php echo form_error('%FIELD_NAME%'); ?>
                </div>
            </div>
        %/enum_values%