# -*- coding: utf-8 -*-
"""
    blohg_sidebar
    ~~~~~~~~~~~~~

    Exposes ``recent_posts`` to every template so the sidebar can list the
    latest posts. Tags are already provided globally by blohg as ``tags``.
"""

from blohg.ext import BlohgExtension
from flask import current_app

ext = BlohgExtension(__name__)

RECENT_COUNT = 5


@ext.setup_extension
def setup_extension(app):

    @app.context_processor
    def sidebar_context():
        try:
            posts = current_app.blohg.content.get_all(True)
        except Exception:
            posts = []
        return dict(recent_posts=posts[:RECENT_COUNT])
