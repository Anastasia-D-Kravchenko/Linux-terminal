#!/bin/bash

haversine() {
  local lat1="$1"
  local lon1="$2"
  local lat2="$3"
  local lon2="$4"

  local R=6371000

  local lat1_rad=$(echo "scale=10; $lat1 * 3.141592653589793 / 180" | bc)
  local lon1_rad=$(echo "scale=10; $lon1 * 3.141592653589793 / 180" | bc)
  local lat2_rad=$(echo "scale=10; $lat2 * 3.141592653589793 / 180" | bc)
  local lon2_rad=$(echo "scale=10; $lon2 * 3.141592653589793 / 180" | bc)

  local dlat=$(echo "scale=10; $lat2_rad - $lat1_rad" | bc)
  local dlon=$(echo "scale=10; $lon2_rad - $lon1_rad" | bc)

  local a=$(echo "scale=10; sin($dlat / 2)^2 + cos($lat1_rad) * cos($lat2_rad) * sin($dlon / 2)^2" | bc -l)
  local c=$(echo "scale=10; 2 * atan2(sqrt($a), sqrt(1 - $a))" | bc -l)
  local d=$(echo "scale=10; $R * $c" | bc)
  
  # Add these lines for debugging
  echo "haversine: lat1=$lat1, lon1=$lon1, lat2=$lat2, lon2=$lon2"  >&2
  echo "haversine: lat1_rad=$lat1_rad, lon1_rad=$lon1_rad, lat2_rad=$lat2_rad, lon2_rad=$lon2_rad" >&2
  echo "haversine: dlat=$dlat, dlon=$dlon, a=$a, c=$c, d=$d" >&2

  echo "$d"
}

time_diff() {
  local start_time="$1"
  local end_time="$2"

  local start_seconds=$(date -j -f "%Y-%m-%d %H:%M:%S" "$start_time" +%s)
  local end_seconds=$(date -j -f "%Y-%m-%d %H:%M:%S" "$end_time" +%s)
  local diff_seconds=$(echo "scale=10; $end_seconds - $start_seconds" | bc)
  echo "$diff_seconds"
}

calculate_speed() {
  local distance="$1"
  local time_difference="$2"
  if [ "$time_difference" -eq 0 ]; then
    echo "0"
  else
    echo "scale=10; $distance / $time_difference" | bc
  fi
}

declare -a latitudes=(
  "54.5362500" "54.5361667" "54.5360833" "54.5360000" "54.5359167"
  "54.5358333" "54.5357500" "54.5356667" "54.5355833" "54.5355000"
  "54.5354167" "54.5353333" "54.5352500" "54.5351667" "54.5350833"
  "54.5350000" "54.5349167" "54.5348333" "54.5347500" "54.5346667"
  "54.5345833" "54.5345000" "54.5344167" "54.5343333" "54.5342500"
  "54.5341667" "54.5340833"
)

declare -a longitudes=(
  "18.5670833" "18.5671667" "18.5672500" "18.5673333" "18.5674167"
  "18.5675000" "18.5675833" "18.5676667" "18.5677500" "18.5678333"
  "18.5679167" "18.5680000" "18.5680833" "18.5681667" "18.5682500"
  "18.5683333" "18.5684167" "18.5685000" "18.5685833" "18.5686667"
  "18.5687500" "18.5688333" "18.5689167" "18.5690000" "18.5690833"
  "18.5691667" "18.5692500"
)

declare -a times=(
  "2020-07-19 10:18:29" "2020-07-19 10:18:31" "2020-07-19 10:18:33" "2020-07-19 10:18:35" "2020-07-19 10:18:37"
  "2020-07-19 10:18:39" "2020-07-19 10:18:41" "2020-07-19 10:18:43" "2020-07-19 10:18:45" "2020-07-19 10:18:47"
  "2020-07-19 10:18:49" "2020-07-19 10:18:51" "2020-07-19 10:18:53" "2020-07-19 10:18:55" "2020-07-19 10:18:57"
  "2020-07-19 10:18:59" "2020-07-19 10:19:01" "2020-07-19 10:19:03" "2020-07-19 10:19:05" "2020-07-19 10:19:07"
  "2020-07-19 10:19:09" "2020-07-19 10:19:11" "2020-07-19 10:19:13" "2020-07-19 10:19:15" "2020-07-19 10:19:17"
  "2020-07-19 10:19:19" "2020-07-19 10:19:21"
)

# Initial values
total_distance=0
previous_latitude=${latitudes[0]}
previous_longitude=${longitudes[0]}
previous_time="${times[0]}"

# Loop through the data points
for i in $(seq 1 $((${#latitudes[@]} - 1))); do
  current_latitude=${latitudes[$i]}
  current_longitude=${longitudes[$i]}
  current_time="${times[$i]}"

  # Calculate distance and add to total
  distance=$(haversine "$previous_latitude" "$previous_longitude" "$current_latitude" "$current_longitude")
  total_distance=$(echo "scale=10; $total_distance + $distance" | bc)

  # Calculate time difference
  time_difference=$(time_diff "$previous_time" "$current_time")

  # Calculate speed
  speed=$(calculate_speed "$distance" "$time_difference")

  # Print intermediate results - for comparison with report
  echo "Time: ${times[$i]}, Distance: $(printf "%.2f" "$distance") m, Speed: $(printf "%.2f" "$speed") m/s"

  # Update previous values for next iteration
  previous_latitude="$current_latitude"
  previous_longitude="$current_longitude"
  previous_time="$current_time"
done

# Print final results
echo "Total distance traveled: $(printf "%.2f" "$total_distance") m"

# Calculate average speed
average_speed=$(calculate_speed "$total_distance" "$(time_diff "${times[0]}" "${times[$((${#times[@]} - 1))]}" )")

echo "Average speed: $(printf "%.2f" "$average_speed") m/s"

