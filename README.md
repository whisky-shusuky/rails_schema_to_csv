# rails_schema_to_csv

This is a script to convert rails schema(`db/schema.rb`) to csv.
This script output table name, type of column, name of column and comment.

# usage
Start the rails console and just execute content of `rails_schema_to_csv.rb`.
```
$ bin/rails c
require "csv"

CSV.open('data.csv','w') do |output_csv|
...
```

Then entire models are converted in`data.csv`.

```
$ cat data.csv

table: user
string,name,name of customer
datetime,deleted_at,time of the cabcel the membership
...
table: admin_user
string,name,name of administrator
datetime,deleted_at,time of the revoking
...
```
## License
MIT
