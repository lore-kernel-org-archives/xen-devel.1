From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 02/17] libxl: Add
 "stubdomain_version" to domain_build_info.
Date: Tue, 16 Oct 2018 19:36:59 +0200
Message-ID: <20181016173659.GB1563@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <7c30330d13abc993594a264e3c7c61693c9fc316.1533608042.git-series.marmarek@invisiblethingslab.com>
 <20180809092541.u6xwmsk2egugwbu6@citrix.com>
 <20180903222527.GB1353@mail-itl>
 <23494.5430.77966.734666@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6984113278273551154=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x11d=m4=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gCTHE-0001pa-EP
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 17:37:04 +0000
In-Reply-To: <23494.5430.77966.734666@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org


--===============6984113278273551154==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 05:43:34PM +0100, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("Re: [RFC PATCH v2 02/17] libxl: =
Add "stubdomain_version" to domain_build_info."):
> > Actually, with patch 04/17 you can set explicit stubdomain path, so
> > stubdomain_version is only another way (redundant to
> > device_model_version) to signal what protocol to communicate with
> > stubdomain should be used. Right now each qemu version have only one
> > stubdomain protocol:
> >  - qemu-xen-traditional - "mini os" one
> >  - qemu-xen - "linux" one - see cover letter
>=20
> I'm not sure why you need introduce a stubdomain_version variable
> internally, or the corresponding stubdomain_version config option, at
> all.
>=20
> Do we expect to have qemu trad on Linux ?  Seems unlikely.  We have
> been trying to do modern qemu on minios or rump kernels or something
> for years and gotten nowhere.
>=20
> So maybe what we should have is an internal macro or inline function
> called stubdomain_is_linux, so we can add new variants later
> internally.
>=20
> But I don't see the need for this to be in the public and stable libxl
> ABI.  Unless I'm missing something.

I imagine there may be more stubdomain versions in the future,
especially when the stubdomain path can be easily set in domain config.
But it's ok to add such field only if/when we'll actually have multiple
of them supported in upstream libxl. As long as the code will be clear
about what it "qemu-xen specific" and what is "linux stubdomain
specific". But stubdomain_is_linux macro should be enough.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvGIbsACgkQ24/THMrX
1yzQTQf9HZt8h3/0ObIXf6s86VJp1Aska/QfUrXE8dj7FCVFYeRIp8xwzlY91pHj
xhZ4xWgL76tajXOW1QLIbbwARzwkW5ChyYX0lenwzx4wUtM3sy9Ez5s2fpJ+ClHZ
+8OpmVeKsVbDjnGQ/6N8p7nemzX62OnHDT0FGfQqocOlwoIQaTzMd2cM7Qff7SBR
TkK9Skzrve4IzLrc/AV21eQbcRoPecHfSv9d7CQEWs9QBeSebx2mT1XPpQj5lILL
/PFN7E1Pf3WIVLEXvu8eVWFFPvdpmeZ4X4KwOSZlGZeEBLDG8Tgw+EUPtpNU9KEh
oSlyERLhcoZOUYiFpwiEmEzodbV7XQ==
=tf0t
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--


--===============6984113278273551154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6984113278273551154==--
