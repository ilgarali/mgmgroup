<?php

namespace App\Http\Controllers;

use App\Models\ContactMessage;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function contact(Request $request)
    {
       $contact = new ContactMessage();
       $contact->name = $request->name;
       $contact->email = $request->email;
       $contact->number = $request->number;

       $contact->messages = $request->message;
       $contact->save();

       return redirect()->back()->with('success','Mesajınız göndərildi');

    }
}
