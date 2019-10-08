function ajax_add_form(form_name){

    var target = '/Admin/Forms/ajax_add_form';//Think.U('Admin/Forms/ajax_add_form');

    $.post( target, { form_name: form_name }, function(data){

        if(data.status){

            $('select[name=forms]').append("<option value='"+data.value+"'>"+data.text+"</option>");
            alert(data.info);

        }else{
            alert(data.info);
        }

    });

}

function append_option($add_option,$option_input){

    var tpl = $add_option.prev('span.option').clone();
    $add_option.prev('span.option').remove();

    $option_input.each(function(i,item){
        
        var temp_tpl = tpl.clone();

        temp_tpl.find('input').val($(item).val());
        $add_option.before(temp_tpl);

    });

}

function require_option($option_input){
    var is_error = false;
    var val;
    $option_input.each(function(i,item){

        var val =$.trim($(item).val());
        
        if(!val || val == ''){
            $(item).focus();
            is_error = true;
            return false;
        }
    });
    if(is_error){
        return true;
    }
}


$(function(){

    $('ul.sortable').nestedSortable({
        forcePlaceholderSize: true,
        handle: 'div',
        helper: 'clone',
        items: 'li',
        opacity: .6,
        placeholder: 'placeholder',
        revert: 250,
        tabSize: 25,
        tolerance: 'pointer',
        toleranceElement: '> div',
        maxLevels: 1,
        isTree: true,
        expandOnHover: 700,
        startCollapsed: true
    });

    $('body').on('click','.menu-head a.deploy',function(){

        $(this).hide();
        $(this).parent().children('.fold').show();
        $(this).parent().next().slideDown();
    });

    $('body').on('click','.menu-head a.fold',function(){

        $(this).hide();
        $(this).parent().children('.deploy').show();
        $(this).parent().next().slideUp();
    });


    $('body').on('click','a.del',function(){

        $(this).closest('li').remove();
    });

    $(".nav_holder .menu_body:eq(0)").show();
    $(".nav_holder p.menu_header").click(function(){
        $(this).next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
    });

    /*$('.menu_body').each(function(index,item){

        var model = $(item).attr('data-model');

        if( model != null && typeof model != "undefinded" && model.length  != 0){

            ajax_lists(model,0);

        }
        
    });*/


    /*$('body').on('click','.ajax_page_div a',function(){

        var model = $(this).attr('href').getQuery('model');
        var p = $(this).attr('href').getQuery('p');
        ajax_lists(model,p);

        return false;
    });*/

    /*$(".select-all").click(function(){

        var that =  $(this).parents('.menu_body').find('.tab_panel.active .ids');
        var that_length = that.length;

        var this_length = $(this).parents('.menu_body').find('.tab_panel.active input[class="ids"]:checked').length;

        var checked;

        if(!that_length)
            return false;

        if(this_length==that_length){

            checked = true;

        }else{

            checked = false;
            
        }

        that.prop("checked",!checked);

    });*/

   /* $('.add_to_menu').click(function(){

        var ids = $(this).parents('.menu_body').find('.tab_panel.active').find("input[class='ids']:checked");
        
        var count = $('ul.sortable').find('.menu-head').length;

        count = (count !== null && typeof count !== "undefinded" ) ? count : 0;

        var i = 1;

        var model = $(this).parents('.menu_body').attr('data-model');

        var action ;

        var remark; 

        switch(model){

            case 'belong' :
                action = "lists";
                remark = "归类"
                break;

            case 'essay' :
                action = "detail";
                remark = "内容";
                break; 
        }

        $(ids).each(function(index,item){

            var tpl = $('.menu_item_li').clone();

            tpl.removeClass('hide');

            tpl.removeClass('menu_item_li');

            tpl.attr('id',(count+i));

            tpl.find('a.nav_url').attr( 'href', Think.U('Home/Essay/'+action,'id='+$(item).val() ) );

            tpl.find('a.nav_url').html($(item).next().text());
            tpl.find('input[name=nav_url]').val( Think.U('Home/Essay/'+action,'id='+$(item).val() ) );
            tpl.find('.text_url').addClass('hidden');
            tpl.find('.title').text($(item).next().text());
            tpl.find('span.remark').text(remark);
            tpl.find('input[name=remark]').val(remark);
            tpl.find('input[name=nav_name]').val($(item).next().text());
            tpl.find('input[name=nav_type]').val(model);
            tpl.find('input[name=concern_id]').val($(item).val());

            $('ul.sortable').append(tpl);

            i++;

        });

    });*/

    $('.add_to_form').click(function(){

        var that = $(this).parents('.menu_body').find('.tab_panel.active');
        var input_name = that.find('input[name=input_name]').val();
        var input_rule = that.find('select[name=input_rule] option:selected').val();

        if( input_name==null || input_name.length == 0 ){

            alert('输入框必填');
            return false;
        }

        var model = $(this).parents('.menu_body').attr('data-model');
        var item_class;

        switch(model){

            case '0' :
                item_class = "input_item_li";
                
                break;

            case '1' :
                item_class = "textarea_item_li";
                break;

            case '2' :
                item_class = "select_item_li";
                break;  
        }

        var tpl = $('.'+item_class).clone();

        var count = $('ul.sortable').find('.menu-head').length;

        var is_error = false;

        count = (count !== null && typeof count !== "undefinded" ) ? count : 0;

        tpl.removeClass('hide');

        tpl.removeClass(item_class);

        tpl.attr('id',(count+1));

        tpl.find('input[name=input_name]').val(input_name);
        tpl.find('.title').text(input_name);
        tpl.find('input[name=input_type]').val(model);
        tpl.find('select[name=input_rule]').val(input_rule);

        switch(model){

            case '0' :
            case '1' :
                
                break;

            case '2' :

                is_error =require_option(that.find('p.option input'));
                
                break;  
        }

        if(is_error&& model ==2 ){

            alert('下拉选项必填');
            return false;

        }else if(model==2){
            append_option(tpl.find('p.tab_panel').find('a.option-add').parent(),that.find('p.option input'));
        }

        $('ul.sortable').append(tpl);

    });

    /*$('.add_to_menu_lang').click(function(){

        if(! $(this).parents('.menu_body').find('input[name=lang_support]').is(":checked")){

            return false;
        }

        var that = $(this).parents('.menu_body').find('.tab_panel.active');
       
        var tpl = $('.menu_item_li').clone();

        var count = $('ul.sortable').find('.menu-head').length;

        count = (count !== null && typeof count !== "undefinded" ) ? count : 0;

        tpl.removeClass('hide');

        tpl.removeClass('menu_item_li');

        tpl.attr('id',(count+1));

        tpl.find('.title').text('语言导航');
        tpl.find('input[name=nav_url]').val('');
        tpl.find('input[name=nav_name]').val('语言导航');
        tpl.find('.text_name').addClass('hidden');
        tpl.find('.text_url').addClass('hidden');
        tpl.find('span.remark').text('语言切换');
        tpl.find('a.nav_url').attr( 'href','javascript:void(0);' );
        tpl.find('a.nav_url').html('语言切换');
        tpl.find('input[name=nav_type]').val('lang');
        tpl.find('input[name=concern_id]').val('');
        tpl.find('input[name=remark]').val('语言切换');

        $('ul.sortable').append(tpl);

    });*/

    /*$('.btn_search').click(function(){

        var model = $(this).parents('.menu_body').attr('data-model');
        var key = $(this).prev().val();
        ajax_search(model,key);

    });*/

   /* $('body').on('keydown','input[name=key]',function(e){

        if(e.keyCode==13){

            $(this).next('.btn_search').click();
        }
    });*/

    $('body').on('keyup','input[name=input_name]',function(e){

        $(this).parents('.menu-setting').prev().find('.title').text($(this).val());

    });

    $('.btn_form_add').click(function(){

        var form_name = $(this).prev().val();

        if(form_name==null || typeof form_name == 'undefinded' || form_name.length ==0 ){

            alert('请输入表单名');
            return false;
        }
        ajax_add_form(form_name);

    });

    $('.btn_form_del').click(function(){



        var id = $('input[name=id]').val();

        if( id ==0 || id==null || typeof id == 'undefinded' ){
            return false;
        }

        if(!confirm('确认要删除该表单吗?')){
            
            return false;
        }

        var target = '/Admin/Forms/ajax_del_form';//Think.U('Admin/Forms/ajax_del_form');

        $.post( target, {  'id': id }, function(data){

            if(data.status){

                alert(data.info);

                window.location.href = data.url;

            }else{
                alert(data.info);
            }

        });


    });

    $('body').on('click','.option-add',function(){

        var tpl = $(this).parent().prev().clone();
        tpl.find('input').val('');
        $(this).parent().before(tpl);

    });

    $('body').on('click','.option-del',function(){

        var len = $(this).parents('.tab_panel').find('.option').length;
        if(len < 2) return;
        $(this).parent().remove();
        /*var tpl = $(this).parent().prev().clone();
        tpl.find('input').val('');
        $(this).parent().before(tpl);*/

    });


    $('.btn_form_save').click(function(){

        var that = $('.menu-setting');
        var is_error = false;

        that.each(function(index,item){

            var input_type = $(item).find('input[name=input_type]').val();

            if( input_type == "2" ){

                is_error = require_option($(item).find('.tab_panel .option input'));
                
                if(is_error){

                    return false;
                }
            }

        });

        if(is_error){
            alert('请填下拉框选项');
            return false;
        }

        var id = $('input[name=id]').val();

        if( id ==0 || id==null || typeof id == 'undefinded' ){
            
            alert('请选表单');
            return false;
        }

        var forms_struct = $('ul.sortable').nestedSortable('toForms', {startDepthCount: 0});

        /*console.log(forms_struct);
        return false;*/
        
        var pos = $('input[name=pos]:checked').val();
        var forms_name = $('input[name=forms_name]').val();
        
        if(forms_name.length<=0||forms_name==null||typeof forms_name=='undefinded'){

            alert('请填写表单名称');
            return false;
        }

        if($('input[name=pos]:checked').length<=0){

            alert('请选择表单语言!');

            return false;
        }

        if(forms_struct.length <= 0){

            alert('请设置表单结构');

            return false;
        }

        var target = '/Admin/Forms/ajax_save_form';//Think.U('Admin/Forms/ajax_save_form');

        $.post( target, {  'id': id, 'forms_name': forms_name, 'pos': pos, 'forms_struct':JSON.stringify(forms_struct) }, function(data){

            if(data.status){

                alert(data.info);

            }else{
                alert(data.info);
            }

        });

    });

});