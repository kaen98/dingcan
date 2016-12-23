<?php
namespace Common\Model;

use Think\Model\RelationModel;

class OrderModel extends RelationModel
{
    protected $_link = array(
        'OrderContact' => array(
            'mapping_type' => self::HAS_ONE,
            'mapping_name' => 'contact',
            'foreign_key' => 'order_id',//关联id
        ),
        'User' => array(
            'mapping_type' => self::BELONGS_TO,
            'mapping_name' => 'user',
            'foreign_key' => 'user_id',//关联id
        ),
        'OrderDetail' => array(
            'mapping_type' => self::HAS_MANY,
            'mapping_name' => 'detail',
            'foreign_key' => 'order_id',
        ),
    );

    public function get($condition = array(), $relation = false)
    {
        $data = $this->where($condition);
        if ($relation) {
            $data = $data->relation($relation);
        }
        $data = $data->find();

        return $data;
    }

    public function getList($condition = array(), $relation = false, $order = "id desc", $p = 0, $num = 0, $limit = 0)
    {
        $data = $this->where($condition);
        if ($relation) {
            $data = $data->relation($relation);
        }
        if ($p && $num) {
            $data = $data->page($p . ',' . $num . '');
        }
        if ($limit) {
            $data = $data->limit($limit);
        }

        $data = $data->order($order)->select();

        return $data;
    }

    public function getMethod($condition = array(), $method, $args)
    {
        $field = isset($args) ? $args : '*';
        $data = $this->where($condition)->getField(strtoupper($method) . '(' . $field . ') AS tp_' . $method);
        return $data;
    }

    public function add($data)
    {
        if ($data["id"] == 0 || !isset($data["id"])) {
            $id = parent::add($data);
            return $id;
        } else {
            $this->save($data);
            return $data["id"];
        }
    }

    public function addAll($data)
    {
        parent::addAll($data);
    }

    public function save($data)
    {
        parent::save($data);
    }

    public function del($condition = array())
    {
        $this->where($condition)->delete();
    }
}