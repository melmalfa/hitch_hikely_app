phil, is this correct?

TO CREATE AN ID COUNTER AND ATTACH IT TO YOUR HASHES IN REDIS:

STEP ONE:

id = $redis.incr(“entry_id”)

# sets increment counter

STEP TWO:

$redis.hset("entry:#{id}", "key", "value")
# repeat as needed for each key value

# or

$redis.hmset("entry:#{id}", "key", "value" )

#what does this do?

# id is interpolated because it refers to the id assigned in number one???

THREE:  $redis.lpush("entry_ids", id)

# WHY?
# is "entry_ids" being created by being pushed to?

FOUR:   $redis.lrange("entry_ids", 0, -1)
#displays list of index numbers

?:
#what retrieves/displays all the entries together?

?: variable = x.map do
  $redis.getall
#ugh - can't finish this.... and what does it return?

#anything else?
can these all go in the database helper file?


