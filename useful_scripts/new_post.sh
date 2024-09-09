#!/bin/bash




echo "What would you like this blog post to be titled?"

read title

echo "The title will be ${title}."

today=$(date '+%Y-%m-%d')
post_name=$(echo "$title" | tr ' ' '-')
post_path=../_posts/${today}-${post_name}.md


cp base_post.md $post_path

sed -Ei -e "s/{TITLE}/$title/g" $post_path
rm "${post_path}-e"

dt=$(date +"%Y-%m-%d %H:%M:%S %z")
sed -Ei -e "s/{DATE}/$dt/g" $post_path
rm "${post_path}-e"

subl ../
