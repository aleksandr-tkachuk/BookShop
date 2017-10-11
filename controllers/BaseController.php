<?php
abstract class BaseController{

    abstract function index();
    
    protected  function render($view, $params = array()){
            
        $keys = array_keys($params);

            foreach($keys as $name){
                
                if(is_array($params[$name])){
                    $variable = '$'.$name.'= array(';
                    
                    foreach ($params[$name] as $key => $var){
                        
                        if(is_array($var)){
                            $variable .= '"'.$key.'" => array(';
                            
                            foreach ($var as $k => $v){
                                $variable .= '"'.$k.'" => "'.$v.'",';
                            }
                            $variable .= '),';
                        }else{
                            $variable .= '"'.$key.'" => "'.$var.'",';
                        }
                    }
                    
                    $variable .= ');';
                    eval($variable);
                    
                }else{

                    $variable = '$'.$name.'="'.$params[$name].'";';
                    eval($variable);
                }
            }

            $controller = strtolower(str_replace("Controller", "", get_class($this)));
            if(file_exists(BASE_PASS."/views/$controller/".$view.".php")){
                    include(BASE_PASS."/views/$controller/".$view.".php");
            }else{
                    echo "view ". $view.".php not found";
                    exit();
            }
    }
}