From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 11/17] xenconsoled: add support for
 consoles using 'state' xenstore entry
Date: Wed, 9 Jan 2019 13:21:12 +0100
Message-ID: <20190109122112.GF29536@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <ba81fc5252f1f05771995920220daf1e4348bc6e.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23515.13859.675144.207575@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3347592142718179983=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qfCy=PR=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ghCrI-0003pg-O4
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 12:21:20 +0000
In-Reply-To: <23515.13859.675144.207575@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3347592142718179983==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline


--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH v2 11/17] xenconsoled: add support for consoles using
 'state' xenstore entry

On Thu, Nov 01, 2018 at 05:21:39PM +0000, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("[RFC PATCH v2 11/17] xenconsoled=
: add support for consoles using 'state' xenstore entry"):
> > Add support for standard xenbus initialization protocol using 'state'
> > xenstore entry. It will be necessary for secondary consoles.
> > For consoles supporting it, read 'state' entry on the frontend and
> > proceed accordingly - either init console or close it. When closing,
> > make sure all the in-transit data is flushed (both from shared ring and
> > from local buffer), if possible. This is especially important for
> > MiniOS-based qemu stubdomain, which closes console just after writing
> > device model state to it.
> > For consoles without 'state' field behavior is unchanged - on any watch
> > event try to connect console, as long as domain is alive.
>=20
> I'm not opposed to the introduction of this state field.  The code
> looks plausible.
>=20
> But:
>=20
> Firstly, you have put the protocol description in your commit
> message (and it seems rather informal).  Can you please provide
> a comprehensive protocol specification in-tree ?  You need to patch
>    docs/misc/console.txt
> I think.
>=20
> I say `comprehensive' because your text is not particularly clearly
> about who is supposed to `flush' which data exactly when.  Nor what
> `flushing' means (does it ever mean discarding?)
>=20
> Secondly: what about backwards compatibility ?  I think we need to at
> least think about the possibility that there are some guest frontends
> out there which may look for a `state' node and do something
> undesirable with it.  I think this possibility is remote but it should
> be mentioned in the commit message.

Note that this commit _does not_ invent any new protocol at all. It merely
add support for the protocol that is used by additional consoles. The
backend side was implemented by qemu only before, now I add support for
it to xenconsoled.

This is about (additional) consoles living in
/local/domain/$DOMID/device/console/$DEVID, not the special-kind-of-thing
living in /local/domain/$DOMID/console. Is there any protocol specification
for it already anywhere? I can't see it xen/include/public/io/ as it's
for other device types - console.h have only struct xencons_interface
declaration without any comment. I can't find it in other places either.
If there is one, it should be added to docs/misc/console.txt and/or
xen/include/public/io/console.h. Otherwise I can add some basic spec to
docs/misc/console.txt.

> What about the possibility that one or the other end of the connection
> may be replaced by a different implementation, so that the peer
> appears to gain or lose support for `state' ?

Actually, I'm doing similar thing here ;) previously xenconsoled didn't
know anything about 'state' field and it was one of the reason it
couldn't handle multiple consoles per domain.

> I'll be able to review the code more effectively when there is a
> formal protocol spec to compare it to...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlw15zgACgkQ24/THMrX
1yyKIAgAmU4aJRPcfNxV1X8q49Xxey/ZXYnbVmrHD1qoJeYJZuSfy4RUxjjL0D/Q
vEbnUI8L9vfl/q6/Cip7zuVQRkjDbUcuXjlwwdp8jc0zA56ydBiT8pZWWMLtn2k2
mAD11vpbM4ZZ0PQbqlTSSJsGA27EVTpAxXyjyi6uQpPAcFjmdzCtxXITqUk8W1sR
8DGZ+w8SlJRzQk5ixBK+GSP7faFLuog9gAMvv4LlaQG0pGQG3WYtz8rZFuITCkR1
x0MIKZ808LG0skbVyzsV4LLbBXJ/XuP/7USUFJB7+hxl7Z3ckEx7lBsNTyDgTJc7
FcQmAsvbxjLpjR1/tlWced4oNJMbbw==
=8HkA
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--


--===============3347592142718179983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3347592142718179983==--
