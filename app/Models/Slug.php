<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use TCG\Voyager\Traits\Translatable;
class Slug extends Model
{
    use Translatable;
    protected $translatable = ['menu','slug'];
}
