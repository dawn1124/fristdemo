SLRAD.prototype.setDataEditor=function(a){this.dataEditor=this.dataEdior=a};
function slradDataEditor(a){var c=this,b=new SLRAD;b.setDataEditor(c);a.data("slrad",b);this.element=a;this.id=a.attr("id");this.actionUrl=a.attr("action");this.nextstep=a.attr("nextstep");this.datasource=a.attr("datasource");(this.datasourceArgs=a.attr("datasourceArgs"))&&this.element.data("datasourceArgs",SL.parseJson(this.datasourceArgs));this.cascadeTo=a.attr("cascadeTo");$("[datasource][datasourceArgs]",c.element).each(function(){var c=$(this);c.data("datasourceArgs",SL.parseJson(c.attr("datasourceArgs")))});
this.service=a.attr("service");$("[cascadeTo]",c.element).each(function(){var a=$(this).attr("cascadeOn")||"change";$(this).bind("setvalue "+a,function(){var a=$(this),b=$("#"+a.attr("cascadeTo"));b.length>0&&a.val()&&b.each(function(){var b=$(this),d=a.attr("name");if(b.data("datasourceArgs")){var f=b.data("datasourceArgs").origin_args;if(f){var h={};$.each(f,function(c,b){h[b]=c==d?a.val():void 0});b.data("cascadeArgs",h)}}f="form";b.is("select")?f="select":b.attr("multiterm")&&(f="multiterm");
c.loadElementData(b,f)})})});$("select[datasource],[multiterm][datasource]").each(function(){var c=$(this);c.data("html",c.html())});c.element.submit(function(a){return c.submitForm(a)});$(":reset",c.element).click(function(){c.resetForm();return!1});$(":submit",a).prop("disabled",!1).each(function(){var a=$(this);a.unbind("click");a.click(function(){c.element.submit();return!1})});$("[expr]",a).each(function(){var a=$(this).attr("name"),b=$(this).attr("expr"),f=$(this).attr("exprOn")||"blur",i=/[\+\-\*\/\%]/g,
j=b.match(i),g=b.split(i),h=/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/g;$.each(g,function(b,e){h.test(e)==!1&&$("[name='"+e+"']",c.element).bind(f,function(){var b=$("[name='"+a+"']",c.element),f="";$.each(g,function(a,b){var d=b;h.test(b)==!1&&(d=$("[name='"+b+"']",c.element).val(),d==void 0?d=b:h.test(d)==!1&&(d="'"+d+"'"));f+=d+(a<j.length?j[a]:"")});try{var e="";try{e=window.eval("("+f+")")}catch(k){if(SL.debugEnable)throw k;}b.val(e)}catch(l){}})})})}
slradDataEditor.prototype.submitForm=function(a){var c=this,b=c.element;try{var d=b.triggerHandler("beforeValidate");if(d===!1)return!1;var e=!0,f=$("[validate],[validates]",b);$.each(f,function(){var c=$(this);b.validate().element(c)==!1&&(e=!1)});if(!e)return!1}catch(i){SL.error("\u8868\u5355\u9a8c\u8bc1\u65f6\u53d1\u751f\u9519\u8bef\uff0c\u8bf7\u68c0\u9a8c\u8bc1\u89c4\u5219\u8bbe\u7f6e!");if(SL.debugEnable)throw a.preventDefault(),a.stopPropagation(),i;return!1}d=b.triggerHandler("beforeSubmit");
if(d===!1)return!1;if(c.cascadeTo){a=$("#"+c.cascadeTo);if((d=a.data("datasourceArgs"))&&d.origin_args){var j={};$.each(d.origin_args,function(a,b){var d=$("[name='"+a+"']",c.element);j[b]=d.val();if(d.is(":radio")||d.is(":checkbox"))j[b]=$("[name='"+a+"']:checked",c.element).val()});a.data("cascadeArgs",j)}a.show();a.trigger("cascadeInited");return!1}if(!c.service)return!1;$("[name='"+SL.KEYS.SERVICE+"']",c.element).remove();$("<input>",{type:"hidden",name:SL.KEYS.SERVICE,value:c.service}).prependTo(c.element);
$(":submit",c.element).prop("disabled",!0);var g=function(a){$(":submit",c.element).prop("disabled",!1);b.trigger("afterSubmit",a);if(a.success){a.message&&SL.info(a.message);try{var d=window==window.top?window:window.opener||window.parent;d.iframe_saved_state=!0;d.$(d).trigger("iframe_form_saved")}catch(f){if(SL.debugEnable)throw f;}if(c.nextstep)if("reset"==c.nextstep)c.resetForm();else if("close"==c.nextstep){SL.closeWindow();if(window==window.top){try{if(window.opener)window.opener=null;window.open("",
"_self")}catch(e){}window.close()}if(window.parent&&window.parent!=window)d=window.parent,d.$("iframe").each(function(){var a=d.$(this);a.contents().find("body").data("iframe_identity")==$("body").data("iframe_identity")&&a.hide()})}else try{window.eval("("+c.nextstep+")")}catch(i){if(SL.debugEnable)throw i;}$("[slradjs='checkboxgroup']").remove()}else{SL.error(a.message||"\u64cd\u4f5c\u5931\u8d25\uff01");if(a.props&&a.props.loginUrl)window.top.location=a.props.loginUrl;var g=$("[group]",b),a=$("[slradjs='checkboxgroup']",
g);if(a.length>0){var j=a.val().split(",");$.each(j,function(a,c){$(":checkbox[value='"+c+"']",g).prop("checked",!0).trigger("setvalue")});a.remove()}}};$("[group]",b).each(function(){var a=$(this),c="";$(":checkbox:checked",a).each(function(){c+=","+$(this).val();$(this).prop("checked",!1)});c==""&&a.is("[groupDefaultValue]")&&(c=","+a.attr("groupDefaultValue"));c.length>0&&(c=c.substring(1),$("<input>",{slradjs:"checkboxgroup",type:"hidden",name:a.attr("group"),value:c}).prependTo(a))});return $(":file",
c.element).length>0?(b.attr("enctype","multipart/form-data"),$("iframe[name='ajaxFileuploadFrame_"+c.id+"']").length<1&&$('<iframe name="ajaxFileuploadFrame_'+c.id+'" frameborder="0"  style="display:none"></iframe>').appendTo($("body")).load(function(){SL.hideLoading();var a=$(this).contents().text(),b={};try{b=window.eval("("+a+")")}catch(d){if(SL.debugEnable)throw d;}g.call(c,b)}),b.attr("method","post"),b.attr("target","ajaxFileuploadFrame_"+c.id),SL.showLoading(),!0):($.post(b.attr("action"),
b.serialize(),function(a){g.call(c,a)},"json"),!1)};slradDataEditor.prototype.addElementValidate=function(a){var c=this.element,b=c.data("slrad_dataedtior_form_validator");c.data("slrad_dataedtior_form_validator_bind")(b,a)};
slradDataEditor.prototype.resetForm=function(){var a=this;a.element.trigger("beforeReset");a.element[0].reset();$("select[datasource],[multiterm][datasource]",a.element).each(function(){var a=$(this);a.removeAttr("defaultValue");a.data("html")&&a.html(a.data("html"))});a.element.trigger("beforeInitData");a.fillElementData(a.element,"form");$("[datasource]",a.element).each(function(){var c=$(this),d="form";c.is("select")?d="select":c.attr("multiterm")&&(d="multiterm");a.fillElementData(c,d)});$("div.field-error").hide().remove();
$(".field-error").removeClass("field-error");$(".tipsy").remove();var c=a.element.data("resp");a.element.trigger("afterInitData",c);a.element.trigger("afterReset")};
slradDataEditor.prototype.initData=function(){var a=this;a.datasource&&a.loadElementData(a.element,"form");$("div[datasource]:not([multiterm])",a.element).each(function(){var c=$(this).attr("id");(!c||$("[cascadeTo='"+c+"']").length==0)&&a.loadElementData($(this),"form-part")});$("div[datasource][multiterm]",a.element).each(function(){var c=$(this).attr("id");(!c||$("[cascadeTo='"+c+"']").length==0)&&a.loadElementData($(this),"multiterm")});$("select[datasource]",a.element).each(function(){var c=
$(this).attr("id");(!c||$("[cascadeTo='"+c+"']").length==0)&&a.loadElementData($(this),"select")})};
slradDataEditor.prototype.loadElementData=function(a,c){var b=this,d={};a.trigger("beforeInitData");var e=a.attr("datasource");d[SL.KEYS.SERVICE]=e;if(a.attr("datasourceArgs")&&(e=a.data("datasourceArgs"),$.extend(d,e),e.origin_args))d.origin_args=void 0,$.extend(d,a.data("cascadeArgs"));jQuery.ajaxSettings.traditional=!0;$.post(b.actionUrl,d,function(d){d.success?(a.data("resp",d),b.fillElementData(a,c),a.trigger("afterInitData",d)):SL.error(d.message||"DataEditor\u6570\u636e\u52a0\u8f7d\u5931\u8d25\uff01",
d.props&&d.props.loginUrl)},"json")};
slradDataEditor.prototype.fillElementData=function(a,c){var b=this,d=a.data("resp");if(d)if("form"==c||"form-part"==c){var e=d.dataObject;d.dataObject?($(":text,:hidden,:password,textarea",a).each(function(){var a=$(this),c=a.attr("name");e[c]!=void 0&&(a.val(e[c]),a.trigger("setvalue"))}),$("select",a).each(function(){var a=$(this),c=a.attr("name");e[c]!=void 0&&window.setTimeout(function(){a.val(e[c]);a.attr("defaultValue",e[c]);a.val()==e[c]&&a.trigger("setvalue")},1)}),$(":checkbox,:radio",a).each(function(){var a=
$(this),c=a.attr("name");e[c]!=void 0&&(c=(e[c]+"").split(","),$.each(c,function(c,b){b==a.val()&&(a.prop("checked",!0),a.trigger("setvalue"))}))}),$("div[name],p[name],td[name],span[name]",a).each(function(){var a=$(this),c=a.attr("name");e[c]!=void 0&&(a.html(e[c]),a.trigger("setvalue"))}),$("img[name][path]",a).each(function(){var a=$(this),c=a.attr("name");e[c]!=void 0&&(a.attr("src",a.attr("path")+e[c]),a.trigger("setvalue"))})):SL.debugEnable&&SL.debug("\u65e0\u6570\u636e\u8fd4\u56de\uff0c\u8bf7\u68c0\u67e5datasource:"+
a.attr("datasource"))}else{if("multiterm"==c){if(!d.dataFields||!d.dataList){SL.debugEnable&&SL.debug("\u65e0\u6570\u636e\uff0c\u8bf7\u68c0\u67e5datasource:"+a.attr("datasource"));return}var f=d.dataFields,i=d.dataList;if(i.length==0){a.empty();return}var j=a.data("html");a.html(j);for(var g=1;g<i.length;g+=1)a.append(j);$.each(f,function(c){$("[name='"+f[c]+"']",a).each(function(a){var b=$(this);if(a<i.length){var d=i[a][c];b.is("input")||b.is("textarea")?(b.val(d),b.trigger("setvalue")):b.is("select")?
(window.setTimeout(function(){b.val(d)},1),b.attr("defaultValue",d),b.val()==d&&b.trigger("setvalue")):b.is("checkbox")||b.is("radio")?(a=d.split(","),$.each(a,function(a,c){c==b.val()&&(b.prop("checked",!0),b.trigger("setvalue"))})):(b.is("img")?b.attr("src",b.attr("path")+d):b.html(d),b.trigger("setvalue"))}})});$("[validate],[validates]",a).each(function(){var a=$(this);b.addElementValidate(a)})}"select"==c&&(a.html(a.data("html")),$(d.dataOption).appendTo(a),a.attr("defaultValue")?window.setTimeout(function(){a.val(a.attr("defaultValue"));
a.val()==a.attr("defaultValue")&&a.trigger("setvalue")},1):a.val()&&a.trigger("setvalue"))}};
slradDataEditor.prototype.loadPlugins=function(a){$(document).queue("loadScripts",[function(){SL.loadScript(SL.getRootPath()+"/tipsy/jquery.tipsy.js",function(){SL.loadStyle(SL.getRootPath()+"/tipsy/tipsy.css");$(document).dequeue("loadScripts")})},function(){SL.loadScript(SL.getRootPath()+"/validation/jquery.validate.js",function(){$(document).dequeue("loadScripts")})},function(){SL.loadScript(SL.getRootPath()+"/validation/jquery.metadata.js",function(){$(document).dequeue("loadScripts")})},function(){SL.loadScript(SL.getRootPath()+
"/validation/messages_cn.js",function(){$(document).dequeue("loadScripts")})},function(){jQuery.extend(jQuery.validator,{classRules:function(a){var b={};(a=$(a).attr("validate"))&&$.each(a.split(" "),function(){this in $.validator.classRuleSettings&&$.extend(b,$.validator.classRuleSettings[this])});return b},metadataRules:function(a){if(!$.metadata)return{};var b=$(a).attr("validates");if(!b||b.indexOf(":")==-1||!/({.*})/.test(b))return{};$.metadata.setType("attr","validates");return(b=$.data(a.form,
"validator").settings.meta)?$(a).metadata()[b]:$(a).metadata()}});$(document).dequeue("loadScripts")},function(){$.validator.setDefaults({debug:SL.debugEnable});$.validator.addMethod("ASCII",function(a,b){var d=!1;if(a==""||!a)d=!0;else{var e=a.match(/[a-zA-Z0-9_]*/g);e&&e[0]==a&&(d=!0)}return this.optional(b)||d},"\u53ea\u80fd\u5305\u62ec\u82f1\u6587\u5b57\u6bcd\u3001\u6570\u5b57\u548c\u4e0b\u5212\u7ebf");$.validator.addMethod("datetime",function(a,b){var d=!1;if(a==""||!a)d=!0;else{var e=a.match(/^\d{4}-\d{1,2}-\d{1,2} \d{1,2}:\d{1,2}:\d{1,2}$/ig);
if(e&&e[0]==a){var e=a.split(" "),f=e[0].split("-").concat(e[1].split(":"));$.each(f,function(a,c){f[a]=window.parseInt(c,10)});e=new Date(f[0],f[1]-1,f[2],f[3],f[4],f[5]);e.getFullYear()==f[0]&&e.getMonth()+1==f[1]&&e.getDate()==f[2]&&e.getHours()==f[3]&&e.getMinutes()==f[4]&&e.getSeconds()==f[5]&&(d=!0)}}return this.optional(b)||d},"\u8bf7\u8f93\u5165\u6b63\u786e\u7684\u65e5\u671f\u65f6\u95f4\uff0c\u683c\u5f0fyyyy-MM-dd hh:mm:ss");$.validator.addMethod("func",function(a,b,d){window.slrad_temp_value=
a;window.slrad_temp_element=b;a={};try{a=window.eval(d+"(window['slrad_temp_value'],window['slrad_temp_element'])")}catch(e){if(SL.debugEnable)throw e;}return typeof a=="object"?(a.message&&($(b).removeData("custom_message"),$(b).data("custom_message",a.message)),a.valid):($(b).removeData("custom_message"),a)},"\u8f93\u5165\u6570\u636e\u4e0d\u6b63\u786e");$(document).dequeue("loadScripts")},function(){$('<style type="text/css">.field-error{border-color: red;}div.field-error{ border: none;background:url("'+
SL.getRootPath()+'/validation/check-invalid.gif") no-repeat center center;position:absolute;width:20px;}</style>').prependTo("head");window.validateArgs={onsubmit:!1,onkeyup:!1,onfocusout:!1,focusInvalid:!0,errorClass:"field-error",errorElement:"div",errorPlacement:function(){},showErrors:function(a,b){var d;this.defaultShowErrors();$("div.field-error").empty();d=this;$.each(b,function(a,c){var b=$(c.element),d=b.data("custom_message")||c.message,g=b.data("field-error");b.removeData("field-error");
g&&g.data("tipsy")&&g.tipsy("hide");g&&g.remove();var h=null,k=b.attr("validatePos");k&&$.inArray(k,["s","n","e","w"])==-1&&(h=$(k),k="w");if(h==null||h.length<1)h=b.parents("[group='"+b.attr("name")+"']:first");h.length<1&&(h=b);h.is(":hidden")||(g=$("<div>",{"class":"field-error"}).css({height:h.outerHeight(),display:"inline"}),g.insertAfter(h),b.data("field-error",g),g.tipsy({gravity:k||"w",trigger:"manual",fade:!0,opacity:1}),g.bind("click hover showit",function(){var a=$(this);a.tipsy("show");
window.setTimeout(function(){a&&a.data("tipsy")&&a.tipsy("hide")},5E3)}),g.show(),g.attr("original-title",d),g.trigger("showit"),b.data("msg",d))})},success:function(a){var a=$(a),b=a.data("field-error");a.removeData("field-error");a.removeData("custom_message");b&&b.data("tipsy")&&b.tipsy("hide");b&&b.remove()}};$("form.DataEditor").each(function(){var a=$(this),b=a.validate(validateArgs);a.data("slrad_dataedtior_form_validator",b);var d=function(a,b){var c="blur";if(b.is("select")||b.attr("type")==
"file")c+=" change";b.attr("type")=="checkbox"&&(c+=" click",b=$(":checkbox[name='"+b.attr("name")+"']",b.parents("form")));c=b.attr("validateOn")||c;b.bind(c,function(){a.element(b)})};a.data("slrad_dataedtior_form_validator_bind",d);$("[validate],[validates]",a).each(function(){var a=$(this);d(b,a)})});$(document).dequeue("loadScripts")},function(){a();$(document).clearQueue("loadScripts")}]);$(document).dequeue("loadScripts")};
$(document).ready(function(){if(!$(document).data("slrad_dataeditor")){$(document).data("slrad_dataeditor",!0);window.parent&&window.parent!=window&&$("body").data("iframe_identity",Math.random());$(document).bind("slrad_dataeditor_plugins_ready",function(){});slradDataEditor.prototype.loadPlugins(function(){$("form.DataEditor").each(function(){var a=$(this),b=new slradDataEditor(a);$("[cascadeTo='"+a.attr("id")+"']").length>0?a.bind("cascadeInited",function(){b.initData()}):b.initData()});$(document).trigger("slrad_dataeditor_ready")});
var a=$(".datepicker,.timepicker,.datetimepicker");if(a.length>0){var c={dateFormat:"yy-mm-dd",timeFormat:"hh:mm:ss",showSecond:!0},b=function(){$.each(a,function(){var a=$(this),b=SL.parseJson(a.attr("dtpOptions")),f={};$.extend(f,c,b);a.is(".datepicker")?a.datepicker(f):a.is(".timepicker")?a.timepicker(f):a.is(".datetimepicker")&&a.datetimepicker(f)})};SL.loadJQueryUI(function(){SL.loadScript(SL.getRootPath()+"/jqueryui/jquery.ui.datepicker-zh-CN.js",function(){SL.loadScript(SL.getRootPath()+"/jqueryui/jquery-ui-timepicker-addon.js",
function(){b()})})})}}});
