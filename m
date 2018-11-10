From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 03/11] tools/libs/*: Rely on the default
 logger
Date: Sat, 10 Nov 2018 09:57:52 +0100
Message-ID: <20181110085752.GB4051@mail-itl>
References: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
 <20181108170805.12774-4-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3941894753492744666=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5xml=nv=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gLP5a-0006xW-Ft
 for xen-devel@lists.xenproject.org; Sat, 10 Nov 2018 08:57:58 +0000
In-Reply-To: <20181108170805.12774-4-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3941894753492744666==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 08, 2018 at 05:07:57PM +0000, Ian Jackson wrote:
> Delete 11 entirely formulaic conditional calls to
>   xtl_createlogger_stdiostream(stderr, XTL_PROGRESS, 0);
> and associated logger_tofree variables, error handling, etc.
>=20
> No overall functional change, although some memory allocation errors
> may no longer occur.
>=20
> After this there are still several calls to
> xtl_createlogger_stdiostream in tree, but they almost all have
> non-default message level etc. so it is not obvious that they should
> be replaced.
>=20
> The exception is in xc_private.c where xch->error_handler is
> initialised using a copy of the default initialisation boilerplate
> (ant there is the associated xch->error_handler_tofree).  However,
> there is also xch->dombuild_logger, and xch->dombuild_logger_tofree
> which is handled differently and so must be retained.  It seems better
> to keep the xch code internally consistent, and decoupled from the
> general default.
>=20
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
> CC: Wei Liu <wei.liu2@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> v2: New in this version of the series
> ---
>  tools/libs/call/core.c             | 10 ----------
>  tools/libs/call/private.h          |  2 +-
>  tools/libs/devicemodel/core.c      | 11 -----------
>  tools/libs/devicemodel/private.h   |  2 +-
>  tools/libs/evtchn/core.c           | 10 ----------
>  tools/libs/evtchn/private.h        |  2 +-
>  tools/libs/foreignmemory/core.c    | 10 ----------
>  tools/libs/foreignmemory/private.h |  2 +-
>  tools/libs/gnttab/gntshr_core.c    | 10 ----------
>  tools/libs/gnttab/gnttab_core.c    | 10 ----------
>  tools/libs/gnttab/private.h        |  2 +-
>  11 files changed, 5 insertions(+), 66 deletions(-)
>=20
> diff --git a/tools/libs/call/core.c b/tools/libs/call/core.c
> index 57d3a33e6b..ee9be948e7 100644
> --- a/tools/libs/call/core.c
> +++ b/tools/libs/call/core.c
> @@ -54,14 +54,6 @@ xencall_handle *xencall_open(xentoollog_logger *logger=
, unsigned open_flags)
>      xcall->buffer_cache_misses =3D 0;
>      xcall->buffer_cache_toobig =3D 0;
>      xcall->logger =3D logger;
> -    xcall->logger_tofree =3D NULL;
> -
> -    if (!xcall->logger) {
> -        xcall->logger =3D xcall->logger_tofree =3D
> -            (xentoollog_logger*)
> -            xtl_createlogger_stdiostream(stderr, XTL_PROGRESS, 0);
> -        if (!xcall->logger) goto err;
> -    }
> =20
>      rc =3D osdep_xencall_open(xcall);
>      if ( rc  < 0 ) goto err;
> @@ -71,7 +63,6 @@ xencall_handle *xencall_open(xentoollog_logger *logger,=
 unsigned open_flags)
>  err:
>      xentoolcore__deregister_active_handle(&xcall->tc_ah);
>      osdep_xencall_close(xcall);
> -    xtl_logger_destroy(xcall->logger_tofree);
>      free(xcall);
>      return NULL;
>  }
> @@ -86,7 +77,6 @@ int xencall_close(xencall_handle *xcall)
>      xentoolcore__deregister_active_handle(&xcall->tc_ah);
>      rc =3D osdep_xencall_close(xcall);
>      buffer_release_cache(xcall);
> -    xtl_logger_destroy(xcall->logger_tofree);
>      free(xcall);
>      return rc;
>  }
> diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
> index 21f992b37e..a2d00b2b6a 100644
> --- a/tools/libs/call/private.h
> +++ b/tools/libs/call/private.h
> @@ -18,7 +18,7 @@
>  #endif
> =20
>  struct xencall_handle {
> -    xentoollog_logger *logger, *logger_tofree;
> +    xentoollog_logger *logger;
>      unsigned flags;
> =20
>                       /* partially     with /dev/     no /dev/      */
> diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
> index f76e3d305e..b91f6b4ee9 100644
> --- a/tools/libs/devicemodel/core.c
> +++ b/tools/libs/devicemodel/core.c
> @@ -46,15 +46,6 @@ xendevicemodel_handle *xendevicemodel_open(xentoollog_=
logger *logger,
> =20
>      dmod->flags =3D open_flags;
>      dmod->logger =3D logger;
> -    dmod->logger_tofree =3D NULL;
> -
> -    if (!dmod->logger) {
> -        dmod->logger =3D dmod->logger_tofree =3D
> -            (xentoollog_logger*)
> -            xtl_createlogger_stdiostream(stderr, XTL_PROGRESS, 0);
> -        if (!dmod->logger)
> -            goto err;
> -    }
> =20
>      dmod->xcall =3D xencall_open(dmod->logger, 0);
>      if (!dmod->xcall)
> @@ -67,7 +58,6 @@ xendevicemodel_handle *xendevicemodel_open(xentoollog_l=
ogger *logger,
>      return dmod;
> =20
>  err:
> -    xtl_logger_destroy(dmod->logger_tofree);
>      xentoolcore__deregister_active_handle(&dmod->tc_ah);
>      xencall_close(dmod->xcall);
>      free(dmod);
> @@ -85,7 +75,6 @@ int xendevicemodel_close(xendevicemodel_handle *dmod)
> =20
>      xentoolcore__deregister_active_handle(&dmod->tc_ah);
>      xencall_close(dmod->xcall);
> -    xtl_logger_destroy(dmod->logger_tofree);
>      free(dmod);
>      return rc;
>  }
> diff --git a/tools/libs/devicemodel/private.h b/tools/libs/devicemodel/pr=
ivate.h
> index c4a225f8af..edee969313 100644
> --- a/tools/libs/devicemodel/private.h
> +++ b/tools/libs/devicemodel/private.h
> @@ -10,7 +10,7 @@
>  #include <xentoolcore_internal.h>
> =20
>  struct xendevicemodel_handle {
> -    xentoollog_logger *logger, *logger_tofree;
> +    xentoollog_logger *logger;
>      unsigned int flags;
>      xencall_handle *xcall;
>      int fd;
> diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
> index aff6ecfaa0..d1e53284e0 100644
> --- a/tools/libs/evtchn/core.c
> +++ b/tools/libs/evtchn/core.c
> @@ -37,18 +37,10 @@ xenevtchn_handle *xenevtchn_open(xentoollog_logger *l=
ogger, unsigned open_flags)
> =20
>      xce->fd =3D -1;
>      xce->logger =3D logger;
> -    xce->logger_tofree  =3D NULL;
> =20
>      xce->tc_ah.restrict_callback =3D all_restrict_cb;
>      xentoolcore__register_active_handle(&xce->tc_ah);
> =20
> -    if (!xce->logger) {
> -        xce->logger =3D xce->logger_tofree =3D
> -            (xentoollog_logger*)
> -            xtl_createlogger_stdiostream(stderr, XTL_PROGRESS, 0);
> -        if (!xce->logger) goto err;
> -    }
> -
>      rc =3D osdep_evtchn_open(xce);
>      if ( rc  < 0 ) goto err;
> =20
> @@ -57,7 +49,6 @@ xenevtchn_handle *xenevtchn_open(xentoollog_logger *log=
ger, unsigned open_flags)
>  err:
>      xentoolcore__deregister_active_handle(&xce->tc_ah);
>      osdep_evtchn_close(xce);
> -    xtl_logger_destroy(xce->logger_tofree);
>      free(xce);
>      return NULL;
>  }
> @@ -71,7 +62,6 @@ int xenevtchn_close(xenevtchn_handle *xce)
> =20
>      xentoolcore__deregister_active_handle(&xce->tc_ah);
>      rc =3D osdep_evtchn_close(xce);
> -    xtl_logger_destroy(xce->logger_tofree);
>      free(xce);
>      return rc;
>  }
> diff --git a/tools/libs/evtchn/private.h b/tools/libs/evtchn/private.h
> index 31e595bea2..a272895fe5 100644
> --- a/tools/libs/evtchn/private.h
> +++ b/tools/libs/evtchn/private.h
> @@ -9,7 +9,7 @@
>  #include <xen/xen.h>
> =20
>  struct xenevtchn_handle {
> -    xentoollog_logger *logger, *logger_tofree;
> +    xentoollog_logger *logger;
>      int fd;
>      Xentoolcore__Active_Handle tc_ah;
>  };
> diff --git a/tools/libs/foreignmemory/core.c b/tools/libs/foreignmemory/c=
ore.c
> index 63f12e2450..d485dd8672 100644
> --- a/tools/libs/foreignmemory/core.c
> +++ b/tools/libs/foreignmemory/core.c
> @@ -41,18 +41,10 @@ xenforeignmemory_handle *xenforeignmemory_open(xentoo=
llog_logger *logger,
> =20
>      fmem->fd =3D -1;
>      fmem->logger =3D logger;
> -    fmem->logger_tofree =3D NULL;
> =20
>      fmem->tc_ah.restrict_callback =3D all_restrict_cb;
>      xentoolcore__register_active_handle(&fmem->tc_ah);
> =20
> -    if (!fmem->logger) {
> -        fmem->logger =3D fmem->logger_tofree =3D
> -            (xentoollog_logger*)
> -            xtl_createlogger_stdiostream(stderr, XTL_PROGRESS, 0);
> -        if (!fmem->logger) goto err;
> -    }
> -
>      rc =3D osdep_xenforeignmemory_open(fmem);
>      if ( rc  < 0 ) goto err;
> =20
> @@ -61,7 +53,6 @@ xenforeignmemory_handle *xenforeignmemory_open(xentooll=
og_logger *logger,
>  err:
>      xentoolcore__deregister_active_handle(&fmem->tc_ah);
>      osdep_xenforeignmemory_close(fmem);
> -    xtl_logger_destroy(fmem->logger_tofree);
>      free(fmem);
>      return NULL;
>  }
> @@ -75,7 +66,6 @@ int xenforeignmemory_close(xenforeignmemory_handle *fme=
m)
> =20
>      xentoolcore__deregister_active_handle(&fmem->tc_ah);
>      rc =3D osdep_xenforeignmemory_close(fmem);
> -    xtl_logger_destroy(fmem->logger_tofree);
>      free(fmem);
>      return rc;
>  }
> diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemor=
y/private.h
> index 8f1bf081ed..9030de9740 100644
> --- a/tools/libs/foreignmemory/private.h
> +++ b/tools/libs/foreignmemory/private.h
> @@ -19,7 +19,7 @@
>  #endif
> =20
>  struct xenforeignmemory_handle {
> -    xentoollog_logger *logger, *logger_tofree;
> +    xentoollog_logger *logger;
>      unsigned flags;
>      int fd;
>      Xentoolcore__Active_Handle tc_ah;
> diff --git a/tools/libs/gnttab/gntshr_core.c b/tools/libs/gnttab/gntshr_c=
ore.c
> index 1117e29c91..38cf364897 100644
> --- a/tools/libs/gnttab/gntshr_core.c
> +++ b/tools/libs/gnttab/gntshr_core.c
> @@ -31,14 +31,6 @@ xengntshr_handle *xengntshr_open(xentoollog_logger *lo=
gger, unsigned open_flags)
> =20
>      xgs->fd =3D -1;
>      xgs->logger =3D logger;
> -    xgs->logger_tofree  =3D NULL;
> -
> -    if (!xgs->logger) {
> -        xgs->logger =3D xgs->logger_tofree =3D
> -            (xentoollog_logger*)
> -            xtl_createlogger_stdiostream(stderr, XTL_PROGRESS, 0);
> -        if (!xgs->logger) goto err;
> -    }
> =20
>      rc =3D osdep_gntshr_open(xgs);
>      if ( rc  < 0 ) goto err;
> @@ -47,7 +39,6 @@ xengntshr_handle *xengntshr_open(xentoollog_logger *log=
ger, unsigned open_flags)
> =20
>  err:
>      osdep_gntshr_close(xgs);
> -    xtl_logger_destroy(xgs->logger_tofree);
>      free(xgs);
>      return NULL;
>  }
> @@ -60,7 +51,6 @@ int xengntshr_close(xengntshr_handle *xgs)
>          return 0;
> =20
>      rc =3D osdep_gntshr_close(xgs);
> -    xtl_logger_destroy(xgs->logger_tofree);
>      free(xgs);
>      return rc;
>  }
> diff --git a/tools/libs/gnttab/gnttab_core.c b/tools/libs/gnttab/gnttab_c=
ore.c
> index 92e7228a26..a67f444245 100644
> --- a/tools/libs/gnttab/gnttab_core.c
> +++ b/tools/libs/gnttab/gnttab_core.c
> @@ -37,18 +37,10 @@ xengnttab_handle *xengnttab_open(xentoollog_logger *l=
ogger, unsigned open_flags)
> =20
>      xgt->fd =3D -1;
>      xgt->logger =3D logger;
> -    xgt->logger_tofree  =3D NULL;
> =20
>      xgt->tc_ah.restrict_callback =3D all_restrict_cb;
>      xentoolcore__register_active_handle(&xgt->tc_ah);
> =20
> -    if (!xgt->logger) {
> -        xgt->logger =3D xgt->logger_tofree =3D
> -            (xentoollog_logger*)
> -            xtl_createlogger_stdiostream(stderr, XTL_PROGRESS, 0);
> -        if (!xgt->logger) goto err;
> -    }
> -
>      rc =3D osdep_gnttab_open(xgt);
>      if ( rc  < 0 ) goto err;
> =20
> @@ -57,7 +49,6 @@ xengnttab_handle *xengnttab_open(xentoollog_logger *log=
ger, unsigned open_flags)
>  err:
>      xentoolcore__deregister_active_handle(&xgt->tc_ah);
>      osdep_gnttab_close(xgt);
> -    xtl_logger_destroy(xgt->logger_tofree);
>      free(xgt);
>      return NULL;
>  }
> @@ -71,7 +62,6 @@ int xengnttab_close(xengnttab_handle *xgt)
> =20
>      xentoolcore__deregister_active_handle(&xgt->tc_ah);
>      rc =3D osdep_gnttab_close(xgt);
> -    xtl_logger_destroy(xgt->logger_tofree);
>      free(xgt);
>      return rc;
>  }
> diff --git a/tools/libs/gnttab/private.h b/tools/libs/gnttab/private.h
> index c5e23639b1..cdb155761e 100644
> --- a/tools/libs/gnttab/private.h
> +++ b/tools/libs/gnttab/private.h
> @@ -12,7 +12,7 @@
>  #define GSERROR(_l, _f...) xtl_log(_l, XTL_ERROR, errno, "gntshr", _f)
> =20
>  struct xengntdev_handle {
> -    xentoollog_logger *logger, *logger_tofree;
> +    xentoollog_logger *logger;
>      int fd;
>      Xentoolcore__Active_Handle tc_ah;
>  };

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvmnZEACgkQ24/THMrX
1yxh8Af8D3YfSzC1c/RFxReINiUCdPSzdsh/saaqvimZLRgdEVNLVWVcvPCnrBFo
AsGXnXvRv/+RI4//DI1tboVnBS0zwy/yysAxLC987cWxP/Cl57pY6iZeILuvukol
VjKt8ZKAGwVvaUDW5u958/YFTPdeDmnbNDYjMgLIaI6pWDKAxeNzRnnsU6ki9CfH
fx6StNlXT6fPHyCxwjieV2M791zs8e7YL6jCSSMnWdRNUL7GmZQm8SgOGA3Q+U1W
7tNAK0ORXiE3P/J4qp/CYf++nE6EXTrHU5KoYHXCvBQlFrDbuzwfoJG1NoCq4TDl
7Ri1BT3HTCl3dS95w1MCnC6ePpU1zA==
=DzNB
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--


--===============3941894753492744666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3941894753492744666==--
