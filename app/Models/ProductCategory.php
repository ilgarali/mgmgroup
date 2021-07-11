<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;


class ProductCategory extends Model
{
    use Translatable;
    protected $translatable = ['category','slug','description'];

    public function slides()
    {
        return $this->hasMany(ProductSlide::class,'category_id','id');
    }
}
