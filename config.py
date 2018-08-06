import os
basedir = os.path.abspath(os.path.dirname(__file__))


class Config:
    def __init__(self):
        pass

    SECRET_KEY = os.environ.get('SECRET_KEY') or '!@#$%^&**&@#uu@#hj@h#'
    SQLALCHEMY_RECORD_QUERIES = True
    SQLALCHEMY_TRACK_MODIFICATIONS = True

    MAIL_SERVER = 'smtp.qq.com'
    MAIL_PORT = 465
    MAIL_USE_SSL = True
    MAIL_USERNAME = os.environ.get('MAIL_USERNAME')
    MAIL_PASSWORD = os.environ.get('MAIL_PASSWORD')
    FORUM_MAIL_SUBJECT_PREFIX = 'SiYuYong'
    FORUM_MAIL_SENDER = '1581277795@qq.com'

    BABEL_DEFAULT_LOCALE = 'zh'
    BABEL_DEFAULT_TIMEZONE = 'CST'

    PER_PAGE = 10
    # UPLOAD_FOLDER = os.path.join(basedir, 'nahan/static/upload')
    UPLOAD_FOLDER = os.path.join(basedir, 'nahan', 'static', 'upload')
    ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg'])
    # MAX_CONTENT_LENGTH = 512 * 1024
    MAX_CONTENT_LENGTH = 1024 * 1024 * 20
    

    @staticmethod
    def init_app(app):
        pass


class DevelopmentConfig(Config):
    def __init__(self):
        pass

    DEBUG = True
    SQLALCHEMY_DATABASE_URI = (os.environ.get('DEV_DATABASE_URL') or
                               'mysql+mysqlconnector://root:root@localhost/db_bbs')


class ProductionConfig(Config):
    def __init__(self):
        pass

    SQLALCHEMY_DATABASE_URI = (os.environ.get('DEV_DATABASE_URL') or
                               'mysql+mysqlconnector://root:root@localhost/db_bbs')

config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
    'default': DevelopmentConfig
}
