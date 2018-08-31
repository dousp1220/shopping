from django.conf.urls import url

from shopping.views import *

urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    url(r'^getType$', getType),
    url(r'getProductItem$', getProductItem),
    url(r'getProductItemDetail$', getProductItemDetail)
]