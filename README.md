Catchpoint API
===================

Provide a ruby class to interface with the Catchpoint API

Note: You need to define an API token first

Docs
-------------

# API documentation is here
    https://io.catchpoint.com/ui/Help

# API keys/secrets can be added here
    http://portal.catchpoint.com/ui/Content/Administration/ApiDetail.aspx

Catchpoint API
-----------------

Prerequisites
---------------

You will need to generate a key and secret on the API Details page in Catchpoint (to use with OAuth2).  You can then define these as environment variables:

::

  # Set API key
    export CATCHPOINT_KEY="TTT-TT-aTaTTaTT_a"

  # Set API secret
    export CATCHPOINT_SECRET="01234567-89ab-cdef-0123-456789abcdef"

API Examples
-------------

::

    require 'catchpoint'

    c = Catchpoint.new()
    pp c.get('/products')

