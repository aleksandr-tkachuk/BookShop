<?php
class Order extends Models{
    public $order_book_id;
    public $order_addres;
    public $order_fio;
    public $order_count;
    public $order_status;



    public function getTableName(){
    return "orders";
    }
    
    public static function model($className = __CLASS__){
        return parent::model($className);
    }   
}

