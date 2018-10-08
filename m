From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: Backports to stable
Date: Mon, 8 Oct 2018 12:40:28 +0200
Message-ID: <20181008104028.GA1645@mail-itl>
References: <20181007010433.GB2975@mail-itl>
 <5BBB236202000078001EF6EC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1040022101872884264=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mvst=mu=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1g9Sxm-00064f-Je
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 10:40:34 +0000
In-Reply-To: <5BBB236202000078001EF6EC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============1040022101872884264==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 08, 2018 at 03:29:06AM -0600, Jan Beulich wrote:
> >>> On 07.10.18 at 03:04, <marmarek@invisiblethingslab.com> wrote:
> > I'd like to propose backporting GCC7/8 fixes to all stable branches. Be=
low
> > is a list up to stable-4.6, but some of the patches are already on
> > select branches (developed during that release cycle, or already
> > backported).
>=20
> I continue to be opposed to backporting anything that is not needed
> for dealing security issues to branches which are in security-support-
> only mode, i.e. anything older than 4.8 at this point in time.

Ok, noted. It's hard to compile those still security-supported versions
on recent systems. But if one need such combination (old Xen + new other
things), then can also apply those patches locally. I just wanted to
reduce work duplication.

> Furthermore I notice that 4.6 has just moved out of security support,
> at the end of last week.

Hmm, 18+18 months from October 13, 2015 is at the end of this week.

> >     e0a97098e2 x86: fix section type mismatch in mm.c
>=20
> This describes itself as a Clang fix - has it become relevant for
> gcc now too?

Yes, for gcc 8.1 at least.

> Anyway - this has been in even the original 4.7.0,
> so as per above not a candidate for any actively maintained
> branch.
>=20
> >     # This one doesn't apply cleanly, because acpi stuff moved
> >     # tools/firmware/hvmloader/acpi -> tools/acpi
> >     858dbaaeda libacpi: fixes for iasl >=3D 20180427
>=20
> Iirc I've applied this back to 4.8 already, and quite some time ago.

Yes, this one is missing only in 4.7 and 4.6.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlu7NBwACgkQ24/THMrX
1ywDrAf+NuxJQIWuolOiPch7rKWmwh1lSh37XaMuKSwvS+ODIHtw29W3ywsEa4hx
xL6avgrNCYahd73xRMACvkYYkCYRcBeQGhV44xaPGV3BJc20IlXqB8qJsjCg8480
oTWrQmS0fwLnwIexe0Mh8UcTMGbWLlgl5GxobrJIi8xp+1DVKcqQy7WrnjzJob43
wotc5/20J0+yvm62zrHYKPXFXQvJ8naa0XkxpvCkcw7sqnxzHYbh3HF+DBXOELEz
liC7291JjTEWPyae6513aHrqZpwhi12AT/nPs46aFeCB9wqYV2ZQijxsyFYFyGsF
fcJyrhewLan60GAjp6XAdSL0Mc48zA==
=veGC
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--


--===============1040022101872884264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1040022101872884264==--
