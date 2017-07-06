<?php

/*
 * -------------------------------------
 * www.desarrollowebline.com.ar | Oscar Castillo
 * Framework CMS WebAdmin
 * Paginator.php
 * -------------------------------------
 */

class Paginator {

  /**
   * total pages found for this query
   * @var integer
   */
  public $totalPages;

  /**
   * 
   * @var integer
   */
  public $recordsPerPage = '20';

  /**
   * Total records found from the query (without LIMIT)
   * @var integer
   */
  public $affected_rows;

  /**
   * current page id
   * @var integer
   */
  public $pageId;

  /**
   * the offset or the record to start from (used in the LIMIT clause)
   * @var integer
   */
  public $offset;

  /**
   * The raw query submitted by the user
   * @var string
   */
  private $query;

  /**
   * mysqli_result object made for more flexibility
   * for more info: http://us.php.net/manual/en/class.mysqli-result.php
   * @var object
   */
  public $result;

  /**
   * How many links for the next and the previous
   * @var integer
   */
  public $linksCountLimit = 4;

  /**
   * Debug variable
   * @var bool
   */
  public $debug = false;

  /**
   * Group By clause
   * @var string
   */
  private $groupBy = '';

  /**
   * Order By clause
   * @var string
   */
  private $orderBy = '';

  /**
   * 
   * @param $in_pageID id of the current page
   * @param $in_recordsPerPage number of records per page
   * @param $in_query SQL query
   * @param $in_conn database connection object(mysqli)
   * @return
   */
  function __construct($pageID = 1, $query) {
    $this->_registry = Registry::getInstance();
    $this->_db = $this->_registry->_db;

    $this->pageId = intval($pageID);
    $this->query = $query;

    // order by position
    $orderbyPos = stripos($this->query, 'ORDER BY');
    if ($orderbyPos !== FALSE) {
      $this->orderBy = " " . substr($this->query, $orderbyPos);
      $this->query = substr($this->query, 0, $orderbyPos);
    }
    // group by position
    $groupbyPos = stripos($this->query, 'GROUP BY');
    if ($groupbyPos !== FALSE) {
      $this->groupBy = " " . substr($this->query, $groupbyPos);
      $this->query = substr($this->query, 0, $groupbyPos);
    }
  }

  private function getAffectedRows() {
    $result = $this->_db->query($this->query . $this->groupBy . $this->orderBy);

    if ($result == FALSE) {
      $err = 'Error: Cannot get affected rows';
      if ($this->debug) {
        $err .="<br /><b>Consulta: </b>" . $this->query . $this->groupBy . $this->orderBy;
        $err .="<br /><b>Error: </b>" . $this->_db->error;
      }
      throw new Exception($err);
    }

    $affected_rows = $result->rowCount();
    return $affected_rows;
  }

  /**
   * The Core function which does the actual pagination
   * 
   * @return array Associative array of rows returned
   */
  public function paginate() {
    $this->offset = $this->getOffest();

    $this->affected_rows = $this->getAffectedRows();
    $this->totalPages = $this->getTotalPages();

    if ($this->totalPages == 0)
      $this->totalPages = 1;

    // construct the pagination query: in_query + groupby clause + order by clause + limit clause
    $pageQ = $this->query . $this->groupBy . $this->orderBy . " LIMIT " . $this->offset . " , " . $this->recordsPerPage . ";";
    if ($this->debug) {
      echo $pageQ;
    }

    $this->result = $this->_db->query($pageQ);
    if ($this->result == false) {
      $err = 'Error: Cannot Execute Pagination Query';
      if ($this->debug) {
        $err .="<br /><b>Query</b>" . $pageQ;
      }
      throw new Exception($err);
    }

    $rows = $this->result->fetchAll(PDO::FETCH_ASSOC);
    return $rows;
  }

  /**
   * Gets the offset(start number of the LIMIT clause)
   *
   * @return string $offset 
   */
  private function getOffest() {
    // multiply id with no_items_per_page
    $offset = ($this->pageId - 1) * $this->recordsPerPage;
    return $offset;
  }

  /**
   * Get's the number of pages required to display the result
   *
   * @return string $totalPages
   */
  public function getTotalPages() {
    // return the float to higher integer ex:4.5 to 5,3.2 to 4
    $totalPages = ceil($this->affected_rows / $this->recordsPerPage);

    return $totalPages;
  }

  /**
   * Generates the pagination links at the bottom of the page
   * @param $class css class that will be added to the <a> tag
   * @return string
   */
  public function getLinks($class = "") {

    $output = '';
    // if the current page is not the first
    if ($this->pageId > 1) {
      $count = 1;
      for ($i = $this->pageId; $i >= 1; $i --) {
        if ($count > $this->linksCountLimit)
          break;
        if ($i == $this->pageId)
          continue;
        $output = "<a href='javascript:paginar({$i});' class='{$class}'>{$i}</a>\r\n" . $output;
        $count ++;
      }
      //previous page link
      $prevPage = $this->pageId - 1;
      $output = "<a href='javascript:paginar({$prevPage})' class='" . $class . "'>Anterior</a>\r\n" . $output;

      if ($prevPage > 1) {
        // first page link
        $output = "<a href='javascript:paginar(1)' class='" . $class . "'>Primero</a>\r\n" . $output;
      }
    }
    $output .= "<span class='thispage'>{$this->pageId}</span>\r\n";

    // next pages
    $count = 1;
    for ($i = $this->pageId; $i < $this->totalPages; $i ++) {
      if ($count > $this->linksCountLimit)
        break;
      if ($i == $this->pageId)
        continue;
      $output .= "<a href='javascript:paginar({$i})' class='{$class}'>{$i}</a>\r\n";
      $count ++;
    }
    // next and last links
    if ($this->pageId < $this->totalPages) {
      // next link
      $next = $this->pageId + 1;
      $output .= "<a href='javascript:paginar({$next})' class='{$class}'>Siguiente</a>\r\n";

      if ($this->totalPages != $next) {
        // last page link
        $output .= "<a href='javascript:paginar({$this->totalPages})' class='{$class}'>Último</a>\r\n";
      }
    }

    return $output;
  }

}

?>