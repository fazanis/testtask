<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/auth', 'ApiController@auth')->name('auth');
Route::get('/leads', 'ApiController@leads')->name('leads');
Route::post('/addContact', 'ApiController@addContact')->name('addContact');
