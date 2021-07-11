<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class CompanyDatum extends Model
{
    use Translatable;
    protected $translatable = ['title','info','about_text','mission_text','seo_title','seo_description','seo_keywords'];
}
