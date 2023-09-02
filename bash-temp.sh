#!/bin/sh

get_temp() {
	{
		date --rfc-3339=ns;
		sensors | cut -d':' -f2 | grep -oE '^[[:space:]]*\+[0-9][0-9]';
	} | xargs
}

:>temp.txt

while :;
do
	get_temp >> temp.txt
done

