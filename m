From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 02/11] tools/libs/toollog: Use the
 default logger
Date: Sat, 10 Nov 2018 09:55:14 +0100
Message-ID: <20181110085514.GA4051@mail-itl>
References: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
 <20181108170805.12774-3-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8075469731981074592=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5xml=nv=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gLP32-0006qK-PX
 for xen-devel@lists.xenproject.org; Sat, 10 Nov 2018 08:55:20 +0000
In-Reply-To: <20181108170805.12774-3-ian.jackson@eu.citrix.com>
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


--===============8075469731981074592==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 08, 2018 at 05:07:56PM +0000, Ian Jackson wrote:
> Previously xtl_log, xtl_logv and xtl_progress would all crash if
> passed logger=3DNULL.  Have the use the default logger instead.
> This is more convenient.
>=20
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
> CC: Wei Liu <wei.liu2@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> v2: New in this version of the series
> ---
>  tools/libs/toollog/include/xentoollog.h | 9 +++++----
>  tools/libs/toollog/xtl_core.c           | 7 +++++++
>  2 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/tools/libs/toollog/include/xentoollog.h b/tools/libs/toollog=
/include/xentoollog.h
> index 942eb76169..9c7725f1cd 100644
> --- a/tools/libs/toollog/include/xentoollog.h
> +++ b/tools/libs/toollog/include/xentoollog.h
> @@ -89,25 +89,26 @@ void xtl_logger_destroy(struct xentoollog_logger *log=
ger /* 0 is ok */);
>  xentoollog_logger_stdiostream *xtl_defaultlogger_stdiostream(void);
>    /* Returns pointer to a static global logger which writes to stderr.
>     * Reconfiguring it is permitted but destroying it is forbidden.
> -   * This function cannot fail. */
> +   * This function cannot fail.
> +   * This default logger is usedd by xtl_log et al when logger=3D=3DNULL=
=2E */
> =20
>  /*---------- facilities for generating log messages ----------*/
> =20
> -void xtl_logv(struct xentoollog_logger *logger,
> +void xtl_logv(struct xentoollog_logger *logger /* NULL ok */,
>                xentoollog_level level,
>                int errnoval /* or -1 */,
>                const char *context /* eg "xc", "xenstore", "xl", may be 0=
 */,
>                const char *format /* does not contain \n */,
>                va_list) __attribute__((format(printf,5,0)));
> =20
> -void xtl_log(struct xentoollog_logger *logger,
> +void xtl_log(struct xentoollog_logger *logger /* NULL ok */,
>               xentoollog_level level,
>               int errnoval /* or -1 */,
>               const char *context /* eg "xc", "xenstore", "xl" */,
>               const char *format /* does not contain \n */,
>               ...) __attribute__((format(printf,5,6)));
> =20
> -void xtl_progress(struct xentoollog_logger *logger,
> +void xtl_progress(struct xentoollog_logger *logger /* NULL ok */,
>                    const char *context /* see above, may be 0 */,
>                    const char *doing_what,
>                    unsigned long done, unsigned long total);
> diff --git a/tools/libs/toollog/xtl_core.c b/tools/libs/toollog/xtl_core.c
> index 099d2f3095..c5da3f4f5d 100644
> --- a/tools/libs/toollog/xtl_core.c
> +++ b/tools/libs/toollog/xtl_core.c
> @@ -38,6 +38,11 @@ const char *xtl_level_to_string(xentoollog_level level=
) {
>      return level_strings[level];
>  }
> =20
> +static void defaultlogger(xentoollog_logger **logger) {
> +    if (*logger) return;
> +    *logger =3D (xentoollog_logger*)xtl_defaultlogger_stdiostream();
> +}
> +
>  void xtl_logv(struct xentoollog_logger *logger,
>                xentoollog_level level,
>                int errnoval /* or -1 */,
> @@ -46,6 +51,7 @@ void xtl_logv(struct xentoollog_logger *logger,
>                va_list al) {
>      int errno_save =3D errno;
>      assert(level > XTL_NONE && level < XTL_NUM_LEVELS);
> +    defaultlogger(&logger);
>      logger->vmessage(logger,level,errnoval,context,format,al);
>      errno =3D errno_save;
>  }
> @@ -67,6 +73,7 @@ void xtl_progress(struct xentoollog_logger *logger,
>                    unsigned long done, unsigned long total) {
>      int percent =3D 0;
> =20
> +    defaultlogger(&logger);
>      if (!logger->progress) return;
> =20
>      if ( total )

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvmnPMACgkQ24/THMrX
1yxPSAgAgIVGaaymn4PNLrNlyRM/JFwSketMVCWf37c6O8yp4rmQ4w66YSK0OM2E
R/IQeAUWMLAEakTIW3sRC3gC+QvWLO6gJ4mguS8ocDVUQg6vKfbR4jdDlD8yvRS/
MrUWQtMqXpgCfWlSJZ8aIkOg1Ndn72I15Z5GeB1WLcwR+fNeJniN3qEGnmDNbrTV
jRF2BuWaH+btCu6EGfS4kYnWNdnP6yW90Ex8Hs6PEIa80AsL7wubSyHYArYdrIry
4e3a1jd1YUof73sPdxY6h4rWJhACkyyGkdizgw6FZBbp8U3N1ziM25Y5+epkR8jB
wFuhxKN0v6oCNtE2TLouYBZl0S9lBQ==
=SCUw
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--


--===============8075469731981074592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8075469731981074592==--
