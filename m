From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Thu, 12 Apr 2018 12:16:34 +0200
Message-ID: <b4e178344a2923404528bd0af07d583fc011b9ab.camel@suse.com>
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
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5309012113024670186=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <862386BF-2092-428A-AE9E-766D109EF7DC@citrix.com>
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


--===============5309012113024670186==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-kg/AO4W5sxO3TGDsn9uN"


--=-kg/AO4W5sxO3TGDsn9uN
Content-Type: multipart/mixed; boundary="=-Lep3HuHW3w3TUAahuFPa"


--=-Lep3HuHW3w3TUAahuFPa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-04-12 at 09:38 +0000, George Dunlap wrote:
> > On Apr 11, 2018, at 10:31 PM, Dario Faggioli <raistlin@linux.it>
> > wrote:
> > (XEN) Xen BUG at sched_credit.c:876
> > (XEN) ----[ Xen-4.11.20180410T125709.50f8ba84a5-
> > 7.bug1087289_411  x86_64  debug=3Dy   Not tainted ]----
> > (XEN) CPU:    108
> > (XEN) RIP:    e008:[<ffff82d080229ab4>]
> > sched_credit.c#csched_vcpu_migrate+0x27/0x54
> > (XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
> > ...
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d080229ab4>]
> > sched_credit.c#csched_vcpu_migrate+0x27/0x54
> > (XEN)    [<ffff82d080236348>] schedule.c#vcpu_move_locked+0xbb/0xc2
> > (XEN)    [<ffff82d08023764c>] schedule.c#vcpu_migrate+0x226/0x25b
> > (XEN)    [<ffff82d080239367>] context_saved+0x95/0x9c
> > (XEN)    [<ffff82d08027797d>] context_switch+0xe66/0xeb0
> > (XEN)    [<ffff82d080236943>] schedule.c#schedule+0x5f4/0x627
> > (XEN)    [<ffff82d080239f15>] softirq.c#__do_softirq+0x85/0x90
> > (XEN)    [<ffff82d080239f6a>] do_softirq+0x13/0x15
> > (XEN)    [<ffff82d08031f5db>] vmx_asm_do_vmentry+0x2b/0x30
> >=20
> > So, really *exactly* the same. Ok, thanks.
>=20
> But this doesn=E2=80=99t make any sense.  If you applied Dario=E2=80=99s =
=E2=80=98fix=E2=80=99 patch,
> then context_saved() should have *just* called vcpu_sleep_nosync()
> before calling vcpu_migrate().  The VPF_migrating flag should still
> be set, so it should have called csched_vcpu_sleep(); and sd->curr
> should have been changed to be !=3D prev way back in schedule(), so
> csched_vcpu_sleep() should have called runq_remove().
>=20
Well, you've just described me, banging my head on my desk, since
yesterday afternoon. :-P

> It=E2=80=99s probably worth asking the obvious question: Are you sure the
> =E2=80=9Cfix=E2=80=9D patch is actually applied (in addition to the new =
=E2=80=9Cdebug=E2=80=9D
> patch)? :-)
>=20
> If so, then maybe it=E2=80=99s time to open-code vcpu_sleep_nosync() ther=
e in
> context_saved(), to try to figure out where our understanding of what
> *should* happen is incorrect.
>=20
Ehm... Can you please stop reading my mind? It's annoying. :-D
Well, I guess we can say: "great minds think alike". :-P

Olaf, new patch. Please, remove _everything_ and apply _only_ this one.

As George is saying, the vcpu just can't be in the runqueue, unless:
 1) vcpu_sleep_nosync() did not remove it
 2) someone is putting it back there

Let's check 1 first.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-Lep3HuHW3w3TUAahuFPa
Content-Disposition: attachment; filename="context-save-race-debug.patch"
Content-Type: text/x-patch; name="context-save-race-debug.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMgYi94ZW4vY29tbW9uL3NjaGVk
X2NyZWRpdC5jCmluZGV4IDliYzYzOGMwOWMuLjY3NjI4YTFmOTUgMTAwNjQ0Ci0tLSBhL3hlbi9j
b21tb24vc2NoZWRfY3JlZGl0LmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYwpAQCAt
ODY3LDYgKzg2NywxNyBAQCBfY3NjaGVkX2NwdV9waWNrKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIg
Km9wcywgc3RydWN0IHZjcHUgKnZjLCBib29sX3QgY29tbWl0KQogICAgIHJldHVybiBjcHU7CiB9
CiAKK3N0YXRpYyB2b2lkCitjc2NoZWRfdmNwdV9taWdyYXRlKGNvbnN0IHN0cnVjdCBzY2hlZHVs
ZXIgKm9wcywgc3RydWN0IHZjcHUgKnZjLAorCQkgICAgdW5zaWduZWQgaW50IG5ld19jcHUpCit7
CisgICAgQlVHX09OKHZjLT5pc19ydW5uaW5nKTsKKyAgICBCVUdfT04odGVzdF9iaXQoX1ZQRl9t
aWdyYXRpbmcsICZ2Yy0+cGF1c2VfZmxhZ3MpKTsKKyAgICBCVUdfT04oQ1NDSEVEX1ZDUFUodmMp
ID09IENTQ0hFRF9WQ1BVKGN1cnJfb25fY3B1KHZjLT5wcm9jZXNzb3IpKSk7CisgICAgQlVHX09O
KF9fdmNwdV9vbl9ydW5xKENTQ0hFRF9WQ1BVKHZjKSkpOworICAgIHZjLT5wcm9jZXNzb3IgPSBu
ZXdfY3B1OworfQorCiBzdGF0aWMgaW50CiBjc2NoZWRfY3B1X3BpY2soY29uc3Qgc3RydWN0IHNj
aGVkdWxlciAqb3BzLCBzdHJ1Y3QgdmNwdSAqdmMpCiB7CkBAIC0yMjc4LDYgKzIyODksNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHNjaGVkdWxlciBzY2hlZF9jcmVkaXRfZGVmID0gewogICAgIC5h
ZGp1c3RfZ2xvYmFsICA9IGNzY2hlZF9zeXNfY250bCwKIAogICAgIC5waWNrX2NwdSAgICAgICA9
IGNzY2hlZF9jcHVfcGljaywKKyAgICAubWlncmF0ZSAgICAgICAgPSBjc2NoZWRfdmNwdV9taWdy
YXRlLAogICAgIC5kb19zY2hlZHVsZSAgICA9IGNzY2hlZF9zY2hlZHVsZSwKIAogICAgIC5kdW1w
X2NwdV9zdGF0ZSA9IGNzY2hlZF9kdW1wX3BjcHUsCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggMzQzYWI2MzA2ZS4uN2JlNjJl
ZmEzMyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24v
c2NoZWR1bGUuYwpAQCAtMTU1NCw3ICsxNTU0LDI5IEBAIHZvaWQgY29udGV4dF9zYXZlZChzdHJ1
Y3QgdmNwdSAqcHJldikKICAgICBTQ0hFRF9PUCh2Y3B1X3NjaGVkdWxlcihwcmV2KSwgY29udGV4
dF9zYXZlZCwgcHJldik7CiAKICAgICBpZiAoIHVubGlrZWx5KHByZXYtPnBhdXNlX2ZsYWdzICYg
VlBGX21pZ3JhdGluZykgKQorICAgIHsKKyAgICAgICAgLyoKKyAgICAgICAgICogSWYgc29tZW9u
ZSAoZS5nLiwgdmNwdV9zZXRfYWZmaW5pdHkoKSkgaGFzIHNldCBWUEZfbWlncmF0aW5nCisgICAg
ICAgICAqIG9uIHByZXYgaW4gYmV0d2VlbiB3aGVuIHNjaGVkdWxlKCkgcmVsZWFzZXMgdGhlIHNj
aGVkdWxlcgorICAgICAgICAgKiBsb2NrIGFuZCBoZXJlLCB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB3
ZSBwcm9wZXJseSBtYXJrIHRoZQorICAgICAgICAgKiB2Y3B1IGFzIG5vdCBydW5uYWJsZSAoYW5k
IGFsbCBpdCBjb21lcyB3aXRoIHRoYXQpLCB3aXRoCisgICAgICAgICAqIHZjcHVfc2xlZXBfbm9z
eW5jKCksIGJlZm9yZSBjYWxsaW5nIHZjcHVfbWlncmF0ZSgpLgorICAgICAgICAgKi8KKyAgICAg
ICAgLy92Y3B1X3NsZWVwX25vc3luYyhwcmV2KTsKKyAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFn
czsKKyAgICAgICAgc3BpbmxvY2tfdCAqbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnFzYXZl
KHByZXYsICZmbGFncyk7CisKKyAgICAgICAgQlVHX09OKHZjcHVfcnVubmFibGUocHJldikpOwor
ICAgICAgICBCVUdfT04oIXRlc3RfYml0KF9WUEZfbWlncmF0aW5nLCAmcHJldi0+cGF1c2VfZmxh
Z3MpKTsKKyAgICAgICAgaWYgKCBwcmV2LT5ydW5zdGF0ZS5zdGF0ZSA9PSBSVU5TVEFURV9ydW5u
YWJsZSApCisgICAgICAgICAgICB2Y3B1X3J1bnN0YXRlX2NoYW5nZShwcmV2LCBSVU5TVEFURV9v
ZmZsaW5lLCBOT1coKSk7CisgICAgICAgIEJVR19PTihjdXJyX29uX2NwdShwcmV2LT5wcm9jZXNz
b3IpID09IHByZXYpOworICAgICAgICBTQ0hFRF9PUCh2Y3B1X3NjaGVkdWxlcihwcmV2KSwgc2xl
ZXAsIHByZXYpOworCisgICAgICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9j
aywgZmxhZ3MsIHByZXYpOworCiAgICAgICAgIHZjcHVfbWlncmF0ZShwcmV2KTsKKyAgICB9CiB9
CiAKIC8qIFRoZSBzY2hlZHVsZXIgdGltZXI6IGZvcmNlIGEgcnVuIHRocm91Z2ggdGhlIHNjaGVk
dWxlciAqLwo=


--=-Lep3HuHW3w3TUAahuFPa--

--=-kg/AO4W5sxO3TGDsn9uN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrPMgMACgkQFkJ4iaW4
c+4T6RAAkz+jGFQ5jqcEXj6kP4FiM3lxwGfDu3jP/HtNUS8lZRSIZ+Wy6SMVs8xn
+mKuoV33U6smWcePxBn1T1XMNxohGJ3GVmZ38yZEouz8ObyoSDwNhsuLTHAs4yyC
Zu/53temXSdrvZvwZ3pgpw9r4ugfB3r4tDOHQXZGrYdzNiEDTOH1+m5VyS36LRKi
fC8MLM/EK1B9nEw7AqNHmYqIpDaXTfd9cwqwuDTGVxcrRgrm0WTOkhAuuB+W8EnO
Uwr0K+NibmiNBnJmUpBsKPPCdtb9xuY9r7IobYFnhP9wDk0edLHGR5VKwNSD7qzW
r+oZV9SVzV9YtRtUYtbUfmHFefqXaLWJ3Ys7z3t5rqkfAWaiGy/lI7FDhMEKxOlR
u0g1fjH11BeGMrfJ4WKW8vr/e9Lr/uzmI2wZZr6YJUtf/Vonv+4S4RDBrtEtUZwg
bcA4rvKPaRlmP8SKc+jDpG0mJi0seW+qHkPSKHjb92xBCTWVnOL1ZZbBjDCx5dg3
DG+x3pyJDukjLTjnwA9ZMJ8jCmaBejDu5u1rQCtTRX2+2LLC4m0OdNZvrZ3dfPa5
ZQV+61JbxmLBamjrv2lheVlgQCYgHmpuud59LmbgxOclxUoth8U1ef72eOXclFI6
dg1nu8IUkLR1RSUeROA68BSQS0JKBYQHT6oXMwJBZik1cZn/FQE=
=3RpA
-----END PGP SIGNATURE-----

--=-kg/AO4W5sxO3TGDsn9uN--



--===============5309012113024670186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5309012113024670186==--
