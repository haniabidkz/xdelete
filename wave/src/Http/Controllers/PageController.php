<?php

namespace Wave\Http\Controllers;

use App\Http\Controllers\Controller;
use Wave\Page;

class PageController extends Controller
{
    public function page($slug){
     
    	$page = Page::where('slug', '=', $slug)->firstOrFail();

    	$seo = [
            'seo_title' => $page->title,
            'seo_description' => $page->meta_description,
        ];

    	return view('theme::page', compact('page', 'seo'));
    }

    public function contactUs(){
     
    	

    	$seo = [
            'seo_title' => 'Contact Us',
            'seo_description' => 'Contact Us',
        ];

    	return view('theme::pages.contact', compact('seo'));
    }
}
