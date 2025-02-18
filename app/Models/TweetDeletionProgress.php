<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TweetDeletionProgress extends Model
{
    protected $fillable = [
        'user_id',
        'batch_id',
        'total_tweets',
        'deleted_tweets',
    ];

    protected $table = 'tweet_deletion_progresses';
}
