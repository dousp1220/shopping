from django.conf.urls import url

from shopping.views import *

urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    url(r'^getType$', getType),

    url(r'^getProductItem$', getProductItem),
    url(r'^getProductItemDetail$', getProductItemDetail),

    url(r'^getAddress$', getAddress),
    url(r'^getDefaultAddress$', getDefaultAddress),
    url(r'^addAddress$', addAddress),
    url(r'^updateAddress$', updateAddress),

    url(r'^getShoppingCart$', getShoppingCart),
    url(r'^addShoppingCart$', addShoppingCart),
    url(r'^updateShoppingCart$', updateShoppingCart),

    url(r'^makeOrder$', makeOrder),
    url(r'^payment$', payment),
]