From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Fri, 13 Apr 2018 11:25:42 +0200
Message-ID: <4533b7d93e3249dad4f830cea2c27d3e3088e9b6.camel@suse.com>
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
 <95725e3ecc825da13f9c0ab01ba74b11ed678d33.camel@suse.com>
 <a6057cd8eadc20b04797a4a8fc9cb5570d44544d.camel@suse.com>
 <6b119ba762dbad0c1949bf814694ffbfd39d16c4.camel@suse.com>
 <070DC511-31E1-4C0C-BFD0-C49590FDE54B@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7041709634677879606=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <070DC511-31E1-4C0C-BFD0-C49590FDE54B@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============7041709634677879606==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RsUAtbQsMmkU9+MXOlqg"


--=-RsUAtbQsMmkU9+MXOlqg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-04-13 at 09:03 +0000, George Dunlap wrote:
> > On Apr 12, 2018, at 6:25 PM, Dario Faggioli <dfaggioli@suse.com>
> > wrote:
> >=20
> I think the bottom line is, for this test to be valid, then at this
> point test_bit(VPF_migrating) *must* imply !vcpu_on_runqueue(v), but
> at this point it doesn=E2=80=99t: If someone else has come by and cleared=
 the
> bit, done migration, and woken it up, and then someone *else* set the
> bit again without taking it off the runqueue, it may still be on the
> runqueue.
>=20
> My series which calls vcpu_sleep_nosync_locked() after setting
> VPF_migrating should help with this.
>=20
Yes. In fact, Olaf, I still think that doing a run with George's RFC
applied, would be useful, if only as a data point.

> Or, alternately, instead of baking all this implicit  knowledge about
> credit into the scheduler, we should just implement
> credit_vcpu_migrate(), and have it remove it from one runqueue and
> put it on another.
>=20
But it's not really "baking Credit implicit knowledge", IMO. It is that
we have an invariant which we are failing to enforce.

That's why your series goes in the right direction, because by calling
sleep() in the same critical section of where the bit is set, it
improves how we enforce the invariant.

Implementing a csched_vcpu_migrate(), looks to me like "relaxing" the
invariant, which is right the opposite direction. :-)

We may well decide to _get_rid_ of the invariant, but I'm not sure that
implementing csched_vcpu_migrate() would be all that this takes and, in
general, I don't think that something like this:
 - is an approapriate thing to do at this point of 4.11 cycle;
 - will be easy to backport (while, despite the look of it,=20
   backporting patch 1 and 2 of your series might not be too terrible).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-RsUAtbQsMmkU9+MXOlqg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrQd5YACgkQFkJ4iaW4
c+7SPxAA0wShHXLPEhL3/MUR6PzOtG+i7SOSdieufSuEMC75EhK42igCQx0Gczlp
ZBeHZRHGGJPTWZ/PqDSCira9kkY+FHRQRTC8vf6DxR8ohaq/euCjuKBZm9V+5cbl
kFYdwZx9MIEVf6jCdIaI4gJx+nB54Wc3vTXzjGoMoSPm8rh6u9uVnF2kNvyt8t1z
Mkl9rKDnLGHEgCzABvMyyclfKEeXXINm8Nwac1hzKYIGOXAuMdwnrff3d3GhRoO5
IesA3dhESZiI6QZzlh/nObNRwhwto2wbn7Omu/S5V3Vhjapezqlff6vxd2wiCFKT
zHVBuv6SZkZY9xrFfiDh6PrPTTwSnw7X7D1cHEq9utD4Zzw8K3H0ozVRu9ltCDuA
BnW+o29joEm2Gmt7L8E/ikREjvMEyT54sBXfHKqVRV4o8bG6ljRJgsJvTy8KcElB
TEMRLM8pu0hQDKuXrCjJTGVd7GhUdCYT0Yj6BY6RHNQVOgUIBZD2joOUGHhVbpqF
QqOfiDoDr2JPCmK5mYCzUryKTeomaMm/o6v13e0GbkeWHkHoj6I5mga+xarldZd3
j2SzVP4mhceYKHPcQCS/jqD8Me11udGJ+NBiBiyKrdcm/8ZB1PZtzovisjXEG6Vj
AEVd787WZAU3EVmC3WADYHF4A64JIpnXUYMlqhsHHx7gFWPp1Bo=
=q9c3
-----END PGP SIGNATURE-----

--=-RsUAtbQsMmkU9+MXOlqg--



--===============7041709634677879606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7041709634677879606==--
