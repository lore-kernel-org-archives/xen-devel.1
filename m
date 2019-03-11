From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v12] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Mon, 11 Mar 2019 12:57:43 +0100
Message-ID: <20190311125743.0f9493c1.olaf@aepfle.de>
References: <20190308192059.24610-1-olaf@aepfle.de>
 <5C863567020000780021D1FE@prv1-mh.provo.novell.com>
 <20190311114947.1d47e04e.olaf@aepfle.de>
 <5C864446020000780021D29A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1510247861262312008=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=y/+I=RO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h3JZ5-00078e-0B
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 11:57:55 +0000
In-Reply-To: <5C864446020000780021D29A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============1510247861262312008==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/BopfwUVtA9H6Ah5NzIInEG1"; protocol="application/pgp-signature"

--Sig_/BopfwUVtA9H6Ah5NzIInEG1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 11 Mar 2019 05:19:34 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> >>> On 11.03.19 at 11:49, <olaf@aepfle.de> wrote: =20
> > I do not see how the HVM domU clock can be without drift if it does not
> > sync with an external source. It seems xenlinux based PV drivers lack
> > a clocksource, so they would better run ntp. =20
> Yes indeed. But it still cannot be a requirement. There may be people
> wanting to fully isolate their systems.

They are free to isolate them. Still, there has to be a source to keep
time in sync. One of the involved dom0s can be declared as reference.
I'm not seeing how this change does affect the time within such domUs
in a significant way. Time will move forward at slightly different speed
when running on both hosts.

> Plus - is your change somehow limited to HVM guests? I can't seem to
> spot why that would be. And if it isn't, then leaving PV guests out of
> the discussion is simply wrong.

tsc_set_info exits early for non-HVM, so I think PV just does not have vtsc?

> Also I'm having trouble seeing how the connection to "drift" has come
> up all of the sudden. Your change is to deal with singular events
> (migration) aiui.

"drift" as in "TSC runs at different speed than reference clock"?
It is the migration/restore that enables emulation of TSC access.

> > Then the inaccuracy has to be handled, Xen can not know if cpu_khz is c=
orrect.
> > As said above, the observed range was 200, so this will be subtracted. =
=20
>=20
> This is what I consider wrong, because it results in
>=20
>    tmp (initial)	|   tmp (result)
>    198		|   198
>    199		|   199
>    200		|   0
>    201		|   1
>    ...
>    398		|   198
>    399		|   199
>    400		|   0
>    401		|   1

Why does it become 0 here?

=20
> I'd expect you to _cap_ at 200 instead. But of course the seemingly
> random 200 will itself need a much better reasoning, or at least a
> clear indication of the data base (number of different systems) that
> it was derived from. "Large number of hosts", after all, may mean 12
> to you and tens of thousands to me.

The formula reduces the calculated number by a constant. tmp would reach
zero on a 400MHz host. Assuming that still exists, the worst case is emulat=
ion
of TSC access. If the check would be (tmp > 200), tmp would become 1 khz
of difference. I think either '>' or '>=3D' would be fine on such system.


Olaf

--Sig_/BopfwUVtA9H6Ah5NzIInEG1
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIZNNwAKCRBdQqD6ppg2
fkceAKDtMdAorHBi/49FY5gR2j86fsTChQCfbNYGxii+wlUU1A9zPmhFaXOGFjo=
=8EdE
-----END PGP SIGNATURE-----

--Sig_/BopfwUVtA9H6Ah5NzIInEG1--


--===============1510247861262312008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1510247861262312008==--
