<?php

namespace modules\auth;

use cruds\Agency as Cruds;

class Agency
{
    public function __construct($db)
    {
        $this->crud = new Cruds($db);
    }


    public function validate()
    {
        if (isset($_SESSION['agency_manager']['id']) && $_SESSION['agency_manager']['time'] + 3600 > time()) {
            $_SESION['agency_manager']['time'] = time();
        } else {
            header('Location: login.php');
            exit();
        }
    }


    public function login($email, $password)
    {
        $manager = $this->crud->loginManager($email);
        if ($manager) {
            if (password_verify($password, $manager['password'])) {
                return $manager;
            } else {
                return null;
            }
        } return null;
    }

    public function validateRepreserntative($manager)
    {
        if (!$manager->is_representative) {
            header('Location: index.php');
            exit();
        }
    }
}
