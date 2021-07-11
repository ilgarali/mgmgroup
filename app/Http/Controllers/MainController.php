<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Slug;
use App\Models\ProductCategory;
use App\Models\Slide;
use App\Models\Service;
use App\Models\AboutDatum;
use App\Models\VideoGallery;
use App\Models\Partner;
use App\Models\HomeDatum;
use App\Models\ProductSlide;
use App\Models\Brend;
use App\Models\CompanyDatum;
use App\Models\Format;
use App\Models\Principle;
use App\Models\Project;
use App\Models\ServiceDatum;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\App;
class MainController extends Controller
{
    public function __construct() {
        $slugs = Slug::orderBy('order','ASC')->withTranslation('en','ru')->get();
        $categories = ProductCategory::orderBy('order','ASC')->withTranslation('en','ru')->where('parent_id',null)->get();
        view()->share(['slugs'=>$slugs,'categories'=>$categories]);
    }
    public function locale($locale)
    {
        if (in_array($locale, ['az', 'en', 'ru'])) :
            Session::put('locale', $locale);
            App::setlocale($locale);
        endif;

        return $lang = Session::get('locale');
    }

    public function lang(Request $request)
    {
       
        $explodeUrl = explode('/', $request->url);
        $count = count($explodeUrl) - 3;
        if (isset($_SERVER['HTTPS']))
            $protocol = "https://";
        else
            $protocol = "http://";
        // return str_replace('#', '', $explodeUrl[3]);
        if ($count == 1) :
            $slug_url = str_replace('#', '', rawurldecode($explodeUrl[3]));
            if ($slug_url !== '') :
                if (in_array($slug_url, ['az', 'en', 'ru'])) :
                    if (in_array($request->lang, ['en', 'ru'])) :
                        Session::put('locale', $request->lang);
                        App::setlocale($request->lang);
                        return $new_url = $protocol . $_SERVER['HTTP_HOST'] . '/' . $request->lang;
                    elseif (in_array($request->lang, ['az'])) :
                        Session::put('locale', $request->lang);
                        App::setlocale($request->lang);
                        return $new_url = $protocol . $_SERVER['HTTP_HOST'];
                    endif;
                else :
                    $data = Slug::whereTranslation('slug', $slug_url)->withTranslation('en', 'ru')->get();
                    $trans = $data->translate($request->lang, 'fallbackLocale');
                    $response = $trans[0]->slug;

                    return $new_url = $protocol . $_SERVER['HTTP_HOST'] . '/' . $response;
                endif;
            else :
                Session::put('locale', $request->lang);
                App::setlocale($request->lang);
                if ($request->lang !== 'az') :
                    return $new_url = $protocol . $_SERVER['HTTP_HOST'] . '/' . $request->lang;
                else :
                    return $new_url = $protocol . $_SERVER['HTTP_HOST'];
                endif;
            endif;
        elseif ($count == 2) :
            $data = Slug::whereTranslation('slug', str_replace('#', '', rawurldecode($explodeUrl[3])))->withTranslation('en', 'ru')->get();
            $slug4 = str_replace('#', '', rawurldecode($explodeUrl[4]));
            if ($data[0]->widget == 'collections') :
                $slug4Data = Slug::whereTranslation('slug', $slug4)->get();
                $trans = $slug4Data->translate($request->lang, 'fallbackLocale');
                $slug4 = $trans[0]->slug;
            endif;
            $trans = $data->translate($request->lang, 'fallbackLocale');
            $response = $trans[0]->slug;

            return $new_url = $protocol . $_SERVER['HTTP_HOST'] . '/' . $response . '/' . $slug4;
        elseif ($count == 3) :
            $slug = rawurldecode($explodeUrl[3]);
            $data = Slug::whereTranslation('slug', $slug)->withTranslation('en', 'ru')->get();
            $slug4 = rawurldecode($explodeUrl[4]);
            $slug5 = str_replace('#', '', rawurldecode($explodeUrl[5]));

            $slug4Data = Slug::whereTranslation('slug', $slug4)->get();
            $trans = $slug4Data->translate($request->lang, 'fallbackLocale');
            $slug4 = $trans[0]->slug;

            $slug5Data = Slug::whereTranslation('slug', $slug5)->get();
            $trans = $slug5Data->translate($request->lang, 'fallbackLocale');
            $slug5 = $trans[0]->slug;

            $trans = $data->translate($request->lang, 'fallbackLocale');
            $response = $trans[0]->slug;

            return $new_url = $protocol . $_SERVER['HTTP_HOST'] . '/' . $response . '/' . $slug4 . '/' . $slug5;
        endif;
    }

    public function slug($slug1 = null, $slug2 = null, $slug3 = null)
    {

        if ($slug1 !== null) :

            $data = Slug::whereTranslation('slug', $slug1)->withTranslation('en', 'ru')->get();

            if (count($data) == 0) :
                abort(404);
            else :
                $widget = $data[0]->widget;
                $lang = $data[0]->where('slug', $slug1)->get();
                if (count($lang) > 0) :
                    $lang = 'az';
                else :
                    $lang = $data[0]->translations->where('value', $slug1);
                    foreach ($lang as $l)
                        $lang = $l->locale;
                endif;

                if ($slug2 !== null && $slug3 == null) :
                    return $this->$widget($lang, $slug2);
                elseif ($slug3 !== null) :
                    return $this->$widget($lang, $slug2, $slug3);
                else :
                    return $this->$widget($lang);
                endif;
            endif;
        else :
            Session::put('locale', 'az');
            App::setlocale('az');
            $lang = 'az';
            return $this->index($lang);
        endif;
    }

    public function index($locale)
    {
        $lang = $this->locale($locale);
        $about = AboutDatum::orderBy('order','ASC')->withTranslation('en','ru')->get(); 
        $slides = Slide::orderBy('order','ASC')->withTranslation('en','ru')->get();
        $services = Service::orderBy('order','ASC')->withTranslation('en','ru')->get();
        $videoGalleries =VideoGallery::latest()->get();
        $featuredVideo = VideoGallery::where('featured',1)->latest()->first();
        $partners = Partner::latest()->get();
        $homeData =HomeDatum::first() ;
        return view('index',compact('slides','partners','about','services','videoGalleries','featuredVideo','homeData'));
    }

    public function product($locale,$slug = null, $slug2 = null)
    {
        $lang = $this->locale($locale);
        $productSlug = Slug::where('widget','product')->withTranslation('en','ru')->first();

        if ($slug == null) {
            $categories = ProductCategory::orderBy('order','ASC')->withTranslation('en','ru')->get();
            $productSlides = ProductSlide::withTranslation('en','ru')->latest()->get();
            return view('catalog',compact('categories','productSlides','productSlug'));
        }elseif ($slug !== null && $slug2 == null) {
            $category = ProductCategory::withTranslation('en','ru')->whereTranslation('slug',$slug)->firstOrFail();
            $productSlides = ProductSlide::where('category_id',$category->id)->withTranslation('en','ru')->latest()->get() ;
            $brends = Brend::orderBy('order','ASC')->get();
            $formats = Format::orderBy('order','ASC')->get();;
            return view('product',compact('productSlug','productSlides','brends','formats'));

        }
        
        
        
    }



    public function company($locale,$slug = null)
    {
        $lang = $this->locale($locale);
        $companyData = CompanyDatum::withTranslation('en','ru')->first();
        $partners = Partner::latest()->get();
        $services = Service::orderBy('order','ASC')->withTranslation('en','ru')->get();
        $principles = Principle::orderBy('order','ASC')->withTranslation('en','ru')->get();

       return view('about',compact('companyData','partners','services','principles'));
        
        
    }


    public function services($locale,$slug = null)
    {
        $lang = $this->locale($locale);
        $service = ServiceDatum::withTranslation('en','ru')->first();
        $services = Service::orderBy('order','ASC')->withTranslation('en','ru')->get();


       return view('service',compact('service','services'));
        
        
    }

    public function projects($locale,$slug = null)
    {
      

        $lang = $this->locale($locale);
        $projecttSlug = Slug::where('widget','projects')->withTranslation('en','ru')->first();

        if ($slug !=null) {
        $project = Project::whereTranslation('slug',$slug)->firstOrFail();

            return view('projectDetail',compact('project','projecttSlug'));
        }
        $projects = Project::withTranslation('en','ru')->get();
        

       return view('projects',compact('projects','projecttSlug'));
        
        
    }


    public function contact($locale,$slug = null)
    {
      

        $lang = $this->locale($locale);
   
        

       return view('contact',compact('lang'));
        
        
    }
}
