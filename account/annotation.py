# coding: utf-8
import hashlib
import json
from functools import wraps

import os

from django.core.exceptions import PermissionDenied
from django.http import HttpResponse


def my_user_passes_test(test_func):
    def decorator(view_func):
        @wraps(view_func)
        def _wrapped_view(request, *args, **kwargs):
            if not request.user.is_authenticated:
                # 当前没有用户登录，跳转到登录页面
                returnData = {'success': "1", 'errorMsg': u"没有登录！"}
                return HttpResponse(json.dumps(returnData, ensure_ascii=False), "application/json; charset=utf-8")
            if test_func(request.user):
                return view_func(request, *args, **kwargs)
            returnData = {'success': "1", 'errorMsg': u"没有权限！"}
            return HttpResponse(json.dumps(returnData, ensure_ascii=False), "application/json; charset=utf-8")

        return _wrapped_view

    return decorator


# def my_login_required(fun=None):
#     actual_decorator = my_user_passes_test(
#         lambda u: u.is_authenticated
#     )
#     if fun:
#         return actual_decorator(fun)
#     return actual_decorator


def my_login_required(func):
    # '''自定义 登录验证 装饰器'''
    def check_login_status(request):
        # '''检查登录状态'''
        if request.jwt_user:
            # 当前有用户登录，正常跳转
            return func(request)
        else:
            # 当前没有用户登录，跳转到登录页面
            returnData = {'success': "1", 'errorMsg': u"没有登录！"}
            return HttpResponse(json.dumps(returnData, ensure_ascii=False), "application/json; charset=utf-8")

    return check_login_status


def my_permission_required(perm, raise_exception=False):
    def check_perms(user):
        if isinstance(perm, str):
            perms = (perm,)
        else:
            perms = perm
        # First check if the user has the permission (even anon users)
        if user.has_perms(perms):
            return True
        # In case the 403 handler should be called raise the exception
        if raise_exception:
            raise PermissionDenied
        # As the last resort, show the login form
        return False

    return my_user_passes_test(check_perms)


def response_success(message, data=None, data_list=[]):
    return HttpResponse(json.dumps({
        'code': 2000,  # code由前后端配合指定
        'message': message,  # 提示信息
        'data': data,  # 返回单个对象
        'dataList': data_list  # 返回对象数组
    }, ensure_ascii=False), 'application/json; charset=utf-8')


def response_failure(message, data=None, data_list=[]):
    return HttpResponse(json.dumps({
        'code': 4000,
        'message': message,
        'data': data,
        'dataList': data_list
    }, ensure_ascii=False), 'application/json; charset=utf-8')


def md5(s):
    m = hashlib.md5(s.encode('utf8'))
    return m.hexdigest()


def get(func):
    def in_fun(request):
        if request.method == 'GET':
            return func(request)
        else:
            return response_failure('not get request')

    return in_fun


def post(func):
    def in_fun(request):
        if request.method == 'POST':
            return func(request)
        else:
            return response_failure('not post request')

    return in_fun


def params(*args):  # 接收传入的字段
    def check_params(func):
        def in_fun(request):
            p = []
            for val in args:  # 遍历客户端请求是否包含字段
                param = request.POST.get(val, 100)
                if param == 100:  # 若不包含则返回错误
                    return response_failure('need param %s' % val)
                else:
                    p.append(param)  # 若包含则传入数组返回给被装饰的函数
            return func(request, p)

        return in_fun

    return check_params


def save_file(file, save_path='photo'):
    destination = open(os.path.join(save_path, file.name), 'wb+')
    for chunk in destination:
        destination.write(chunk)
    destination.close()
