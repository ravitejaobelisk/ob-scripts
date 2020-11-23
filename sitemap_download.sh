for i in $(curl -s https://v2.operabase.org/robots.txt | grep Sitemap | awk '{print $2}' FS=': https://www.operabase.com/'); do	
	url="https://v2.operabase.org/${i}"
	wget $url --output-document=$i
	for j in $(curl -s $url | sed -n 's/<loc>\(.*.xml\)<\/loc>/\1/p'| awk '{print $2}' FS='https://www.operabase.com/'); do
	final_nested_url="https://v2.operabase.org/${j}"
	wget $url --output-document=$j
	done
done