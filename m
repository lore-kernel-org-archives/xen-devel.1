From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] tools/kdd: silence gcc 8 warning a
 different way
Date: Tue, 22 May 2018 21:43:10 +0200
Message-ID: <20180522194310.GB1291@mail-itl>
References: <5ACF678102000078001BAA8E@prv1-mh.provo.novell.com>
 <20180522105436.hogfzpzo633vlnrl@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8896614401149603043=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dmmd=ij=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fLDBk-0006BH-RU
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 19:43:17 +0000
In-Reply-To: <20180522105436.hogfzpzo633vlnrl@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============8896614401149603043==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b3OyYALfe3DXUU4J"
Content-Disposition: inline


--b3OyYALfe3DXUU4J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2018 at 11:54:36AM +0100, Wei Liu wrote:
> I have tried to revert 437e00fea04becc91c1b6bc1c0baa636b067a5cc and
> reproduce the gcc 8.1 warning with Arch Linux's gcc 8.1 compiler.
> Strangely it doesn't complain.
>=20
> I haven't got a Fedora 28 around (which Marek used). It will take some
> time to set that up.

I've tried it again and it still fails, even on gcc 8.1 on Fedora 28.
Maybe that's about some extra CFLAGS in rpm build environment (there are
quite a few of them, including -fcf-protection -fstack-clash-protection
etc)?

Anyway, I'll send updated patch in a moment (instead of the revert).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--b3OyYALfe3DXUU4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlsEcs4ACgkQ24/THMrX
1yxSMAgAhSJ5yUt3mEBphSpt42qK2zrYMlirng8QS0nlyG+s75dfEu4tHSAnPFzV
mSyqbFu8kCAxzhnPG98kOL50NCJRrgSM+sJhwx4KRsyjNt8t+ta9GKef/Q7DD4nD
Sg7T836i2z6ppQL3UtCmH5oGd+HmfpQax5ObuWjQJDMxqB/mgqg28SKE9khFElb+
As2ZIdjPJ64kOAkYF9m7YASTAgXzU+09HukROG59DeNrJ1il8Df1wHlSQ5A995d1
jZFkw5wbbDjKZAneBoUINzzC6ZjuTDHSkHACIJZkOFHPsbXbDMQtQUKJkbbx+86j
w2ovo7UNv10o0OoyMQogid3hWyQbZg==
=uO/p
-----END PGP SIGNATURE-----

--b3OyYALfe3DXUU4J--


--===============8896614401149603043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8896614401149603043==--
