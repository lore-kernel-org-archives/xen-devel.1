From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 19:20:51 +0200
Message-ID: <eb978b7160b9e2d54f56c088e0e7a24f1ec813c3.camel@suse.com>
References: <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de> <20180411150312.GL7177@aepfle.de>
 <20180411152745.GM7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7119735853345064123=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180411152745.GM7177@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============7119735853345064123==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-z08VNLhrqNgRiRM7a+tO"


--=-z08VNLhrqNgRiRM7a+tO
Content-Type: multipart/mixed; boundary="=-F3sek2NVYaC4wcXMySBn"


--=-F3sek2NVYaC4wcXMySBn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 17:27 +0200, Olaf Hering wrote:
> On Wed, Apr 11, Olaf Hering wrote:
>=20
> > That was with sched=3Dcredit2, sorry for that.
> > Now with just that second patch ...
>=20
> Still BUG in csched_load_balance.
>=20
> (XEN) Xen BUG at sched_credit.c:1694
> (XEN) ----[ Xen-4.11.20180410T125709.50f8ba84a5-
> 6.bug1087289_411  x86_64  debug=3Dy   Not tainted ]----
> (XEN) CPU:    135
> (XEN) RIP:    e008:[<ffff82d08022ae34>]
> sched_credit.c#csched_schedule+0x44a/0xd42
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d08022ae34>]
> sched_credit.c#csched_schedule+0x44a/0xd42
> (XEN)    [<ffff82d080236406>] schedule.c#schedule+0x107/0x627
> (XEN)    [<ffff82d080239ec5>] softirq.c#__do_softirq+0x85/0x90
> (XEN)    [<ffff82d080239f1a>] do_softirq+0x13/0x15
> (XEN)    [<ffff82d0802738f0>] domain.c#idle_loop+0xac/0xbe
>=20
Ok, back to square 1. :-/

A data point is that Credit2 works. In Credit2, vcpu_move_locked()
(called by vcpu_migrate()) calls a function called migrate() which
--because of Credit2 specific reasons-- consider legit the fact that it
finds the vcpu in a runqueue... So that's what I think "save" us, and
that is why this data point does not help much (sorry Olaf for not
realizing this earlier, and asking you to try Credit2). :-(

On the other hand, in Credit1, there should be no good reason why
vcpu_migrate() would be called on a vcpu which is on a runqueue, and
the fact that we're still crashing proves that there is at least
another race, causing that to happen.

So, the debug patch I posted previously in this thread, was wrong. I'm
attaching a new one to this email. Olaf, if you're trying again, please
do it with both, the "fix" (xen-sched-debug-vcpumigrate-race.patch),
and this one.

Debug hypervisor, as usual, if possible. :-)

It will crash, again, possibly with the same stack trace, but I think
it's worth a try.

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-F3sek2NVYaC4wcXMySBn
Content-Disposition: attachment; filename="csched_migrate_debug.patch"
Content-Type: text/x-patch; name="csched_migrate_debug.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

Y29tbWl0IDVmYjdhZDhkMTIyMDEwMWU2OWE4NzAxNGQ1YTQ4NWQxOWFlYTk5MTcKQXV0aG9yOiBE
YXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgpEYXRlOiAgIFdlZCBBcHIgMTEgMDk6
MDQ6MzMgMjAxOCArMDIwMAoKICAgIHhlbjogY3JlZGl0OiBpbXBsZW1lbnQgU0NIRURfT1AobWln
cmF0ZSkKICAgIAogICAgd2l0aCBqdXN0IHNhbml0eSBjaGVja2luZyBpbiBpdCwgdG8gY2F0Y2gg
YSByYWNlLgogICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xp
QHN1c2UuY29tPgoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMgYi94ZW4v
Y29tbW9uL3NjaGVkX2NyZWRpdC5jCmluZGV4IDliYzYzOGMwOWMuLjdhOTA5Mzc2ZTYgMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9j
cmVkaXQuYwpAQCAtODY3LDYgKzg2NywxNyBAQCBfY3NjaGVkX2NwdV9waWNrKGNvbnN0IHN0cnVj
dCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHZjcHUgKnZjLCBib29sX3QgY29tbWl0KQogICAgIHJl
dHVybiBjcHU7CiB9CiAKK3N0YXRpYyB2b2lkCitjc2NoZWRfdmNwdV9taWdyYXRlKGNvbnN0IHN0
cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHZjcHUgKnZjLAorCQkgICAgdW5zaWduZWQgaW50
IG5ld19jcHUpCit7CisgICAgQlVHX09OKHZjLT5pc19ydW5uaW5nKTsKKyAgICBCVUdfT04odGVz
dF9iaXQoX1ZQRl9taWdyYXRpbmcsICZ2Yy0+cGF1c2VfZmxhZ3MpKTsKKyAgICBCVUdfT04oX192
Y3B1X29uX3J1bnEoQ1NDSEVEX1ZDUFUodmMpKSk7CisgICAgQlVHX09OKENTQ0hFRF9WQ1BVKHZj
KSA9PSBDU0NIRURfVkNQVShjdXJyX29uX2NwdSh2Yy0+cHJvY2Vzc29yKSkpOworICAgIHZjLT5w
cm9jZXNzb3IgPSBuZXdfY3B1OworfQorCiBzdGF0aWMgaW50CiBjc2NoZWRfY3B1X3BpY2soY29u
c3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3QgdmNwdSAqdmMpCiB7CkBAIC0yMjc4LDYg
KzIyODksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNjaGVkdWxlciBzY2hlZF9jcmVkaXRfZGVm
ID0gewogICAgIC5hZGp1c3RfZ2xvYmFsICA9IGNzY2hlZF9zeXNfY250bCwKIAogICAgIC5waWNr
X2NwdSAgICAgICA9IGNzY2hlZF9jcHVfcGljaywKKyAgICAubWlncmF0ZSAgICAgICAgPSBjc2No
ZWRfdmNwdV9taWdyYXRlLAogICAgIC5kb19zY2hlZHVsZSAgICA9IGNzY2hlZF9zY2hlZHVsZSwK
IAogICAgIC5kdW1wX2NwdV9zdGF0ZSA9IGNzY2hlZF9kdW1wX3BjcHUsCg==


--=-F3sek2NVYaC4wcXMySBn--

--=-z08VNLhrqNgRiRM7a+tO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrOQ/MACgkQFkJ4iaW4
c+6T1xAAoAWtdcAF3iNCw+L6O1gcQ4/EgS3GwbWtXr1g7BIT/royBqM3sSklKcih
TUM6NQL2uVGp3lxUPeZJrCyKYmKG0cb0wz3liSjQNsLKEqWV2LFfLb5JHomtFE64
o9gR8wUfYtB6V4pq0qveW6IK4XBtjLvADu72x+czM0HcUQOpBvk8S5UjhetmEUBQ
WcENsp99Dq/YEZBAVqqP51GdL0nX9NbhXQ5L00J7zfdeb1cOnqWePNda+GEEFxJA
7vZ5Q9k91r3IY/jqlkaFXFs4RR3azH1vnRvF6TDbsbXaHsEUbEMJgMMYQ1iPmAtt
PMw7yweNLFSJw8cERI7xxE/wAWWbg4LEfTUGxxX7WEMlCtOGRhfgw/AqwOTI/oZj
pn7ms4B+HRj2kSoLUwzt+0NbanZKRK0g0T4qhmTDVWC81avzFW+6aDJzNjMxWkOY
BK/cPkyOI3GOuiAe2rC4+hWlZULrPl/xMwbTwvDfMNGKUEz7j3q3TOPF224uQHpl
rFXWtDS/MNf5FAawlyxkRlPwnUkE0q3xrCcOgv9M824xWH2bbIawPa7TeNhXeo3I
UTFym/TY/LPjMRV4LjQ0HJtFZFbHJHF2xv9twLaco4LqSyi5lESCp/zGiBh5mQ4v
aO8K5EXZB+BuV4IVy8ldkz+WCz57XpI8TJWeT2iLgu2Hh3orLzo=
=aZam
-----END PGP SIGNATURE-----

--=-z08VNLhrqNgRiRM7a+tO--



--===============7119735853345064123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7119735853345064123==--
