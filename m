From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Thu, 12 Apr 2018 15:15:05 +0200
Message-ID: <95725e3ecc825da13f9c0ab01ba74b11ed678d33.camel@suse.com>
References: <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de> <20180411150312.GL7177@aepfle.de>
 <20180411152745.GM7177@aepfle.de>
 <eb978b7160b9e2d54f56c088e0e7a24f1ec813c3.camel@suse.com>
 <20180411204359.GP7177@aepfle.de>
 <CAAWQectJz5nGbMQJMsgv2MVE4DRwAw5DOA+roT5TFadO06TTHg@mail.gmail.com>
 <862386BF-2092-428A-AE9E-766D109EF7DC@citrix.com>
 <b4e178344a2923404528bd0af07d583fc011b9ab.camel@suse.com>
 <20180412144553.74da01bc.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0111642023278671473=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180412144553.74da01bc.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============0111642023278671473==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-WsBpf8mHz9e897S2m3/R"


--=-WsBpf8mHz9e897S2m3/R
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-04-12 at 14:45 +0200, Olaf Hering wrote:
> Am Thu, 12 Apr 2018 12:16:34 +0200
> schrieb Dario Faggioli <dfaggioli@suse.com>:
>=20
> > Olaf, new patch. Please, remove _everything_ and apply _only_ this
> > one.
>=20
> dies after the first iteration.
>=20
>         BUG_ON(!test_bit(_VPF_migrating, &prev->pause_flags));
>=20
So, VPF_migrating is set, when we enter the if() and decide to call
vcpu_sleep_nosync() and vcpu_migrate(), but is not set here, once we
have taken the lock.

Interestingly, we did not hit BUG_ON(vcpu_runnable(prev)), right before
that...

Anyway, there is only once place where VPF_migrating is reset, and that
is in vcpu_migrate().

So, basing on our theory that we are running concurrently with
vcpu_set_affinity(), it's the call to vcpu_migrate() from
vcpu_set_affinity() that resets it.

I need to think a bit more (I'm trying to picture the exact scenario)
but as of now, it still does not make sense... As it looks to me that
now it is the call to vcpu_sleep_nosync(), also from
vcpu_set_affinity(), that should have removed prev from the runqueue.

True that vcpu_migrate() ends with vcpu_wake(), which put is back in a
runqueue, but then again the our vcpu_migrate(), here in
context_saved(), finding that VPF_migrate() is off, should *not* call
vcpu_move_locked().

This is getting insane (or I am)... :-O

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-WsBpf8mHz9e897S2m3/R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrPW9kACgkQFkJ4iaW4
c+5ZuxAAuCq6BPxO+oto3Ihikgy3uKok/8CSMhkRsjLXHfPkGYC1L3gotpK0Of43
1XNVjIjX0DG39nvTw+70phEaAdm2aDdg5fUzoyIHuK3yWm1dcMnTh6W3UQS5G4ZK
tJBcSyD/MRCysp4Z78wNvd0hGxCwE2RaVRelz+LqkSW+AYSisfrjIQ0ZM7h1Oq5O
ARijdiukpEngkJ2CXRcCyF+LasSJoE42BkzRuSuUUX1HRcuB1mZT1QjMcLYOLQkZ
MjZZkLSMF4kQSHQKQ5gQH6HxpkYHErPg6L+smpnHgusr6gnazFyiSisH/Ti3EBbc
L+xS38JCmBRJzvlws6Od7qWTG57KUoqJT4qH/1a19234Gs0lqPIZ5r+Gt2MdKDwp
GYKUmHV0yLptpZxHFPsexeQNDoqXexzSb7xHxREyqY2inSZ9fpIIBQjzQbcpSeA5
PoryPmvjBAJMXL+5WIZPStUVJLfTMLt5kn+t2w14IrSUSaLEMw2LLjTsq7Pc+/dm
ImDYN6I3aoh+OQXUNXh5GguPJkzJJbS965jq8HZz6awbi95BZ6RA+vS5Yvdi2Dr+
o/+DcbHC+420bZgEutDkg9S0VG/zr63s77mI604H6EP5cDImaXyMJBuF9UO+wb6H
bsBIezyL7d3yhjX5tQWo2XtJphTNK3ArnJYjOc7Ylns8v4ze7sw=
=JEs5
-----END PGP SIGNATURE-----

--=-WsBpf8mHz9e897S2m3/R--



--===============0111642023278671473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0111642023278671473==--
