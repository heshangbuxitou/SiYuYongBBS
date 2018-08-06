#! /usr/bin/env python
# -*- coding: utf-8 -*-

from flask import Blueprint
brother = Blueprint('brother', __name__)
from . import views