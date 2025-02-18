<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('provider_id')->nullable()->unique();
            //Add role id to users table
            $table->unsignedBigInteger('role_id')->default(2);
            //Add token and token secret to users table
            $table->string('token')->nullable();
            $table->string('token_secret')->nullable();
            
        });
    }

    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('provider_id');
            $table->dropColumn('role_id');
            $table->dropColumn('token');
            $table->dropColumn('token_secret');
        });
    }
};
