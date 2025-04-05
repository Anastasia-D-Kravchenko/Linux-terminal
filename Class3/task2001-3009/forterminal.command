echo $(( ($(date +%Y) - 1970) * 12 * 30 + ($(date +%m) - 1) * 30 + ($(date +%d) - 1) ) * 24 * 60 * 60 ))

let "years_days=($(date +%Y) - 1970) * 360"
let "months_days=($(date +%m) - 1) * 30"
let "days=$(date +%d) - 1"
let "total_days=years_days + months_days + days"
let "total_seconds=total_days * 24 * 60 * 60"
echo "$total_seconds"


