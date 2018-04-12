From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Thu, 12 Apr 2018 19:25:43 +0200
Message-ID: <6b119ba762dbad0c1949bf814694ffbfd39d16c4.camel@suse.com>
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
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6446911125342553543=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a6057cd8eadc20b04797a4a8fc9cb5570d44544d.camel@suse.com>
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


--===============6446911125342553543==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-9JnQQy4F1m/9OB21BPpA"


--=-9JnQQy4F1m/9OB21BPpA
Content-Type: multipart/mixed; boundary="=-1E0NnZmWKShRFWRZWva2"


--=-1E0NnZmWKShRFWRZWva2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-04-12 at 17:38 +0200, Dario Faggioli wrote:
> On Thu, 2018-04-12 at 15:15 +0200, Dario Faggioli wrote:
> > On Thu, 2018-04-12 at 14:45 +0200, Olaf Hering wrote:
> > >=20
> > > dies after the first iteration.
> > >=20
> > >         BUG_ON(!test_bit(_VPF_migrating, &prev->pause_flags));
> > >=20
>=20
> Update. I replaced this:
>=20
Olaf, new patch! :-)

FTR, a previous version of this (where I was not printing
smp_processor_id() and prev->is_running), produced the output that I am
attaching below.

Looks to me like, while on the crashing CPU, we are here [*]:

void context_saved(struct vcpu *prev)
{
    ...
    if ( unlikely(prev->pause_flags & VPF_migrating) )
    {
        unsigned long flags;
        spinlock_t *lock =3D vcpu_schedule_lock_irqsave(prev, &flags);

        if (vcpu_runnable(prev) || !test_bit(_VPF_migrating, &prev->pause_f=
lags))
            printk("CPU %u: d%uv%d isr=3D%u runnbl=3D%d proc=3D%d pf=3D%lu =
orq=3D%d csf=3D%u\n",
                   smp_processor_id(), prev->domain->domain_id, prev->vcpu_=
id,
                   prev->is_running, vcpu_runnable(prev),
                   prev->processor, prev->pause_flags,
                   SCHED_OP(vcpu_scheduler(prev), onrunq, prev),
                   SCHED_OP(vcpu_scheduler(prev), csflags, prev));

        [*]

        if ( prev->runstate.state =3D=3D RUNSTATE_runnable )
            vcpu_runstate_change(prev, RUNSTATE_offline, NOW());
        BUG_ON(curr_on_cpu(prev->processor) =3D=3D prev);
        SCHED_OP(vcpu_scheduler(prev), sleep, prev);

        vcpu_schedule_unlock_irqrestore(lock, flags, prev);

        vcpu_migrate(prev);
    }
}

On the "other CPU", we might be around here [**]:

static void vcpu_migrate(struct vcpu *v)
{
    ...
    if ( v->is_running ||
         !test_and_clear_bit(_VPF_migrating, &v->pause_flags) )
    {
        sched_spin_unlock_double(old_lock, new_lock, flags);=20
        return;=20
    }=20
=20
    vcpu_move_locked(v, new_cpu);=20
=20
    sched_spin_unlock_double(old_lock, new_lock, flags);=20

    [**]=20

    if ( old_cpu !=3D new_cpu )=20
        sched_move_irqs(v);=20
=20
    /* Wake on new CPU. */=20
    vcpu_wake(v);=20
}

(XEN) d10v1 runnbl=3D0 proc=3D22 pf=3D1 orq=3D0 csf=3D4
(XEN) d10v0 runnbl=3D1 proc=3D20 pf=3D0 orq=3D0 csf=3D4
(XEN) d10v0 runnbl=3D1 proc=3D25 pf=3D0 orq=3D0 csf=3D4
(XEN) d10v2 runnbl=3D1 proc=3D31 pf=3D0 orq=3D0 csf=3D4
(XEN) d10v2 runnbl=3D1 proc=3D10 pf=3D0 orq=3D1 csf=3D0
(XEN) d10v0 runnbl=3D1 proc=3D30 pf=3D0 orq=3D0 csf=3D4
(XEN) d10v0 runnbl=3D1 proc=3D15 pf=3D0 orq=3D0 csf=3D4
(XEN) d10v3 runnbl=3D1 proc=3D13 pf=3D0 orq=3D1 csf=3D0
(XEN) d10v2 runnbl=3D1 proc=3D39 pf=3D0 orq=3D0 csf=3D4
(XEN) d10v3 runnbl=3D1 proc=3D32 pf=3D0 orq=3D0 csf=3D4
(XEN) d10v2 runnbl=3D1 proc=3D20 pf=3D0 orq=3D0 csf=3D4
(XEN) d10v2 runnbl=3D1 proc=3D20 pf=3D0 orq=3D0 csf=3D4
(XEN) d10v1 runnbl=3D0 proc=3D26 pf=3D1 orq=3D0 csf=3D4
(XEN) d10v3 runnbl=3D1 proc=3D16 pf=3D0 orq=3D0 csf=3D4
(XEN) Xen BUG at sched_credit.c:877
(XEN) ----[ Xen-4.11.20180411T100655.82540b66ce-180412155659  x86_64  debug=
=3Dy   Not tainted ]----
(XEN) CPU:    16
(XEN) RIP:    e008:[<ffff82d08022c84d>] sched_credit.c#csched_vcpu_migrate+=
0x52/0x54
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor (d6v0)
(XEN) rax: ffff8300779c9000   rbx: 0000000000000012   rcx: ffff830adac719f0
(XEN) rdx: 0000000000000012   rsi: ffff8300779b2000   rdi: 00000033ff8bb000
(XEN) rbp: ffff83087cfb7ce8   rsp: ffff83087cfb7ce8   r8:  0000000000000010
(XEN) r9:  0000ffff0000ffff   r10: 00ff00ff00ff00ff   r11: 0f0f0f0f0f0f0f0f
(XEN) r12: ffff83047fe82188   r13: ffff83047fe70188   r14: ffff82d0805c7180
(XEN) r15: ffff8300779b2000   cr0: 000000008005003b   cr4: 00000000000026e0
(XEN) cr3: 0000000f8404b000   cr2: 00007f18dfeca000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08022c84d> (sched_credit.c#csched_vcpu_migrat=
e+0x52/0x54):
(XEN)  5d c3 0f 0b 0f 0b 0f 0b <0f> 0b 55 48 89 e5 48 8d 05 26 a9 39 00 48 =
8b 57
(XEN) Xen stack trace from rsp=3Dffff83087cfb7ce8:
(XEN)    ffff83087cfb7cf8 ffff82d080239419 ffff83087cfb7d68 ffff82d08023a8d=
8
(XEN)    ffff82d0805c7160 ffff82d0805c7180 01ff83087cfb7d78 000000120000001=
0
(XEN)    0000000000000092 0000000000000296 0000000000000003 ffff8300779b200=
0
(XEN)    ffff83047fe82188 0000000000000292 0000000000000004 ffff82d0805b252=
0
(XEN)    ffff83087cfb7db8 ffff82d08023c795 ffff83087cfb7d98 ffff8300779b200=
0
(XEN)    ffff83087cfb7db8 ffff8300779c9000 ffff8300779b2000 ffff830ad646300=
0
(XEN)    0000000000000010 ffff830adad26000 ffff83087cfb7e08 ffff82d08027a53=
8
(XEN)    ffff83087cfb7dd8 ffff82d0802a8510 ffff83087cfb7e08 ffff8300779b200=
0
(XEN)    ffff8300779c9000 ffff83047fe82188 0000008405ba3022 000000000000000=
3
(XEN)    ffff83087cfb7e98 ffff82d0802397a9 ffff8300779b2560 ffff83047fe821a=
0
(XEN)    0000001000fb7e58 ffff83047fe82180 ffff82d080328ba1 ffff8300779b200=
0
(XEN)    ffff830adad26000 ffff8300779c9000 0000000001c9c380 ffff82d08030200=
0
(XEN)    ffff8300779b2000 ffff82d08059c480 ffff82d08059bc80 fffffffffffffff=
f
(XEN)    ffff83087cfb7fff ffff82d0805a3c80 ffff83087cfb7ed8 ffff82d08023d55=
2
(XEN)    ffff82d080328ba1 ffff8300779b2000 ffff8300779c9000 ffff830adad2600=
0
(XEN)    0000000000000010 ffff830ad6463000 ffff83087cfb7ee8 ffff82d08023d5c=
5
(XEN)    ffff83087cfb7db8 ffff82d080328d6b ffffffff81c00000 ffffffff81c0000=
0
(XEN)    ffffffff81c00000 0000000000000000 0000000000000000 ffffffff81d4c18=
0
(XEN)    0000000000000008 000000470cb96de6 0000000000000001 000000000000000=
0
(XEN)    ffffffff81020e50 0000000000000000 0000000000000000 000000000000000=
0
(XEN) Xen call trace:
(XEN)    [<ffff82d08022c84d>] sched_credit.c#csched_vcpu_migrate+0x52/0x54
(XEN)    [<ffff82d080239419>] schedule.c#vcpu_move_locked+0x42/0xcc
(XEN)    [<ffff82d08023a8d8>] schedule.c#vcpu_migrate+0x210/0x23b
(XEN)    [<ffff82d08023c795>] context_saved+0x21e/0x461
(XEN)    [<ffff82d08027a538>] context_switch+0xe9/0xf67
(XEN)    [<ffff82d0802397a9>] schedule.c#schedule+0x306/0x6ab
(XEN)    [<ffff82d08023d552>] softirq.c#__do_softirq+0x71/0x9a
(XEN)    [<ffff82d08023d5c5>] do_softirq+0x13/0x15
(XEN)    [<ffff82d080328d6b>] vmx_asm_do_vmentry+0x2b/0x30

--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-1E0NnZmWKShRFWRZWva2
Content-Disposition: attachment; filename="context-save-race-debug.patch"
Content-Type: text/x-patch; name="context-save-race-debug.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMgYi94ZW4vY29tbW9uL3NjaGVk
X2NyZWRpdC5jCmluZGV4IDliYzYzOGMwOWMuLjZlODg2YmRmYmIgMTAwNjQ0Ci0tLSBhL3hlbi9j
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
aGVkdWxlciAqb3BzLCBzdHJ1Y3QgdmNwdSAqdmMpCiB7CkBAIC0xMDg2LDYgKzEwOTcsMTggQEAg
Y3NjaGVkX3ZjcHVfcmVtb3ZlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHZj
cHUgKnZjKQogICAgIEJVR19PTiggc2RvbSA9PSBOVUxMICk7CiB9CiAKK3N0YXRpYyBpbnQKK2Nz
Y2hlZF92Y3B1X29ucnVucShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCB2Y3B1
ICp2YykKK3sKKyAgICByZXR1cm4gX192Y3B1X29uX3J1bnEoQ1NDSEVEX1ZDUFUodmMpKTsKK30K
Kworc3RhdGljIGludAorY3NjaGVkX3ZjcHVfY3NmbGFncyhjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVy
ICpvcHMsIHN0cnVjdCB2Y3B1ICp2YykKK3sKKyAgICByZXR1cm4gQ1NDSEVEX1ZDUFUodmMpLT5m
bGFnczsKK30KKwogc3RhdGljIHZvaWQKIGNzY2hlZF92Y3B1X3NsZWVwKGNvbnN0IHN0cnVjdCBz
Y2hlZHVsZXIgKm9wcywgc3RydWN0IHZjcHUgKnZjKQogewpAQCAtMjI3OCw4ICsyMzAxLDEyIEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyIHNjaGVkX2NyZWRpdF9kZWYgPSB7CiAgICAg
LmFkanVzdF9nbG9iYWwgID0gY3NjaGVkX3N5c19jbnRsLAogCiAgICAgLnBpY2tfY3B1ICAgICAg
ID0gY3NjaGVkX2NwdV9waWNrLAorICAgIC5taWdyYXRlICAgICAgICA9IGNzY2hlZF92Y3B1X21p
Z3JhdGUsCiAgICAgLmRvX3NjaGVkdWxlICAgID0gY3NjaGVkX3NjaGVkdWxlLAogCisgICAgLm9u
cnVucSAgICAgICAgID0gY3NjaGVkX3ZjcHVfb25ydW5xLAorICAgIC5jc2ZsYWdzICAgICAgICA9
IGNzY2hlZF92Y3B1X2NzZmxhZ3MsCisKICAgICAuZHVtcF9jcHVfc3RhdGUgPSBjc2NoZWRfZHVt
cF9wY3B1LAogICAgIC5kdW1wX3NldHRpbmdzICA9IGNzY2hlZF9kdW1wLAogICAgIC5pbml0ICAg
ICAgICAgICA9IGNzY2hlZF9pbml0LApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5j
IGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDM0M2FiNjMwNmUuLjJiOThiMzhlNmIgMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxl
LmMKQEAgLTE1NTQsNyArMTU1NCwzNCBAQCB2b2lkIGNvbnRleHRfc2F2ZWQoc3RydWN0IHZjcHUg
KnByZXYpCiAgICAgU0NIRURfT1AodmNwdV9zY2hlZHVsZXIocHJldiksIGNvbnRleHRfc2F2ZWQs
IHByZXYpOwogCiAgICAgaWYgKCB1bmxpa2VseShwcmV2LT5wYXVzZV9mbGFncyAmIFZQRl9taWdy
YXRpbmcpICkKKyAgICB7CisgICAgICAgIC8qCisgICAgICAgICAqIElmIHNvbWVvbmUgKGUuZy4s
IHZjcHVfc2V0X2FmZmluaXR5KCkpIGhhcyBzZXQgVlBGX21pZ3JhdGluZworICAgICAgICAgKiBv
biBwcmV2IGluIGJldHdlZW4gd2hlbiBzY2hlZHVsZSgpIHJlbGVhc2VzIHRoZSBzY2hlZHVsZXIK
KyAgICAgICAgICogbG9jayBhbmQgaGVyZSwgd2UgbmVlZCB0byBtYWtlIHN1cmUgd2UgcHJvcGVy
bHkgbWFyayB0aGUKKyAgICAgICAgICogdmNwdSBhcyBub3QgcnVubmFibGUgKGFuZCBhbGwgaXQg
Y29tZXMgd2l0aCB0aGF0KSwgd2l0aAorICAgICAgICAgKiB2Y3B1X3NsZWVwX25vc3luYygpLCBi
ZWZvcmUgY2FsbGluZyB2Y3B1X21pZ3JhdGUoKS4KKyAgICAgICAgICovCisgICAgICAgIC8vdmNw
dV9zbGVlcF9ub3N5bmMocHJldik7CisgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7CisgICAg
ICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZShwcmV2LCAm
ZmxhZ3MpOworCisgICAgICAgIGlmICh2Y3B1X3J1bm5hYmxlKHByZXYpIHx8ICF0ZXN0X2JpdChf
VlBGX21pZ3JhdGluZywgJnByZXYtPnBhdXNlX2ZsYWdzKSkKKyAgICAgICAgICAgIHByaW50aygi
Q1BVICV1OiBkJXV2JWQgaXNyPSV1IHJ1bm5ibD0lZCBwcm9jPSVkIHBmPSVsdSBvcnE9JWQgY3Nm
PSV1XG4iLAorICAgICAgICAgICAgICAgICAgIHNtcF9wcm9jZXNzb3JfaWQoKSwgcHJldi0+ZG9t
YWluLT5kb21haW5faWQsIHByZXYtPnZjcHVfaWQsCisgICAgICAgICAgICAgICAgICAgcHJldi0+
aXNfcnVubmluZywgdmNwdV9ydW5uYWJsZShwcmV2KSwKKyAgICAgICAgICAgICAgICAgICBwcmV2
LT5wcm9jZXNzb3IsIHByZXYtPnBhdXNlX2ZsYWdzLAorICAgICAgICAgICAgICAgICAgIFNDSEVE
X09QKHZjcHVfc2NoZWR1bGVyKHByZXYpLCBvbnJ1bnEsIHByZXYpLAorICAgICAgICAgICAgICAg
ICAgIFNDSEVEX09QKHZjcHVfc2NoZWR1bGVyKHByZXYpLCBjc2ZsYWdzLCBwcmV2KSk7CisgICAg
ICAgIGlmICggcHJldi0+cnVuc3RhdGUuc3RhdGUgPT0gUlVOU1RBVEVfcnVubmFibGUgKQorICAg
ICAgICAgICAgdmNwdV9ydW5zdGF0ZV9jaGFuZ2UocHJldiwgUlVOU1RBVEVfb2ZmbGluZSwgTk9X
KCkpOworICAgICAgICBCVUdfT04oY3Vycl9vbl9jcHUocHJldi0+cHJvY2Vzc29yKSA9PSBwcmV2
KTsKKyAgICAgICAgU0NIRURfT1AodmNwdV9zY2hlZHVsZXIocHJldiksIHNsZWVwLCBwcmV2KTsK
KworICAgICAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCBw
cmV2KTsKKwogICAgICAgICB2Y3B1X21pZ3JhdGUocHJldik7CisgICAgfQogfQogCiAvKiBUaGUg
c2NoZWR1bGVyIHRpbWVyOiBmb3JjZSBhIHJ1biB0aHJvdWdoIHRoZSBzY2hlZHVsZXIgKi8KZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIGIveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLWlmLmgKaW5kZXggOTU5NmVhZTFlMi4uOTdiNjQ2MTEwNiAxMDA2NDQKLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLWlmLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKQEAg
LTE2MCw2ICsxNjAsOSBAQCBzdHJ1Y3Qgc2NoZWR1bGVyIHsKICAgICB2b2lkICAgICAgICAgKCpp
bnNlcnRfdmNwdSkgICAgKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKiwgc3RydWN0IHZjcHUgKik7
CiAgICAgdm9pZCAgICAgICAgICgqcmVtb3ZlX3ZjcHUpICAgIChjb25zdCBzdHJ1Y3Qgc2NoZWR1
bGVyICosIHN0cnVjdCB2Y3B1ICopOwogCisgICAgaW50ICAgICAgICAgICgqb25ydW5xKSAgICAg
ICAgIChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICosIHN0cnVjdCB2Y3B1ICopOworICAgIGludCAg
ICAgICAgICAoKmNzZmxhZ3MpICAgICAgICAoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqLCBzdHJ1
Y3QgdmNwdSAqKTsKKwogICAgIHZvaWQgICAgICAgICAoKnNsZWVwKSAgICAgICAgICAoY29uc3Qg
c3RydWN0IHNjaGVkdWxlciAqLCBzdHJ1Y3QgdmNwdSAqKTsKICAgICB2b2lkICAgICAgICAgKCp3
YWtlKSAgICAgICAgICAgKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKiwgc3RydWN0IHZjcHUgKik7
CiAgICAgdm9pZCAgICAgICAgICgqeWllbGQpICAgICAgICAgIChjb25zdCBzdHJ1Y3Qgc2NoZWR1
bGVyICosIHN0cnVjdCB2Y3B1ICopOwo=


--=-1E0NnZmWKShRFWRZWva2--

--=-9JnQQy4F1m/9OB21BPpA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrPlpcACgkQFkJ4iaW4
c+6QOQ//Ysuh4nhAFIfPX22JxC/yVT4yY2GEQK1PGwNsWMjGIn8Lw1O0/nyHEGks
FwFKfP1DW2Wj0o2EXxNp+AjrdfHePqq1wSi+U0tlZCCAcKOIvl/ygV44gqwZ2B+v
YSyuQ3gL/n/GGHpXfZm11rxlZw+31Ax59cyEtQcGssotAhfXt+TaeSk0NIZE9+As
qZG3UOXEvVpiCoZbfh2kClBQmHJnHrMdeWJgW5VfYmLOW5AJzkzXMZM/mTY/pqYv
NSywtt+nHSZRJmDFuHXfmcXhcBnbffqBD4Vje/o5/9zh6YfnTamTI9fU+qW8ybN5
4CAlLu+0wNsJrDtP0n9QsxU4ebr8zZRpWSpgEzzAGz+RVjDlSZFLvCsFb+pK9NGE
LhHF8mgw94LmpeKZSBiN5wZyX/vwOe1Ng4PNCAGdT0v/JR1slNjXw/51gdZlvQOf
BY1Ht72QhfP0mRJ9ZLZ7tBhufhzuTpMWPCXYkSZ34YZZ0clEgNtdFXre6q7CsyDb
Zkw1Kxk4GSwjiDU0ZB8iy2t52P2aeXU5bM+OuJL/TDgFR+yxJqbJ5LXZlObOL5Kn
Ni4Q0zPlQU6WIyBs1jfaGElTmg0AUwcMyaYy6wwCXOG86P/MFLtEHQu1HP++G1Op
u07V9F5tccENv/R19ESk7SLYGjAIomiyxpRJmnuMXROywFtx4+Q=
=hmmu
-----END PGP SIGNATURE-----

--=-9JnQQy4F1m/9OB21BPpA--



--===============6446911125342553543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6446911125342553543==--
