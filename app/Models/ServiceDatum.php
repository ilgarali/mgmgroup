<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class ServiceDatum extends Model
{
    use Translatable;
    protected $translatable = ['title','text','slug','seo_title','seo_description','seo_keywords'];
}
