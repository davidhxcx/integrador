<?php

require_once 'C:\xampp\htdocs\integrador\class\crud.php';

class Orquideas extends Crud{
    
    protected $table = 'orquideas';
    private $nome_orquidea;
    private $nm_cientifico;
    private $img_orquidea;
    private $desc_orquidea;
    
    
    public function setNome($nome_orquidea){
        $this->nome_orquidea = $nome_orquidea;        
    }
    
    public function setCientifico($nm_cientifico){
        $this->nm_cientifico = $nm_cientifico;    
    }
    
       public function setImagem($img_orquidea){
        $this->img_orquidea = $img_orquidea;        
    }
    
    public function setDescricao($desc_orquidea){
        $this->desc_orquidea = $desc_orquidea;    
    }
    public function insert(){
    
        $sql = "INSERT INTO $this->table (nome_orquidea, nm_cientifico, img_orquidea, desc_orquidea) VALUES (:nome_orquidea, :nm_cientifico, :img_orquidea, :desc_orquidea)";
        $stmt = DB::prepare($sql);
        $stmt->bindParam(':nome_orquidea', $this->nome_orquidea);
        $stmt->bindParam(':nm_cientifico', $this->nm_cientifico);
        $stmt->bindParam(':img_orquidea', $this->img_orquidea);
        $stmt->bindParam(':desc_orquidea', $this->desc_orquidea);
        return $stmt->execute();
    
    }
    
    public function update($id){
        $sql = "UPDATE $this->table SET = nome_orquidea = :nome_orquidea, nm_cientifico = :nm_cientifico, img_orquidea = :img_orquidea, desc_orquidea = :desc_orquidea WHERE idorquideas = :idorquideas";
        $stmt = DB::prepare($sql);
        $stmt->bindParam(':nome_orquidea', $this->nome_orquidea);
        $stmt->bindParam(':nm_cientifico', $this->nm_cientifico);
        $stmt->bindParam(':img_orquidea', $this->img_orquidea);
        $stmt->bindParam(':desc_orquidea', $this->desc_orquidea);
        $stmt->bindParam(':id', $this->id);
        return $stmt->execute();
    
    
    }
        
}

?>