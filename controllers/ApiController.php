<?php
class ApiController extends BaseController{

    private function getRequestToken(){
        if(isset($_SERVER["HTTP_TOKEN"])){
            return $_SERVER["HTTP_TOKEN"];
        }else{
            $this->requestError(400, "need token");
        }
    }

    /*
     * get all genre
     * request type GET
     * url - api/getGenres
     * response type - json|xml|txt|html
     */
    public function getGenres(){
        if($this->getRequestType() !== "GET") {
            $this->requestError(405);
        }
        $genres = Genre::model()->findAll();

        $this->sendResponse(["success" => 1, "data" => $genres]);
        exit();
    }

    /*
    * get all authors
    * request type GET
    * url - api/getAuthors
    * response type - json|xml|txt|html
    */
    public function getAuthors(){
        if($this->getRequestType() !== "GET") {
            $this->requestError(405);
        }
        $authors = Author::model()->findAll();

        $this->sendResponse(["success" => 1, "data" => $authors]);
        exit();
    }

    /*
  * get book by id
  * request type GET
  * url - api/book/(auto id).(response type)
  * response type - json|xml|txt|html
  */
    public function getBookById(){

        if($this->getRequestType() !== "GET") {
            $this->requestError(405);
        }

        $request = $this->getRequestParams();
        $requiredParams = ["id"];
        foreach($requiredParams as $param){
            if(!isset($request[$param]) || $request[$param] == '' ){
                $this->sendResponse(["success" => 0, "message" => $param." parameter is required"]);
            }
        }
        $book = Book::model()->findById($request["id"]);
        $this->sendResponse(["success" => 1, "data" => $book]);
    }
    /*
   * get all books
   * request type GET
   * url - api/getBooks
   * response type - json|xml|txt|html
   */
    public function getBooks(){
        if($this->getRequestType() !== "GET") {
            $this->requestError(405);
        }

        $request = $this->getRequestParams();

        $params = [];

        if (isset($request['author'])){
            $params['author'] = $request['author'];
        }
        if (isset($request['genre'])){
            $params['genre'] = $request['genre'];
        }

        $books = Book::model()->findByAttributes($params);

        $this->sendResponse(["success" => 1, "data" => $books]);
        exit();
    }

}


