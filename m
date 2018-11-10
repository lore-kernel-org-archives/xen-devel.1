From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 11/11] tools/libvchan:
 libxenvchan_client_init: use ENOENT for no server
Date: Sat, 10 Nov 2018 10:06:47 +0100
Message-ID: <20181110090647.GC4051@mail-itl>
References: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
 <20181108170805.12774-12-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9155952007922509068=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5xml=nv=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gLPED-0007zv-5I
 for xen-devel@lists.xenproject.org; Sat, 10 Nov 2018 09:06:53 +0000
In-Reply-To: <20181108170805.12774-12-ian.jackson@eu.citrix.com>
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


--===============9155952007922509068==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Content-Disposition: inline


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 08, 2018 at 05:08:05PM +0000, Ian Jackson wrote:
> * Promise that we will set errno to ENOENT if the server is not
>   yet set up.
> * Arrange that all ENOENT returns other than from the read of ring-ref
>   are turned into EIO, logging when we do so.
>=20
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

Since xtl_log now accepts NULL, it should be fine. Thanks!
Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
>  tools/libvchan/init.c        | 11 ++++++++++-
>  tools/libvchan/libxenvchan.h |  4 ++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/libvchan/init.c b/tools/libvchan/init.c
> index d987acd338..e58f6bf9ac 100644
> --- a/tools/libvchan/init.c
> +++ b/tools/libvchan/init.c
> @@ -45,6 +45,7 @@
>  #include <xen/sys/gntalloc.h>
>  #include <xen/sys/gntdev.h>
>  #include <libxenvchan.h>
> +#include <xentoollog.h>
> =20
>  #ifndef PAGE_SHIFT
>  #define PAGE_SHIFT 12
> @@ -419,7 +420,7 @@ struct libxenvchan *libxenvchan_client_init(struct xe=
ntoollog_logger *logger,
>  	snprintf(buf, sizeof buf, "%s/ring-ref", xs_path);
>  	ref =3D xs_read(xs, 0, buf, &len);
>  	if (!ref)
> -		goto fail;
> +		goto fail_allow_enoent;
>  	ring_ref =3D atoi(ref);
>  	free(ref);
>  	if (!ring_ref)
> @@ -452,7 +453,15 @@ struct libxenvchan *libxenvchan_client_init(struct x=
entoollog_logger *logger,
>  	if (xs)
>  		xs_daemon_close(xs);
>  	return ctrl;
> +
>   fail:
> +	if (errno =3D=3D ENOENT) {
> +		xtl_log(logger, XTL_ERROR, errno, "vchan",
> +			"error talking to server `%s', returning EIO",
> +			xs_path);
> +		errno =3D EIO;
> +	}
> + fail_allow_enoent:
>  	libxenvchan_close(ctrl);
>  	ctrl =3D NULL;
>  	goto out;
> diff --git a/tools/libvchan/libxenvchan.h b/tools/libvchan/libxenvchan.h
> index e4ccca1ff0..8a4ec2ce4c 100644
> --- a/tools/libvchan/libxenvchan.h
> +++ b/tools/libvchan/libxenvchan.h
> @@ -105,6 +105,10 @@ struct libxenvchan *libxenvchan_server_init(struct x=
entoollog_logger *logger,
>   * safely, however no locking is performed, so you must prevent multiple=
 clients
>   * from connecting to a single server.
>   *
> + * Failing with ENOENT means the server has not yet called
> + * libxenvchan_server_init, You may wait for a server to appear by
> + * setting a xenstore watch on xs_path.
> + *
>   * @param logger Logger for libxc errors
>   * @param domain The peer domain to connect to
>   * @param xs_path Base xenstore path for storing ring/event data

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvmn6gACgkQ24/THMrX
1yyJJQf/Qpjt5UtCS/ripTaasjkrXb7AsE2HHRXi7rS2RhiHISfXsmtwPe4Zp+QB
IOOyyz6UzSiiOg5EoGn9ksbD1i12epKFkS9W7m+3SjogsCsppeDWEzD+Ai+okC2O
9W1YtmhAv76gMTvggYfNwcW7tthENFWWh6MhaaJVfCllXK0UDGMjCEo0s2HfPSvS
LhOKqTZk1BpEHxTTyrp3BnI9GRi3OxAyMHR/sq7IgUig/HasIeto3G88jp2qD3wg
hkuFq1V9I4Ih+TxJRvsJpco+3jQmEqO0Zvm8+pDHeL/hXa2wy9VhJAVumECTaAj2
UvVP/KQr/l5R/1H+0UhQ4CLwheMGnA==
=rXZf
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--


--===============9155952007922509068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9155952007922509068==--
