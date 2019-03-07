From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to
 irq created for msi.
Date: Thu, 7 Mar 2019 01:50:04 +0100
Message-ID: <20190307005004.GC19265@mail-itl>
References: <20190208101559.GA21228@mail-itl>
 <20190208101705.31790-1-marmarek@invisiblethingslab.com>
 <20190221164751.hjtyddw63ztmc3yk@Air-de-Roger>
 <20190221174040.GV21228@mail-itl>
 <20190222104222.p7niwzgngaf3uz2k@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5932928414301042883=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=043R=RK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1h1hEl-0004XK-U7
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 00:50:16 +0000
In-Reply-To: <20190222104222.p7niwzgngaf3uz2k@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org


--===============5932928414301042883==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7fVr/IRGAG9sAW4J"
Content-Disposition: inline


--7fVr/IRGAG9sAW4J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to irq created
 for msi.

On Fri, Feb 22, 2019 at 11:42:22AM +0100, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 21, 2019 at 06:40:40PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Feb 21, 2019 at 05:47:51PM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Fri, Feb 08, 2019 at 11:17:05AM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > >  {
> > > >      int irq, ret;
> > > >      struct irq_desc *desc;
> > > > @@ -190,19 +190,19 @@ int create_irq(nodeid_t node)
> > > >          desc->arch.used =3D IRQ_UNUSED;
> > > >          irq =3D ret;
> > > >      }
> > > > -    else if ( hardware_domain )
> > > > +    else if ( dm_domain )
> > >=20
> > > Can you guarantee that dm_domain is always current->domain?
> >=20
> > No, in some cases it will be hardware_domain.
>=20
> Right, but in that case current->domain =3D=3D hardware_domain I guess?
>=20
> >=20
> > > I think you need to assert for this, or else take a reference to
> > > dm_domain (get_domain) before accessing it's fields, or else you risk
> > > the domain being destroyed while modifying it's fields.
> >=20
> > Can hardware_domain be destroyed without panicking Xen? If so,
> > get_domain would be indeed needed.
>=20
> What about other callers that are not the hardware_domain? You need to
> make sure those domains are not destroyed while {create/destroy}_irq
> is changing the permissions.
>=20
> If you can guarantee that dm_domain =3D=3D current->domain then you are
> safe, if not you need to get a reference before modifying any fields
> of the domain struct.
>=20
> So IMO you either need to add an assert or a get_domain depending on
> the answer to the question above.

I've added an assert, and I think I have the answer to the above question:

    (XEN) Assertion 'd =3D=3D current->domain' failed at irq.c:232
    (XEN) ----[ Xen-4.12.0-rc  x86_64  debug=3Dy   Not tainted ]----
    (XEN) CPU:    2
    (XEN) RIP:    e008:[<ffff82d08028f545>] destroy_irq+0x126/0x143
    (XEN) RFLAGS: 0000000000010206   CONTEXT: hypervisor
(...)
    (XEN) Xen call trace:
    (XEN)    [<ffff82d08028f545>] destroy_irq+0x126/0x143
    (XEN)    [<ffff82d08028ce1e>] msi_free_irq+0x51/0x1b8
    (XEN)    [<ffff82d0802923e1>] unmap_domain_pirq+0x487/0x4d4
    (XEN)    [<ffff82d08029249f>] free_domain_pirqs+0x71/0x8f
    (XEN)    [<ffff82d0802819e0>] arch_domain_destroy+0x41/0xa1
    (XEN)    [<ffff82d080207d22>] domain.c#complete_domain_destroy+0x86/0x1=
59
    (XEN)    [<ffff82d08022a658>] rcupdate.c#rcu_process_callbacks+0xa5/0x1=
cc
    (XEN)    [<ffff82d08023c4fa>] softirq.c#__do_softirq+0x78/0x9a
    (XEN)    [<ffff82d08023c566>] do_softirq+0x13/0x15
    (XEN)    [<ffff82d080280532>] domain.c#idle_loop+0x63/0xb9

In this case, current->domain obviously isn't the stubdomain, because at
this point it is already destroyed (it keeps reference to the target
domain, so target domain couldn't be destroyed before its stubdomain).

In fact, in this case get_dm_domain() returns wrong value, since it
isn't called by device model. At the point where stubdomain is already
destroyed, I think it should return NULL, but it returns
hardware_domain. But it isn't that easy, because target domain don't
have any reference to its stubdomain. Especially already destroyed one.

I's defined as:

    static struct domain *get_dm_domain(struct domain *d)
    {
        return current->domain->target =3D=3D d ? current->domain :
                                              hardware_domain;
    }

Since hardware domain couldn't be destroyed(*) while the system is
running, in practice this wrong return value it isn't a problem.
Hardware didn't have permission over this IRQ (if stubdomain have
created it), so irq_deny_access is a no-op.

So, I would adjust assert in destroy_irq to allow also hardware_domain,
and add a comment that get_dm_domain may return hardware_domain during
domain destruction. Is that ok?

(*) is this actually true? I see shutdown_domain(hardware_domain)
cause Xen to shutdown. But I don't see anything like this in
domain_kill/domain_destroy. Normally no other domain than dom0 is able
to destroy other domains (and domain can't destroy itself), so it should
be ok. But with some XSM policy, I think it could be possible to allow
other domain to destroy hardware domain. In fact, just having hardware
domain !=3D dom0 is enough to violate this assumption.
Am I missing anything?

Full crash message:
(XEN) Assertion 'd =3D=3D current->domain' failed at irq.c:232
(XEN) ----[ Xen-4.12.0-rc  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    2
(XEN) RIP:    e008:[<ffff82d08028f545>] destroy_irq+0x126/0x143
(XEN) RFLAGS: 0000000000010206   CONTEXT: hypervisor
(XEN) rax: ffff830422264000   rbx: 000000000000001e   rcx: 0000000000000000
(XEN) rdx: ffff8304222de000   rsi: ffff830422235000   rdi: 000000000000001e
(XEN) rbp: ffff83042225fcc0   rsp: ffff83042225fc90   r8:  0000000000000000
(XEN) r9:  ffff830385868880   r10: 0000000000000004   r11: ffff8304222ba010
(XEN) r12: ffff830422235000   r13: 000000000000001e   r14: ffff830422280000
(XEN) r15: ffff83042d8d1000   cr0: 000000008005003b   cr4: 00000000000426e0
(XEN) cr3: 00000000ca49d000   cr2: ffff88011a179c00
(XEN) fsb: 0000000000000000   gsb: ffff880135640000   gss: 0000000000000000
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d08028f545> (destroy_irq+0x126/0x143):
(XEN)  41 5e 41 5f 5d c3 0f 0b <0f> 0b 41 0f b7 34 24 89 c1 44 89 ea 48 8d =
3d b0
(XEN) Xen stack trace from rsp=3Dffff83042225fc90:
(XEN)    ffff83042225fca0 0000000000000000 ffff83025f33a860 ffff830422235000
(XEN)    ffff83025f33a860 ffff83042d8d1000 ffff83042225fd00 ffff82d08028ce1e
(XEN)    ffff83025f33a700 ffff83025f33a860 0000000000000000 ffff830422281e00
(XEN)    000000000000001e ffff83042d8d1000 ffff83042225fd90 ffff82d0802923e1
(XEN)    ffffffffffffff26 ffffffffffffffc9 ffffffffffffffc9 ffff83042d8d1858
(XEN)    000000002d8d1000 0000000000000286 0000000000000037 ffff83025f33a860
(XEN)    ffff83042d8d10f0 0000003700000001 ffff83042225fd80 0000000000000037
(XEN)    ffff83042d8d1000 ffff83042d8d1b28 ffff83042d8d10f0 ffff83042d8d10cc
(XEN)    ffff83042225fdd0 ffff82d08029249f 0000000000000013 ffff83042d8d1000
(XEN)    00000000ffffffff ffff83042d8d1b28 ffff83042d8d1000 fffffffffffffff8
(XEN)    ffff83042225fdf0 ffff82d0802819e0 ffff83042d8d1b28 ffff8303d2db1000
(XEN)    ffff83042225fe30 ffff82d080207d22 000008f2621ab810 ffff830422262040
(XEN)    0000000000000000 0000000000000001 ffff83042225ffff ffff82d0805c3880
(XEN)    ffff83042225fe60 ffff82d08022a658 000000000000001d ffff82d0805bb980
(XEN)    ffff82d0805bb880 ffffffffffffffff ffff83042225fea0 ffff82d08023c4fa
(XEN)    ffff82d0805bb980 0000000000000002 ffff82d0805e9af0 ffff82d0805bb880
(XEN)    ffff82d0805d4a20 ffff83042225ffff ffff83042225feb0 ffff82d08023c566
(XEN)    ffff83042225fef0 ffff82d080280532 ffff830422264000 ffff830422264000
(XEN)    ffff830422217000 0000000000000002 ffff830422235000 ffff8304222de000
(XEN)    ffff83042225fd98 0000000000000000 0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d08028f545>] destroy_irq+0x126/0x143
(XEN)    [<ffff82d08028ce1e>] msi_free_irq+0x51/0x1b8
(XEN)    [<ffff82d0802923e1>] unmap_domain_pirq+0x487/0x4d4
(XEN)    [<ffff82d08029249f>] free_domain_pirqs+0x71/0x8f
(XEN)    [<ffff82d0802819e0>] arch_domain_destroy+0x41/0xa1
(XEN)    [<ffff82d080207d22>] domain.c#complete_domain_destroy+0x86/0x159
(XEN)    [<ffff82d08022a658>] rcupdate.c#rcu_process_callbacks+0xa5/0x1cc
(XEN)    [<ffff82d08023c4fa>] softirq.c#__do_softirq+0x78/0x9a
(XEN)    [<ffff82d08023c566>] do_softirq+0x13/0x15
(XEN)    [<ffff82d080280532>] domain.c#idle_loop+0x63/0xb9
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 2:
(XEN) Assertion 'd =3D=3D current->domain' failed at irq.c:232
(XEN) ****************************************


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--7fVr/IRGAG9sAW4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlyAarwACgkQ24/THMrX
1ywQ7QgAgfpviz5HCG4GgPM8vgFaJdxSoo1+bji3IuGmUf399knzt/mZeB2UdMg8
GRtdYUDbN+MsbH2Pi9DxTpULTOC+s4iKxchUmX+yJ5X9qcDDcx+NPasrmsATf9J/
wy490/agLmDvamX6nFj++8oGcRacBGNtAeT+vMURbxNzKa51QFY/5wyCtCgbZ0ou
kEwQUpIRKd7blKVYR33sj7AOane68fO7g2JaXDetF/m5U4vzvVAZK3+ynloN6fJJ
mq0hXpSm3fV+5fqpBwzsm8RLjAElhk3gMLvH0idpXwXqJiUfn6SSEchWmeknL/16
acHUxfmfeOngDYN8mqjU7ygKvIwdBQ==
=Ojmh
-----END PGP SIGNATURE-----

--7fVr/IRGAG9sAW4J--


--===============5932928414301042883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5932928414301042883==--
