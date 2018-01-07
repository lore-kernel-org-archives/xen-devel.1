From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Sun, 7 Jan 2018 16:00:29 +0100
Message-ID: <20180107150029.GA2935@mail-itl>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
 <888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com>
 <edec8de6-c678-2aa1-5c50-97533c14f8f6@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4441044517879815109=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=hfgf=ec=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1eYCRc-0005WI-Ts
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 15:01:05 +0000
In-Reply-To: <edec8de6-c678-2aa1-5c50-97533c14f8f6@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Lars Kurth <lars.kurth.xen@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Rich Persaud <persaur@gmail.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============4441044517879815109==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2018 at 07:05:56PM +0000, Andrew Cooper wrote:
> On 05/01/18 18:16, Rich Persaud wrote:
> >> On Jan 5, 2018, at 06:35, Lars Kurth <lars.kurth.xen@gmail.com
> >> <mailto:lars.kurth.xen@gmail.com>> wrote:
> >> Linux=E2=80=99s KPTI series is designed to address SP3 only. =C2=A0For=
 Xen guests,
> >> only 64-bit PV guests are affected by SP3. A KPTI-like approach was
> >> explored initially, but required significant ABI changes. =C2=A0

Is some partial KPTI-like approach feasible? Like unmapping memory owned
by other guests, but keeping Xen areas mapped? This will still allow
leaking Xen memory, but there are very few secrets there (vCPUs state,
anything else?), so overall impact will be much lower.

> >> Instead
> >> we=E2=80=99ve decided to go with an alternate approach, which is less
> >> disruptive and less complex to implement. The chosen approach runs PV
> >> guests in a PVH container, which ensures that PV guests continue to
> >> behave as before, while providing the isolation that protects the
> >> hypervisor from SP3. This works well for Xen 4.8 to Xen 4.10, which
> >> is currently our priority.

There is one drawback of such approach: running PV will now require a
CPU with VT-x (or equivalent). I think this is a huge problem, ruining
the most important (or maybe the only, nowadays) advantage of PV versus
PVH or HVM.

> > Since PVH does not yet support PCI passthrough, are there other
> > recommended SP3 mitigations for 64-bit PV driver domains?
>=20
> Lock them down?=C2=A0 Device driver domains, even if not fully trusted, a=
re
> going to be part of the system and therefore at least semi-TCB.
>=20
> If an attacker can't run code in your driver domain (and be aware of
> things like server side processing, JIT of SQL, etc as "running code"
> methods), they aren't in a position to mount an SP3 attack.

Well, the main reason why driver domains are used in Qubes OS is
assumption that it is not possible to really "lock them down", given
full OS (Linux) running inside and being exposed to the outside world
(having network adapters, USB controllers etc). There are so many
components running them, that for sure some of them are buggy. Just some
examples exploitable in the near past: DHCP client, Bluetooth stack.

If we'd believe that handling those devices exposed to the outside world
is "safe", we wouldn't use driver domains at all...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlpSNg0ACgkQ24/THMrX
1yx1SAf/UrWYTUopfOsmQrwtEV/UkMjwGkfE/hiDTqxRd3mbkVDj8aeJnPhqks6E
SNsFq2eja/FmlpvfOxoWospvhF2TZ/GAfWzsvOaClWVDY5i0sFwUSPuD0Zzt4Oze
bIDIVQuO69oisJuzVuF6EjQELmoFWgCXFUdFvhOuIkoL2Qie9XyvF0wjLrKGwq4u
4K4C8hoJnyMX90NPO+SjaOeW+kvXkMZPRjjQetZLTZGJfjHVHZzrcdoxOfOMdWLx
SMQcAZlSlgA719QG15RtW+6eSmzg5Uqwv6R8551od5jRqp4YsqcDll/RiCTlwnIh
W3cytXI3pmgePgAlXjMGdV+BwS4g+Q==
=IiYE
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--


--===============4441044517879815109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4441044517879815109==--
