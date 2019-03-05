From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH for-next RFC 4/4] pygrub: make it build with
 python 3
Date: Tue, 5 Mar 2019 19:17:07 +0100
Message-ID: <20190305181707.GA19265@mail-itl>
References: <20190305164206.6793-1-wei.liu2@citrix.com>
 <20190305164206.6793-5-wei.liu2@citrix.com>
 <8f0a909e-3cdc-6867-e295-99734e91237c@citrix.com>
 <20190305174810.o2bfijujqrc3ejpk@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4790160907681931878=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9feg=RI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1h1FyB-0006DV-NY
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 19:43:19 +0000
In-Reply-To: <20190305174810.o2bfijujqrc3ejpk@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============4790160907681931878==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iv66pGDkNHRbjGM5"
Content-Disposition: inline


--iv66pGDkNHRbjGM5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH for-next RFC 4/4] pygrub: make it build with python 3

On Tue, Mar 05, 2019 at 05:48:10PM +0000, Wei Liu wrote:
> On Tue, Mar 05, 2019 at 05:42:07PM +0000, Andrew Cooper wrote:
> > On 05/03/2019 16:42, Wei Liu wrote:
> > > With the help of two porting guides and cpython source code:
> > >
> > > 1. Use PyUnicode to replace PyString counterparts.
> > > 2. Use PyVarObject_HEAD_INIT and provide compatibility for 2.5 and
> > >    earlier.
> > > 3. Remove usage of Py_FindMethod.
> > > 4. Use new module initialisation routine.
> > >
> > > For #3, Py_FindMethod was removed, yet an alternative wasn't
> > > documented.  The code is the result of reverse-engineering cpython
> > > commit 6116d4a1d1
> > >
> > > https://docs.python.org/3/howto/cporting.html
> > > http://python3porting.com/cextensions.html
> > >
> > > Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> >=20
> > Marek already made the tools/python/* libraries compatible with Py2 and=
 Py3
> >=20
> > The following commits are the relevant ones:
> >=20
> > * be6b316 - python: handle long type in scripts (2 years ago) <Marek Ma=
rczykowski-G=C3=B3recki>
> > * e16c705 - python: adjust module initalization for Python3 (2 years ag=
o) <Marek Marczykowski-G=C3=B3recki>
> > * dd986cd - python: use PyLong_* for constructing 'int' type in Python3=
 (2 years ago) <Marek Marczykowski-G=C3=B3recki>
> > * 121d9d4 - python: use PyBytes/PyUnicode instead of PyString (2 years =
ago) <Marek Marczykowski-G=C3=B3recki>
> > * 0c8981f - python: initialize specific fields of PyTypeObject (2 years=
 ago) <Marek Marczykowski-G=C3=B3recki>
> > * 7b1e5f7 - python: use Py_TYPE instead of looking directly into PyObje=
ct_HEAD (2 years ago) <Marek Marczykowski-G=C3=B3recki>
> > * 96d1ee6 - python: drop tp_getattr implementation (2 years ago) <Marek=
 Marczykowski-G=C3=B3recki>
> > * 6b28df3 - python: check return value of PyErr_NewException (2 years a=
go) <Marek Marczykowski-G=C3=B3recki>
>=20
> I knew.
>=20
> >=20
> > Which in particular handle strings differently in the Py2 case.
>=20
>=20
> I am not sure his changes for the string APIs are correct -- they seem
> to deviate from the official porting guide. But hey, I don't use these
> bindings myself, so he probably knows better.

That was intentional, because in py2 str type is the same as bytes
types, and in fact some of those str should really be bytes. It's in the
commit message:

    python: use PyBytes/PyUnicode instead of PyString
   =20
    In Python2 PyBytes is the same as PyString, but in Python3 PyString is
    gone and 'str' is really PyUnicode in C-API.
    When handling arbitrary data, use PyBytes - which is the right thing to
    do in Python3, and pose no API change in Python2. When handling
    xenstore paths and transaction ids, which have well defined format, use
    PyUnicode - to ease API usage - no need to prefix all xenstore paths
    with 'b' when migrating scripts to Python3.

I'm not sure if the same reasoning applies to pygrub, but I guess it
may. For example fsimage_file_read sounds like handling binary data, not
really UTF-8 strings. Using PyUnicode for arbitrary binary data may lead
to various UnicodeDecodeErrors.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--iv66pGDkNHRbjGM5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlx+vSQACgkQ24/THMrX
1ywEqQgAljsGGyFpFS2AoiBCax36dT7v+8Pg8W55kB02T47CKoS5I4w+wlLS0iwl
wZnijR5AnjQAl1OOnlqDJ71iv0dmECoJgvyHVnueKiJfCRSlnQLum7B5OTIdhL8k
dPo/qk4rCGTX/Ssgjt0G8g5EAQr6Z7mjbTVVF6edDhBsVIZ1pW9kMs0SH/yO85d+
yKWqDCxVLx+J/Xzj7pxoo60Ezugv5I96wHec52k5EglYvKCSmTThs8jjSBMDP5pY
YMVBEcswekZ8Jo7l2lU6eVQFGGLPo0FBeqnH8jjHZODXceLWG8XuMGy47NW5mGWb
jL8/SYDvV13uFVybvJHIHTKLyE6hOg==
=EQos
-----END PGP SIGNATURE-----

--iv66pGDkNHRbjGM5--


--===============4790160907681931878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4790160907681931878==--
