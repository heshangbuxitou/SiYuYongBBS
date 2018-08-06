#! /usr/bin/env python
# -*- coding: utf-8 -*-


from flask import Blueprint
voice = Blueprint('voice', __name__)
from . import views
