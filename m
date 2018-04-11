From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 09:31:02 +0200
Message-ID: <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
References: <20180410085729.GA472@aepfle.de>
 <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6260432990784158181=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
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


--===============6260432990784158181==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bCzr7npDWFsxXIN0e9af"


--=-bCzr7npDWFsxXIN0e9af
Content-Type: multipart/mixed; boundary="=-lJQrt3KuG8BKabb01sfp"


--=-lJQrt3KuG8BKabb01sfp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 00:59 +0200, Dario Faggioli wrote:
> [Adding Andrew, not because I expect anything, but just because
> we've chatted about this issue on IRC :-) ]
>=20
Except, I did not add it. :-P

Anyway...

> On Tue, 2018-04-10 at 22:37 +0200, Olaf Hering wrote:
> > On Tue, Apr 10, Dario Faggioli wrote:
> >=20
> >     BUG_ON(__vcpu_on_runq(CSCHED_VCPU(vc)));
> >=20
... patch attached.

Olaf, can you give it a try? It should be fine to run it on top of the
last debug patch (the one that produced this crash).

Regards,
Dario

> > (XEN) Xen BUG at sched_credit.c:876
> > (XEN) ----[ Xen-4.11.20180410T125709.50f8ba84a5-
> > 3.bug1087289_411  x86_64  debug=3Dy   Not tainted ]----
> > (XEN) CPU:    118
> > (XEN) RIP:    e008:[<ffff82d080229ab4>]
> > sched_credit.c#csched_vcpu_migrate+0x27/0x51
> > ...
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d080229ab4>]
> > sched_credit.c#csched_vcpu_migrate+0x27/0x51
> > (XEN)    [<ffff82d080236348>] schedule.c#vcpu_move_locked+0xbb/0xc2
> > (XEN)    [<ffff82d08023764c>] schedule.c#vcpu_migrate+0x226/0x25b
> > (XEN)    [<ffff82d08023935f>] context_saved+0x8d/0x94
> > (XEN)    [<ffff82d08027797d>] context_switch+0xe66/0xeb0
> > (XEN)    [<ffff82d080236943>] schedule.c#schedule+0x5f4/0x627
> > (XEN)    [<ffff82d080239f15>] softirq.c#__do_softirq+0x85/0x90
> > (XEN)    [<ffff82d080239f6a>] do_softirq+0x13/0x15
> > (XEN)    [<ffff82d08031f5db>] vmx_asm_do_vmentry+0x2b/0x30
> >=20
>=20
> Hey... unless I've really put there a totally bogous BUG_ON(), this
> looks interesting and potentially useful.
>=20
> It says that the vcpu which is being context switched out, and on
> which
> we are calling vcpu_migrate() on, because we found it to be
> VPF_migrating, is actually in the runqueue already when we actually
> get
> to execute vcpu_migrate()->vcpu_move_locked().
>=20
> Mmm... let's see.
>=20
>  CPU A                                  CPU B
>  .                                      .
>  schedule(current =3D=3D v)                 vcpu_set_affinity(v)
>   prev =3D current     // =3D=3D v             .
>   schedule_lock(CPU A)                   .
>    csched_schedule()                     schedule_lock(CPU A)
>    if (runnable(v))  //YES               x
>     runq_insert(v)                       x
>    return next !=3D v                      x
>   schedule_unlock(CPU A)                 x // takes the lock
>   context_switch(prev,next)              set_bit(v,
> VPF_migrating)  [*]
>    context_saved(prev) // still =3D=3D v     .
>     v->is_running =3D 0                    schedule_unlock(CPU A)
>     SMP_MB                               .
>     if (test_bit(v, VPF_migrating)) // YES!!
>      vcpu_migrate(v)                     .
>       for {                              .
>        schedule_lock(CPU A)              .
>        SCHED_OP(v, pick_cpu)             .
>         set_bit(v, CSCHED_MIGRATING)     .
>         return CPU C                     .
>        pick_called =3D 1                   .
>        schedule_unlock(CPU A)            .
>        schedule_lock(CPU A + CPU C)      .
>        if (pick_called && ...) // YES    .
>         break                            .
>       }                                  .
>       // v->is_running is 0              .
>       //!test_and_clear(v, VPF_migrating)) is false!!
>       clear_bit(v, VPF_migrating)        .
>       vcpu_move_locked(v, CPU C)         .
>       BUG_ON(__vcpu_on_runq(v))          .
>=20
> [*] after this point, and until someone manages to call
> vcpu_sleep(), =20
>       v sits in CPU A's runqueue with the VPF_migrating pause flag
> set
>=20
> So, basically, the race is between context_saved() and
> vcpu_set_affinity(). Basically, vcpu_set_affinity() sets the
> VPF_migrating pause flags on a vcpu in a runqueue, with the intent of
> letting either a vcpu_sleep_nosync() or a reschedule remove it from
> there, but context_saved() manage to see the flag, before the removal
> can happen.
>=20
> And I think this explains also the original BUG at
> sched_credit.c:1694
> (it's just a bit more involved).
>=20
> As it can be seen above (and also in the code comment in ) there is a
> barrier (which further testify that this is indeed a tricky passage),
> but I guess it is not that effective! :-/
>=20
> TBH, I have actually never fully understood what that comment really
> meant, what the barrier was protecting, and how... e.g., isn't it
> missing its paired one? In fact, there's another comment, clearly
> related, right in vcpu_set_affinity(). But again I'm a bit at loss at
> properly figuring out what the big idea is.
>=20
> George, what do you think? Does this make sense?
>=20
> Well, I'll think more about this, and to a possible fix, tomorrow
> morning.
>=20
> Regards,
> Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-lJQrt3KuG8BKabb01sfp
Content-Disposition: attachment; filename="xen-sched-debug-vcpumigrate-race.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="xen-sched-debug-vcpumigrate-race.patch";
	charset="UTF-8"

Y29tbWl0IDRkMDUyZWQyY2I5NWRjNjlmNDVkYTY3NzJiODA1ZjhlNWJlYjY1NGIKQXV0aG9yOiBE
YXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgpEYXRlOiAgIFdlZCBBcHIgMTEgMDk6
MDM6MTkgMjAxOCArMDIwMAoKICAgIHhlbjogc2NoZWQ6IGZpeCByYWNlIGJldHdlZW4gY29udGV4
dCBzd2l0Y2ggYW5kIHNldHRpbmcgYWZmaW5pdHkKICAgIAogICAgdmNwdV9zZXRfYWZmaW5pdHko
KSBtYXkgc2V0IHRoZSBWUEZfbWlncmF0aW5nIGZsYWcgb24KICAgIHRoZSB2Y3B1IHRoYXQgaXMg
YmVpbmcgY29udGV4dCBzd2l0Y2hlZCBvdXQsIHdpdGhvdXQKICAgIGhhdmluZyB0aGUgY2hhbmNl
IHRvIGFsc28gY2FsbCB2Y3B1X3NsZWVwX25vc3luYygpIG9uCiAgICBpdCwgYmVmb3JlIHRoYXQg
Y29udGV4dCBzd2l0Y2hpbmcgY29kZSAoaW4gY29udGV4dF9zYXZlZCgpKQogICAgY2FsbHMgdmNw
dV9taWdyYXRlKCkuCiAgICAKICAgIFRoaXMsIGV2ZW50dWFsbHksIHJlc3VsdHMgaW4gdmNwdV9t
b3ZlX2xvY2tlZCgpIGJlaW5nCiAgICBjYWxsZWQgb24gYSBydW5uYWJsZSB2Y3B1LCB3aGljaCBj
YXVzZXMgdmFyaW91cyBpc3N1ZXMKICAgIGluIHNjaGVkX2NyZWRpdC5jLCBzY2hlZF9jcmVkaXQy
LmMsIGV0Yy4KICAgIAogICAgRm9yIGluc3RhbmNlLCB3aGVuIHVzaW5nIENyZWRpdCwgaXQgbGVh
ZHMgdG8gdGhpcyBjcmFzaDoKICAgIAogICAgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA0L21zZzAwNjY0Lmh0bWwKICAgIAogICAgU2ln
bmVkLW9mZi1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KICAgIC0tLQog
ICAgQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KICAgIENjOiBP
bGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+CiAgICBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMg
Yi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggMzQzYWI2MzA2ZS4uMmE2MDMwMTg0OSAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUu
YwpAQCAtMTU1NCw3ICsxNTU0LDE3IEBAIHZvaWQgY29udGV4dF9zYXZlZChzdHJ1Y3QgdmNwdSAq
cHJldikKICAgICBTQ0hFRF9PUCh2Y3B1X3NjaGVkdWxlcihwcmV2KSwgY29udGV4dF9zYXZlZCwg
cHJldik7CiAKICAgICBpZiAoIHVubGlrZWx5KHByZXYtPnBhdXNlX2ZsYWdzICYgVlBGX21pZ3Jh
dGluZykgKQorICAgIHsKKyAgICAgICAgLyoKKyAgICAgICAgICogSWYgc29tZW9uZSAoZS5nLiwg
dmNwdV9zZXRfYWZmaW5pdHkoKSkgaGFzIHNldCBWUEZfbWlncmF0aW5nCisgICAgICAgICAqIG9u
IHByZXYgaW4gYmV0d2VlbiB3aGVuIHNjaGVkdWxlKCkgcmVsZWFzZXMgdGhlIHNjaGVkdWxlcgor
ICAgICAgICAgKiBsb2NrIGFuZCBoZXJlLCB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB3ZSBwcm9wZXJs
eSBtYXJrIHRoZQorICAgICAgICAgKiB2Y3B1IGFzIG5vdCBydW5uYWJsZSAoYW5kIGFsbCBpdCBj
b21lcyB3aXRoIHRoYXQpLCB3aXRoCisgICAgICAgICAqIHZjcHVfc2xlZXBfbm9zeW5jKCksIGJl
Zm9yZSBjYWxsaW5nIHZjcHVfbWlncmF0ZSgpLgorICAgICAgICAgKi8KKyAgICAgICAgdmNwdV9z
bGVlcF9ub3N5bmMocHJldik7CiAgICAgICAgIHZjcHVfbWlncmF0ZShwcmV2KTsKKyAgICB9CiB9
CiAKIC8qIFRoZSBzY2hlZHVsZXIgdGltZXI6IGZvcmNlIGEgcnVuIHRocm91Z2ggdGhlIHNjaGVk
dWxlciAqLwo=


--=-lJQrt3KuG8BKabb01sfp--

--=-bCzr7npDWFsxXIN0e9af
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrNubYACgkQFkJ4iaW4
c+4M3RAA558fz4X73W8QCGOwBqN7F2XiJEVTEuokZqJ6NfAnsZHc/RkONthtVrcV
BgOgTMA+tkssRm+hsWMGVrCi0xDaypZwnQvStgZqRGQk35gDsT2x11W+gkhwkyEn
GtDgFo5wbaiNO/EEWLRSO+wB8aHktdkIJpqUT2fD1Z1dByMt9/W6z6nVhCXtQ/4A
oepqPmKzn4D2t3lNiCfoR3sqB6SO+onk02Vde0BWq3gBeiY6EF/m7rbRAThLo0YE
S94G0NmTxgLfzKIUqtHLThC8ocErayPahDoQpgB78MOzDBh2nNGo/xs+lv9xnDZM
OijL1t4rQBahr5pJj3Y6VCEOwTmfCKgWX0Nwb6LD/oabhXmJUuh/kEc4staKaD1r
1l25TJiYZhxNbT7g4wp4oR9UE4flyn+5l9dahjUNRAveiygCFDzpQzA5p217shAm
fuhe11i5MY3/eCONhK7j3eVtWaGy29vChGbJ6qnjBqBcm3GXS4UbHu1U6V8Wos28
FZqSGQKKmKPRKZcHdR20AVJdsML+UfDxhBHAMbkv58PFuakgsTu8nrieensrs6Gd
f25wCWYmJDKyKlc7vb6XYiCZtXcgMoQ8M/KOLfw4iWY3aJhPvZR27+yXhixWIgBp
6r+NUpUgA8pSAfbE5ClXBPuVHJ5Cy6F4TCiG2zYjKoZSSeEMino=
=p4HZ
-----END PGP SIGNATURE-----

--=-bCzr7npDWFsxXIN0e9af--



--===============6260432990784158181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6260432990784158181==--
