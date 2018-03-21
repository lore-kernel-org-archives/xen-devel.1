From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2] libxl: allow libxl_domain_suspend to
 simply suspend a domain, without saving it
Date: Wed, 21 Mar 2018 17:08:41 +0100
Message-ID: <20180321160841.GQ7364@mail-itl>
References: <20180314143608.22615-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5179865247369756843=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314143608.22615-1-marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Marcus of Wetware Labs <marcus@wetwa.re>
List-Id: xen-devel@lists.xenproject.org


--===============5179865247369756843==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+ri2T0IZgb46yOXM"
Content-Disposition: inline


--+ri2T0IZgb46yOXM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2018 at 03:36:08PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> When LIBXL_SUSPEND_NO_SAVE flag is set, no savefile will be written, but
> the domain will still be suspended (but not destroyed). The main reason
> for this functionality is to suspend the host while some domains are
> running, potentially holding PCI devices. This will give a chance to a
> driver in such a domain to properly suspend the device.
>=20
> It would be better to have a separate function for this, but in fact it
> should be named libxl_domain_suspend, then the current one renamed to
> libxl_domain_save. Since that would break API compatibility, keep it in
> the same function.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> Signed-off-by: Marcus of Wetware Labs <marcus@wetwa.re>

Bump?

Any chances to get it into 4.11?

> ---
> Changes in v2:
>  - drop double initialization of dsps fields (libxl__domain_suspend_init
>    is called)
>  - use LIBXL_SUSPEND_NO_SAVE flag instead of fd=3D-1
> ---
>  tools/libxl/libxl.h        |  5 +++++
>  tools/libxl/libxl_domain.c | 52 +++++++++++++++++++++++++++++++++-------=
------
>  2 files changed, 42 insertions(+), 15 deletions(-)
>=20
> diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h
> index eca0ea2c50..636db77c2b 100644
> --- a/tools/libxl/libxl.h
> +++ b/tools/libxl/libxl.h
> @@ -1469,6 +1469,11 @@ int libxl_domain_suspend(libxl_ctx *ctx, uint32_t =
domid, int fd,
>                           LIBXL_EXTERNAL_CALLERS_ONLY;
>  #define LIBXL_SUSPEND_DEBUG 1
>  #define LIBXL_SUSPEND_LIVE 2
> +/*
> + * Just transition the domain into suspended state, do not save its stat=
e to
> + * disk and do not destroy it. fd parameter is ignored.
> + */
> +#define LIBXL_SUSPEND_NO_SAVE 4
> =20
>  /* @param suspend_cancel [from xenctrl.h:xc_domain_resume( @param fast )]
>   *   If this parameter is true, use co-operative resume. The guest
> diff --git a/tools/libxl/libxl_domain.c b/tools/libxl/libxl_domain.c
> index 13b1c73d40..0e9e245ce3 100644
> --- a/tools/libxl/libxl_domain.c
> +++ b/tools/libxl/libxl_domain.c
> @@ -486,6 +486,13 @@ static void domain_suspend_cb(libxl__egc *egc,
> =20
>  }
> =20
> +static void domain_suspend_empty_cb(libxl__egc *egc,
> +                              libxl__domain_suspend_state *dss, int rc)
> +{
> +    STATE_AO_GC(dss->ao);
> +    libxl__ao_complete(egc,ao,rc);
> +}
> +
>  int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd, int fla=
gs,
>                           const libxl_asyncop_how *ao_how)
>  {
> @@ -498,25 +505,40 @@ int libxl_domain_suspend(libxl_ctx *ctx, uint32_t d=
omid, int fd, int flags,
>          goto out_err;
>      }
> =20
> -    libxl__domain_save_state *dss;
> -    GCNEW(dss);
> +    if (!(flags & LIBXL_SUSPEND_NO_SAVE)) {
> +        libxl__domain_save_state *dss;
> =20
> -    dss->ao =3D ao;
> -    dss->callback =3D domain_suspend_cb;
> +        GCNEW(dss);
> =20
> -    dss->domid =3D domid;
> -    dss->fd =3D fd;
> -    dss->type =3D type;
> -    dss->live =3D flags & LIBXL_SUSPEND_LIVE;
> -    dss->debug =3D flags & LIBXL_SUSPEND_DEBUG;
> -    dss->checkpointed_stream =3D LIBXL_CHECKPOINTED_STREAM_NONE;
> +        dss->ao =3D ao;
> +        dss->callback =3D domain_suspend_cb;
> +
> +        dss->domid =3D domid;
> +        dss->fd =3D fd;
> +        dss->type =3D type;
> +        dss->live =3D flags & LIBXL_SUSPEND_LIVE;
> +        dss->debug =3D flags & LIBXL_SUSPEND_DEBUG;
> +        dss->checkpointed_stream =3D LIBXL_CHECKPOINTED_STREAM_NONE;
> +
> +        rc =3D libxl__fd_flags_modify_save(gc, dss->fd,
> +                                         ~(O_NONBLOCK|O_NDELAY), 0,
> +                                         &dss->fdfl);
> +        if (rc < 0) goto out_err;
> =20
> -    rc =3D libxl__fd_flags_modify_save(gc, dss->fd,
> -                                     ~(O_NONBLOCK|O_NDELAY), 0,
> -                                     &dss->fdfl);
> -    if (rc < 0) goto out_err;
> +        libxl__domain_save(egc, dss);
> +    } else {
> +        libxl__domain_suspend_state *dsps;
> +
> +        GCNEW(dsps);
> +        dsps->ao =3D ao;
> +        dsps->domid =3D domid;
> +        dsps->type =3D type;
> +        rc =3D libxl__domain_suspend_init(egc, dsps, type);
> +        if (rc < 0) goto out_err;
> +        dsps->callback_common_done =3D domain_suspend_empty_cb;
> +        libxl__domain_suspend(egc, dsps);
> +    }
> =20
> -    libxl__domain_save(egc, dss);
>      return AO_INPROGRESS;
> =20
>   out_err:

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+ri2T0IZgb46yOXM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlqsCq4ACgkQ24/THMrX
1yyBogf+PNsU1t26eYA4ULOF9D+vScRAZwKEcQqQHyHo3vVPSImyY4TnWZhDebs1
JWl2r5n1FvKarnN55EWCga/RZpfZRacc4x8FR11TPMNW00+Xw8zNjuBMCJFSGQds
a7U9OIgXYlvaL60P5F9Ih1+M744gmYEmK/CfAmzqfgY4ROLViXzVCG9BbZT7gbkQ
AmhUGkO7Lr6Jr9tPOvl7XqJYURlY6G9OuGzSltKmoa3EwPrAJUhwyVeWDc5+prid
ltVbXtOfHvILj2jrS+CkL6w5ryEZMtlPsmZ9J67WeklSiZPwl+mKD9G0q0NUjSAn
FR1DanwR/0If7J8DROb+04C7pl2Q+Q==
=T5JW
-----END PGP SIGNATURE-----

--+ri2T0IZgb46yOXM--


--===============5179865247369756843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5179865247369756843==--
