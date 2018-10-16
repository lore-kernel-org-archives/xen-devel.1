From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [PATCH v4 03/23] xen/arm: document dom0less
Date: Tue, 16 Oct 2018 08:58:55 +0100
Message-ID: <638073F3-6455-45D5-B3C6-8F96D3D99879@xenproject.org>
References: <alpine.DEB.2.10.1810051140030.24936@sstabellini-ThinkPad-X260>
 <1538765251-25256-3-git-send-email-sstabellini@kernel.org>
 <4954c486-9663-552c-0fd8-9f59421146b5@arm.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: multipart/mixed; boundary="===============7178768004120077815=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4954c486-9663-552c-0fd8-9f59421146b5@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============7178768004120077815==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7387734E-23CD-4C22-99E8-6D340A85BBA1";
	protocol="application/pgp-signature";
	micalg=pgp-sha512


--Apple-Mail=_7387734E-23CD-4C22-99E8-6D340A85BBA1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Stefano,

> On 9 Oct 2018, at 12:52, Julien Grall <julien.grall@arm.com> wrote:
>=20
> Hi Stefano,
>=20
> On 05/10/2018 19:47, Stefano Stabellini wrote:
>> Add a new document to provide information on how to use dom0less =
related
>> features and their current limitations.
>> Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
>> ---
>> Changes in v4:
>> - rename to .txt
>> - improve wording
>> Changes in v3:
>> - add patch
>> ---
>>  docs/misc/arm/dom0less.txt | 47 =
++++++++++++++++++++++++++++++++++++++++++++++
>=20
> As said on the previous version, you likely need to add an entry in =
docs/INDEX.

Agreed. Also, it may be worthwhile encoding the doc in markdown (it's =
not that much text) and using the .markdown extension
Also, it seems to me that docs/features is maybe a better place for this =
document. Not sure whether docs in this folder get picked up =
automatically though

Lars

--Apple-Mail=_7387734E-23CD-4C22-99E8-6D340A85BBA1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGMt8INYPShzLT5l8yRKINn2yyNoFAlvFmj8ACgkQyRKINn2y
yNrveBAAmQ2sOMst8QWClD6g/JYGtMl4jN1djNzl1YxnErZ/SbUZmZM5boc8kR1y
u+dM92kJmRGz6ApiPRSl0uy2Z3xDbq3EabPCm2vXNhVo4ylZjxl1ywLleedEAi2V
/v765L5q+4wkjwGrn0Qm1u6sJc1NA/ueYq/Pbhfpcy2MwbkUV9vn03RlbTXItCna
dE9iSNp9lFloxS0ZPTrFrKrKkjkExuFYNN+b59MqoZLzoy7Sxb4HxytAaGo9gdrd
8vRM83oP5gko1B2f4TPiqOCYfYrvr3dx497OOMotsN8txN/AXltxKQgEczqrjpvS
MfnFqt1qACWeH0tZc8ds9MO84lF2mc1BJ11yn9OT9VPuKn6TAy9dCisW38CXk2yO
mJ6sKrGWfGgFsjfHGzAmeDdXFlGVhawxNJTHnYxM266DlP50C9XF6PDY1tMw0vUS
ggyZu5cPH34tVAJLU0P3WARNf7iy8P5bFrb4D5PhtDWowXNj6DIV23u+Lwb8imKI
GCPbP9VQwLuWdQnKeyoB8ZrkvykXEDdbRaFQL+2gQf6L8+3yRGQPoUy4gCJzU5E8
KQxtATmw/WM6CmJ8TtFO0SnFqFIEhGNXDPse9e0JG0CPXx2s/0ujg7Dq7p7LJcQ9
jtMs1ryu2K2vkgI3jK/R+X2vLD+adxdHcnEagXRxjK37AZikKQ8=
=wlyw
-----END PGP SIGNATURE-----

--Apple-Mail=_7387734E-23CD-4C22-99E8-6D340A85BBA1--


--===============7178768004120077815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7178768004120077815==--
