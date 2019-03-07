From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to
 irq created for msi.
Date: Thu, 7 Mar 2019 23:28:25 +0100
Message-ID: <20190307222825.GE19265@mail-itl>
References: <20190208101559.GA21228@mail-itl>
 <20190208101705.31790-1-marmarek@invisiblethingslab.com>
 <20190221164751.hjtyddw63ztmc3yk@Air-de-Roger>
 <20190221174040.GV21228@mail-itl>
 <20190222104222.p7niwzgngaf3uz2k@Air-de-Roger>
 <20190307005004.GC19265@mail-itl>
 <20190307144801.vh6fcvp6mj3e6puj@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1037476724035948304=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=043R=RK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1h21VE-0005E3-4J
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 22:28:36 +0000
In-Reply-To: <20190307144801.vh6fcvp6mj3e6puj@Air-de-Roger>
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


--===============1037476724035948304==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u2SGZJvfJjPItuJA"
Content-Disposition: inline


--u2SGZJvfJjPItuJA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to irq created
 for msi.

On Thu, Mar 07, 2019 at 03:48:01PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 07, 2019 at 01:50:04AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Fri, Feb 22, 2019 at 11:42:22AM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Thu, Feb 21, 2019 at 06:40:40PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Thu, Feb 21, 2019 at 05:47:51PM +0100, Roger Pau Monn=C3=A9 wrot=
e:
> > > > > On Fri, Feb 08, 2019 at 11:17:05AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > >  {
> > > > > >      int irq, ret;
> > > > > >      struct irq_desc *desc;
> > > > > > @@ -190,19 +190,19 @@ int create_irq(nodeid_t node)
> > > > > >          desc->arch.used =3D IRQ_UNUSED;
> > > > > >          irq =3D ret;
> > > > > >      }
> > > > > > -    else if ( hardware_domain )
> > > > > > +    else if ( dm_domain )
> > > > >=20
> > > > > Can you guarantee that dm_domain is always current->domain?
> > > >=20
> > > > No, in some cases it will be hardware_domain.
> > >=20
> > > Right, but in that case current->domain =3D=3D hardware_domain I gues=
s?
> > >=20
> > > >=20
> > > > > I think you need to assert for this, or else take a reference to
> > > > > dm_domain (get_domain) before accessing it's fields, or else you =
risk
> > > > > the domain being destroyed while modifying it's fields.
> > > >=20
> > > > Can hardware_domain be destroyed without panicking Xen? If so,
> > > > get_domain would be indeed needed.
> > >=20
> > > What about other callers that are not the hardware_domain? You need to
> > > make sure those domains are not destroyed while {create/destroy}_irq
> > > is changing the permissions.
> > >=20
> > > If you can guarantee that dm_domain =3D=3D current->domain then you a=
re
> > > safe, if not you need to get a reference before modifying any fields
> > > of the domain struct.
> > >=20
> > > So IMO you either need to add an assert or a get_domain depending on
> > > the answer to the question above.
> >=20
> > I've added an assert, and I think I have the answer to the above questi=
on:
> >=20
> >     (XEN) Assertion 'd =3D=3D current->domain' failed at irq.c:232
> >     (XEN) ----[ Xen-4.12.0-rc  x86_64  debug=3Dy   Not tainted ]----
> >     (XEN) CPU:    2
> >     (XEN) RIP:    e008:[<ffff82d08028f545>] destroy_irq+0x126/0x143
> >     (XEN) RFLAGS: 0000000000010206   CONTEXT: hypervisor
> > (...)
> >     (XEN) Xen call trace:
> >     (XEN)    [<ffff82d08028f545>] destroy_irq+0x126/0x143
> >     (XEN)    [<ffff82d08028ce1e>] msi_free_irq+0x51/0x1b8
> >     (XEN)    [<ffff82d0802923e1>] unmap_domain_pirq+0x487/0x4d4
> >     (XEN)    [<ffff82d08029249f>] free_domain_pirqs+0x71/0x8f
> >     (XEN)    [<ffff82d0802819e0>] arch_domain_destroy+0x41/0xa1
> >     (XEN)    [<ffff82d080207d22>] domain.c#complete_domain_destroy+0x86=
/0x159
> >     (XEN)    [<ffff82d08022a658>] rcupdate.c#rcu_process_callbacks+0xa5=
/0x1cc
> >     (XEN)    [<ffff82d08023c4fa>] softirq.c#__do_softirq+0x78/0x9a
> >     (XEN)    [<ffff82d08023c566>] do_softirq+0x13/0x15
> >     (XEN)    [<ffff82d080280532>] domain.c#idle_loop+0x63/0xb9
> >=20
> > In this case, current->domain obviously isn't the stubdomain, because at
> > this point it is already destroyed (it keeps reference to the target
> > domain, so target domain couldn't be destroyed before its stubdomain).
> >=20
> > In fact, in this case get_dm_domain() returns wrong value, since it
> > isn't called by device model. At the point where stubdomain is already
> > destroyed, I think it should return NULL, but it returns
> > hardware_domain. But it isn't that easy, because target domain don't
> > have any reference to its stubdomain. Especially already destroyed one.
> >=20
> > I's defined as:
> >=20
> >     static struct domain *get_dm_domain(struct domain *d)
> >     {
> >         return current->domain->target =3D=3D d ? current->domain :
> >                                               hardware_domain;
> >     }
>=20
> So get_dm_domain works fine when used by create_irq, because in that
> case current->domain =3D=3D d AFAICT.
>=20
> As you pointed out however using the same mechanism for destroy is not
> suitable, since the stubdomain might be already destroyed, and
> unmap_domain_pirq called from the idle vCPU.
>=20
> > Since hardware domain couldn't be destroyed(*) while the system is
> > running, in practice this wrong return value it isn't a problem.
> > Hardware didn't have permission over this IRQ (if stubdomain have
> > created it), so irq_deny_access is a no-op.
> >=20
> > So, I would adjust assert in destroy_irq to allow also hardware_domain,
> > and add a comment that get_dm_domain may return hardware_domain during
> > domain destruction. Is that ok?
>=20
> Hm, albeit I agree with your analysis, I feel like this proposed
> solution is kind of a workaround. Given the context, I think the best
> way to deal with this issue in destroy_irq is to iterate over the list
> of domains and make sure no domain has permissions over the destroyed
> irq. Note that with this proposed solution you will have to drop the
> domain parameter from destroy_irq.

I'd really like to avoid iterating the whole domain list. Jan, what do
you think? Code-wise this seems to be the easiest solution.

> Another option would be to store which domains are given permissions
> over which irqs in a way that's optimized to get the list of domains
> given an irq (ie: without having to iterate over the list of domains
> like my proposed solution above).

This may make sense, but if that would be instead of the current
structure, we'd have another problem: when destroying stubdomain, you'd
need to get list IRQs it has access to, to explicitly revoke
stubdomain's access. In theory it could be done by looking at the target
domain and iterating over its IRQs, but this is getting more and more
complex.

I think the tricky part is unmap_domain_pirq->msi_free_irq, which can be
called:
1. from PHYSDEVOP_unmap_pirq, by stubdomain
2. from PHYSDEVOP_unmap_pirq, by dom0 when device model runs there
3. from PHYSDEVOP_unmap_pirq, by dom0 even with device model in
stubdomain - normally it shouldn't happen for MSI allocated by
stubdomain, but dom0 is allowed to do so, and it shouldn't cause any
harm
4. from free_domain_pirqs, during domain destruction
5. various error paths

If unmap_domain_pirq would know where device model is running, even if
not called by it, that would help. What about adding back reference in
struct domain to a stubdomain? That would help a lot here. The only
problem is a circular dependency stubdom->target->stubdom. This cycle
would need to be broken during stubdom teardown. domain_kill(stubdom)
looks like a good place to break it. Is it guaranteed to be called, or
is there some other path to destroying a stubdomain?

Can one HVM domain have multiple stubdomains? If so, it should a be
list, not a single field.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--u2SGZJvfJjPItuJA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlyBmwgACgkQ24/THMrX
1ywstQgAl6cASkQ4mCLhhD3HLwn9yyjW8YF54o0Su6+t0gWe2p5TBbgZ1MOCgThL
zrJxB1Mt+9Aez3wfUdBCUsQMgxn/BzaGK6jtTG2CnAtsDwh1zO1r9T998KUV/Uzs
s+62Iyqg5lX3obcaRQAAnjf06ejgMVrjTCH4oRqS7mrCneMRDXHvKO/mBmWHxgMF
fVqRpLnmA77eufCERt77aikjdzZMQePbgNnAOqFyrEMPAvu4Kik8zQjSeJgnpsZp
PGyY5PYCzNuGh3yX7PkEgrfzKDPjwfQ+n8UWQcf8W2bBYmuv49SqBjpKpP9LWtHA
cDVBqBv1Zkq/QLGNUQ3ZwYczEf38YQ==
=bkQx
-----END PGP SIGNATURE-----

--u2SGZJvfJjPItuJA--


--===============1037476724035948304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1037476724035948304==--
