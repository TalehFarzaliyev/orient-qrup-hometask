<?php

if(!function_exists('translate'))
{
    function translate($key = false, $lang_name)
    {
        if($key)
        {
            if($lang_name)
            {
                include $_SERVER['DOCUMENT_ROOT']."/language/".$lang_name.'.php';
                return $translation[$key];
            }
                include $_SERVER['DOCUMENT_ROOT']."/language/az.php";
                return $translation[$key];
        }
        return 'undefined';
    }
}