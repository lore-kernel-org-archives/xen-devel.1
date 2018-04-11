From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 09:42:34 +0200
Message-ID: <b197a1189cd3da0061e02cfd34863f9beeed0946.camel@suse.com>
References: <20180410085729.GA472@aepfle.de>
 <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <94e5c70c-4f6b-6abc-0c18-ee6225372e2d@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1999638930844271701=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <94e5c70c-4f6b-6abc-0c18-ee6225372e2d@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============1999638930844271701==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-TLv0sSRd/V4SGI8BAzmy"


--=-TLv0sSRd/V4SGI8BAzmy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 09:39 +0200, Juergen Gross wrote:
> On 11/04/18 09:31, Dario Faggioli wrote:
> > > On Tue, 2018-04-10 at 22:37 +0200, Olaf Hering wrote:
> > > > On Tue, Apr 10, Dario Faggioli wrote:
> > > >=20
> > > >     BUG_ON(__vcpu_on_runq(CSCHED_VCPU(vc)));
> > > >=20
> >=20
> > ... patch attached.
>=20
> Wouldn't it make more sense to add the call of vcpu_sleep_nosync()
> to vcpu_migrate() and drop all the other calls of vcpu_sleep_nosync()
> before calling vcpu_migrate()?
>
Absolutely. But let's first see if this actually fixes the problem. :-)

Regards,
Dario
<pre>-- <br></pre>&lt;&lt;This happens because I choose it to happen!&gt;&g=
t; (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-TLv0sSRd/V4SGI8BAzmy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrNvGoACgkQFkJ4iaW4
c+5NVhAA30Iq/d4tJOHMs3SueC8n1VtolJEKuLlgy9um/hOFpmJDgDKHPHt0JVdr
w8L38IkBoIDqKGEvd8ZPp1mNycSoc3y+yp7dFOy0j0RDsLng137o8TEwJuOHkKLw
OX2MIoxtIRWfLr8WIj6n9z8BsjPw8f42F7rnBdGpuk5PZhbYaLIEcXHLZd10CcnE
9/0vmVoPsIzzE51Mc/S9Tnzi329jRG1ec66oaY4ukO7ehdmwf9Dqk6liu7cXhPJt
64zCUbVGWPW2vLBrK25KjPaCkXhxeWCDCFGF66jBW9uRlpHmd+wyRkZl7QMc5wFU
XufmJiBxOXIHoJnaV/+NDAmq6+zRlc8xXqpatC+Jir5rnHaddi4vJO6ik2/9v4b3
HYisrrXizD5FBxvdQDmWKmxJkl/Sre/eeUt15qRiBAOTOgxafoBQ85ELZgxG8jKC
+7jGoHSjcNqR1vUPYdFA8M3pog0OM9bcTXdXZUZ4tcHxzcSkUPGacvDnyCQ+LeM9
qduAqLKFUwzH5mKxLixVKzkOW1BKeYH/lq4mIfMJIpSF6sta+X0x0v03kUyjuYC3
PA4pIq6u6dNxzFFR2dmrPJgig5eK/5zOdTrHnFVky8GBwi+CQerO/03WWw3pmhbn
S/Z+FVf4669d9RXtJmZlu1c4U+INjaL7ajkj3fqyl7pQQNZh3nY=
=YZlh
-----END PGP SIGNATURE-----

--=-TLv0sSRd/V4SGI8BAzmy--



--===============1999638930844271701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1999638930844271701==--
