From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: null scheduler bug
Date: Thu, 27 Sep 2018 16:32:04 +0200
Message-ID: <86360891f996bdb078a5eff7f860fbbb39fbc5ac.camel@suse.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
 <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
 <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
 <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
 <529d38d04b140d90d33e424a064d401cf06f14cf.camel@suse.com>
 <CADJ6SV09MS1x+qGJOu71W8M6cVhRaVuODBYDReHWmOm4c1NEfQ@mail.gmail.com>
 <CADJ6SV0+O5c52_qwOUEakuX82C2+8Z-M4mKj0x+13GXjaiJjvw@mail.gmail.com>
 <a468e3dfc55bb6a421d47b908f89d9112075cc04.camel@suse.com>
 <CADJ6SV0=p3efMNmdx5ud8BAPscOZpSBqBZ2LJieE3M+Rq3phNQ@mail.gmail.com>
 <b9c1a71c455e8a1682bb13527503c7c0f0135887.camel@suse.com>
 <2ec1f6c5-df53-fce3-9062-123832ae8e6a@arm.com>
 <2bb4df76339b020351720927d05f2d1e565cebbc.camel@suse.com>
 <04bed226-f787-e86f-4373-d05186ab03cf@arm.com>
 <d8d276a20e4567e427ad48d5dd494366dde4f963.camel@suse.com>
 <39666f3710ae7adfbb43c9dc0efac0d60245c411.camel@suse.com>
 <CADJ6SV2FP6Deu7SevTDNjT2sOJ2nQMeAOUS0J8jemamONfftiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6218862508372169790=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=r25c=mj=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g5XKq-0004CR-QM
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 14:32:08 +0000
In-Reply-To: <CADJ6SV2FP6Deu7SevTDNjT2sOJ2nQMeAOUS0J8jemamONfftiA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <stefano@stabellini.net>, Julien Grall <julien.grall@arm.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, tim@xen.org, Milan Boberic <milanboberic94@gmail.com>, JBeulich@suse.com, Andrew Cooper <Andrew.Cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6218862508372169790==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2zZdqCEs4B0yGHLx4sz7"


--=-2zZdqCEs4B0yGHLx4sz7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-09-27 at 15:15 +0200, Milan Boberic wrote:
> Hi,
> I applied patch and vwfi=3Dnative and everything works fine, I can
> create and destroy guest domain as many times as I want.
>=20
Ok, now that we know it works, what do you guys prefer?

Stefano? Julien? I know it's not strictly an ARM-only issue, but I'm
asking you because ARM is where it shows-up/harm the most.

I personally would be ok with:
- doing a patch adding qhimark, qlowmark and blimit boot command line=20
  parameters;
- doing a patch (similar to this one) forcing the parameters to a=20
  specific state (and printing a warning about that), if wfi=3Dnative is=
=20
  used.

Thoughts?

Oh, and I'm adding Juergen in case we consider this relevant for the
release (and in case we want to add a Jira issue, which I don't think I
can do).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-2zZdqCEs4B0yGHLx4sz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlus6eQACgkQFkJ4iaW4
c+4oyhAAzFmNby2VvejAyjfdwo57m2X4PU2yg8KQ81tkd0qnBV/IOjK8h3CkkRvi
uobhY9nhB1OKDdnpMKxgWio+j1z8LsoQgXFpr6NYnJBlRDPfQBwrVhuDowJ7DZ2U
9//JPoVG9Kh6Vrem8yusLjixKeI9zwKiSy6yYak6AU+86wJxz68EdO6HTAc/pbXI
8Lb+9zXgFHjeos4A0S6GQh61sxtc3l0Axxa1OhuOz9K7MLgEP7Ct1c5Q/jEIIpws
+3Kr37xFQqegYuEDEWvyRWX6G7qULdNgEBDerKlT0nXyODrawfK04X2r2GElvgJB
PSqoF8+IW2wktrAH5B+aXh70fjZyZaknbEEOO2rGN0omWoTBSSI1pCttNXuw2FX3
BAbY+fr3uL9ALQScDuNnP2jQsxtbBX+17A7iKQOUgq8f9BF3ogJuq9QhVO9FWcQi
eQP1Jfs3hqJZgPpVuZW73KXjXWOTf9XekUxbDqfMeAnMV/PFGYYGH9VnnmKjS8Nz
/rbb2K1TCpQx5QQDDxJ2U5P4872bz1noAJBzsn/pnDynjYpmw+0z4YWJ7Isc5+1S
5ADOmSzo915n2tEfeSrgOJH5SsLGcZcFBkjxC2nrN7GOiSH9+ZAHnl3hbOoPFhtZ
v/CSbz/+T9xt3izBZmIoMubY/l8/3JBAdzs+3acxFjIC836BeVI=
=XPP4
-----END PGP SIGNATURE-----

--=-2zZdqCEs4B0yGHLx4sz7--



--===============6218862508372169790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6218862508372169790==--
