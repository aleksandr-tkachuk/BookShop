<?php

class Book extends Models{
    
    public $book_id = 0;
    public $book_name;
    public $book_description;
    public $book_price;
    public $book_discount_id;

    public function getTableName(){
        return "book";
    }
    
    public static function findByAttributes($params) {
        $genres = [];
        $authors = [];
        $b = [];
        $a = [];
        if (isset($params['genre'])){
        $sql = 'select * from genre_book where genre_id='.$params['genre'];
        $genres = App::$db->select($sql);
            foreach ($genres as $value) {
                $book = Book::model()->find($value['book_id']);
                if($book){
                $b[$book->book_id] = [
                    "book_id" => $book->book_id,
                    "book_name" => $book->book_name,
                ];
                }
            }   
        }

        if(isset($params["author"])){
        $sql = 'select * from author_book where author_id='.$params['author'];
        $authors = App::$db->select($sql);
            foreach ($authors as $value) {
                $book = Book::model()->find($value['book_id']);
                if($book){
                $a[$book->book_id] = [
                    "book_id" => $book->book_id,
                    "book_name" => $book->book_name,
                ];
                }
            }
        }

        if(sizeof($a) != 0 && sizeof($b) != 0){
        $result = array_uintersect_uassoc($a, $b, function(){}, "strcasecmp"); 
        }  elseif (sizeof($a) == 0){
                $result = $b;
            
        }  elseif (sizeof($b) == 0){
                $result = $a;
        }
        return $result;
        
    }

    public function saveAuthors($authors) {

        $sql = "delete from author_book where book_id = " . $this->book_id;
        $this->db->sqlQuery($sql);

        $sqlauth = '(' . implode(", {$this->book_id}), (", $authors) . ", {$this->book_id})";
        $sql = "insert into author_book VALUES $sqlauth";
        echo $sql;
        $this->db->sqlQuery($sql);

    }

    public function saveGenres($genres) {

        $sql = "delete from genre_book where book_id = " . $this->book_id;
        $this->db->sqlQuery($sql);

        $sqlgenres = '(' . implode(", {$this->book_id}), (", $genres) . ", {$this->book_id})";
        $sql = "insert into genre_book VALUES $sqlgenres";
        $this->db->sqlQuery($sql);

    }

    public function delit() {
        $sql = $this->db->prepare("DELETE FROM ".$this->getTableName()." where ".$this->getTableName()."_id = ?");

        $sql->execute(array($this->book_id));

        $sql = 'delete from genre_book where book_id='.$this->book_id;
        App::$db->query($sql);

        $sql = 'delete from author_book where book_id='.$this->book_id;
        App::$db->query($sql);

    }

    public static function model($className = __CLASS__){
        return parent::model($className);
    }
    
}
