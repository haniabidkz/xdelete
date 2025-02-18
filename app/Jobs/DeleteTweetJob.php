<?php

namespace App\Jobs;

use Abraham\TwitterOAuth\TwitterOAuth;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\SerializesModels;
use App\Models\TweetDeletionProgress;
use App\Models\User;
use Illuminate\Bus\Batchable;
use \Atymic\Twitter\Facade\Twitter;

class DeleteTweetJob implements ShouldQueue
{
    use Batchable, Queueable;

    protected $tweetId;
    protected $userId;
    protected $progressRecordId;

    /**
     * Create a new job instance.
     *
     * @param string $tweetId
     * @param int $userId
     * @param int $progressRecordId
     */
    public function __construct(string $tweetId, int $userId, int $progressRecordId)
    {
        $this->tweetId = $tweetId;
        $this->userId = $userId;
        $this->progressRecordId = $progressRecordId;
    }

    /**
     * Execute the job.
     */
    public function handle()
    {
        // Retrieve the user so we can get their tokens.
        $user = User::find($this->userId);
        if (! $user) {
            // If the user no longer exists, just exit.
            return;
        }

        $response = Twitter::usingCredentials($user->token, $user->token_secret)
                    ->forApiV2()
                    ->getQuerier()
                    ->delete("tweets/{$this->tweetId}");

        // Check for errors in the response (adjust based on actual response structure)
        if (isset($response->errors) || (isset($response->status) && $response->status !== 200)) {
            $errorMessages = isset($response->errors)
                ? collect($response->errors)->pluck('message')->implode(', ')
                : 'Unknown error';
            throw new \Exception("Failed to delete tweet {$this->tweetId}: " . $errorMessages);
        }

        // Update the progress record.
        $progressRecord = TweetDeletionProgress::find($this->progressRecordId);
        if ($progressRecord) {
            $progressRecord->increment('deleted_tweets');
        }
    }
}
