build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://benmook.co --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id EDAULHXRTSGGW --paths '/*'
	
