prefix="./"
for dir in `find . -type d ! -name '.'`; do
	title=${dir#$prefix}
	echo "					<h2>$title:</h2>"
	echo "					<div class=\"my-gallery\" itemscope itemtype=\"http://schema.org/ImageGallery\">"
	
	counter=1
	for fname in `ls $dir`; do
		fullPath=images/gallery/$title/$fname
		dims=`identify -format "%wx%h" $dir/$fname`
		echo "						<figure itemprop=\"associatedMedia\" itemscope itemtype=\"http://schema.org/ImageObject\">"
		echo "							<a href=\"$fullPath\" itemprop=\"contentUrl\" data-size=\"$dims\"> <img src=\"$fullPath\" itemprop=\"thumbnail\" alt=\"Robocup\" /> </a>"
		echo "							<figcaption itemprop=\"caption description\">"
		echo "								$title picture $counter"
		echo "							</figcaption>"
		echo "						</figure>"
		echo
		counter=$((counter+1))
	done
	echo "					</div>"
	echo
	echo "					<hr>"
	echo
done
