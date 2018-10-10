From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v5 01/15] libxl: Design of an async API to
 issue QMP commands to QEMU
Date: Thu, 11 Oct 2018 01:49:01 +0200
Message-ID: <20181010234901.GA4138@mail-itl>
References: <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-2-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5896672441736230652=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mros=mw=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gAOE6-0001NR-5T
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 23:49:14 +0000
In-Reply-To: <20180907151104.32306-2-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5896672441736230652==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 07, 2018 at 04:10:50PM +0100, Anthony PERARD wrote:
> All the functions will be implemented in later patches.
>=20
> This patch includes the API that libxl can use to send QMP commands to
> QEMU.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>=20
> Notes:
>     v5:
>         some changes in the comment
>=20
>  tools/libxl/libxl_internal.h | 72 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 70 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
> index 802382c704..979a9947f0 100644
> --- a/tools/libxl/libxl_internal.h
> +++ b/tools/libxl/libxl_internal.h
> @@ -202,6 +202,8 @@ typedef struct libxl__ao libxl__ao;
>  typedef struct libxl__aop_occurred libxl__aop_occurred;
>  typedef struct libxl__osevent_hook_nexus libxl__osevent_hook_nexus;
>  typedef struct libxl__osevent_hook_nexi libxl__osevent_hook_nexi;
> +typedef struct libxl__json_object libxl__json_object;
> +typedef struct libxl__carefd libxl__carefd;
> =20
>  typedef struct libxl__domain_create_state libxl__domain_create_state;
>  typedef void libxl__domain_create_cb(struct libxl__egc *egc,
> @@ -357,6 +359,72 @@ struct libxl__ev_child {
>      LIBXL_LIST_ENTRY(struct libxl__ev_child) entry;
>  };
> =20
> +/*
> + * QMP asynchronous calls
> + *
> + * This facility allows a command to be sent to QEMU, and the response t=
o be
> + * handed to a callback function.
> + *
> + * Commands can be chained, with a same connection. (e.g. "add-fd" will =
need to
> + * be chained to the next command). A libxl__ev_qmp can be reused when t=
he
> + * callback is been called in order to use the same connection.
> + *
> + * Only one connection at a time can be made to one QEMU, so avoid keepi=
ng a
> + * libxl__ev_qmp Connected for to long and call libxl__ev_qmp_dispose as=
 soon
> + * as it is not needed anymore.

=46rom where this limitation comes? Was that true before? I ask, because
that limitation would ease Linux-based stubdomain case, where QMP over
console have indeed only a single channel.

> + *
> + * Possible states of a libxl__ev_qmp:
> + *  Undefined
> + *    Might contain anything.
> + *  Idle
> + *    Struct contents are defined enough to pass to any libxl__ev_qmp_*
> + *    function.
> + *    The struct does not contain references to any allocated private re=
sources
> + *    so can be thrown away.
> + *  Active
> + *    Currently waiting for the callback to be called.
> + *    _dispose must be called to reclaim resources.
> + *  Connected
> + *    Struct contain allocated ressources.
> + *    Calling _send() with this same ev will use the same QMP connection.
> + *    _dispose() must be called to reclaim resources.
> + *
> + * libxl__ev_qmp_init: Undefined/Idle -> Idle
> + *
> + * libxl__ev_qmp_send: Idle/Connected -> Active (on error: Idle)

Does it also mean libxl__ev_qmp_init or libxl__ev_qmp_send should deal
with connecting to qemu, which _does not know it is a new connection_,
so will not send a greeting etc? In case of QMP over console, there is
no OOB method to signal open/close (at least not easily). I implemented
rather hacky/incomplete way to reset QMP connection - or rather - send
greeting again, but that may result in confusing situations, like
QEMU sending response to previous command to unsuspecting new libxl
client.

> + *    Sends a command to QEMU.
> + *    callback will be called when a response is received or when an err=
or
> + *    as occured.
> + *
> + * libxl__ev_qmp_dispose: Connected/Active/Idle -> Idle
> + *
> + * callback: When called: Active -> Connected
> + *    When called, ev is Connected and can be reused or disposed of.
> + *    If an error occured, it is called with response =3D=3D NULL and th=
e error
> + *    code in rc.
> + *    The callback is only called once.
> + */

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlu+j+wACgkQ24/THMrX
1ywbeAf+Ps9JVDeYC/WfgUNJVBMZs8i3Lb7OzbRMpBSPDFWqQeBesxwDWZWvVIBl
g5nNZ5UL4cOPmgUoHZ+J08eH6PJH0KWSYP5o6D+SAoQ0Ml9ZfUhCqbdOwIBP9I4I
jHtKgtJ3+pl9OrE1dZvadw6dLwkY8V2H/7ZmFp5FYACyOMPdvn97Pqppj9AMEzfB
0AR5XqT6Z9gvHJE/sH3GZq/k1X6A0Tu1e9ZTQ1dFhhoTKlx+lrz+/qpKWl/e20Ob
4WZFSmQVwZnP2rJNpUq0B//40Tcd6H/LmWdp1lmAtcMUSvXr0ej89kfdRHRiWMXN
vVxXkO9LHBtLTdb+Q7zMjOpGJd6DJg==
=Z7M9
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--


--===============5896672441736230652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5896672441736230652==--
