From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to
 irq created for msi.
Date: Fri, 8 Mar 2019 17:49:41 +0100
Message-ID: <20190308164941.GH19265@mail-itl>
References: <20190208101559.GA21228@mail-itl>
 <20190208101705.31790-1-marmarek@invisiblethingslab.com>
 <20190221164751.hjtyddw63ztmc3yk@Air-de-Roger>
 <20190221174040.GV21228@mail-itl>
 <20190222104222.p7niwzgngaf3uz2k@Air-de-Roger>
 <20190307005004.GC19265@mail-itl>
 <20190307144801.vh6fcvp6mj3e6puj@Air-de-Roger>
 <20190307222825.GE19265@mail-itl>
 <20190308102628.ndpwh67jlpe5nnrn@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3831327701054263313=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dl/V=RL=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1h2Igy-0005Vj-G2
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 16:49:52 +0000
In-Reply-To: <20190308102628.ndpwh67jlpe5nnrn@Air-de-Roger>
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


--===============3831327701054263313==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/SgVJVxFudH2R+XP"
Content-Disposition: inline


--/SgVJVxFudH2R+XP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to irq created
 for msi.

On Fri, Mar 08, 2019 at 11:26:28AM +0100, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 07, 2019 at 11:28:25PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Mar 07, 2019 at 03:48:01PM +0100, Roger Pau Monn=C3=A9 wrote:
> > > Another option would be to store which domains are given permissions
> > > over which irqs in a way that's optimized to get the list of domains
> > > given an irq (ie: without having to iterate over the list of domains
> > > like my proposed solution above).
> >=20
> > This may make sense, but if that would be instead of the current
> > structure, we'd have another problem: when destroying stubdomain, you'd
> > need to get list IRQs it has access to, to explicitly revoke
> > stubdomain's access.
>=20
> Indeed. You would have to come up with a structure that allows to both
> get the list of irqs given a domain, or get the domain list given a
> irq.
>=20
> Maybe as a start you could expand irq_desc to contain the list of
> domains that have permission over the irq, and then use this
> information on cleanup?
>=20
> The main issue with this approach is that you would also need to
> cleanup this information from irq_desc if the stubdomain is destroyed
> before destroying the IRQ.

In case of stubdomain specifically, such cleanup wouldn't be that hard,
as I can get list if IRQs by iterating over pirqs of d->target. Also, I
can simply lookup to what IRQs such stubdomain have access through
d->irq_caps.  But similar to target->stubdomain mapping idea, this would
introduce a circular dependency, which needs to be broken at some point.
Adding irq_desc->dm_domain (*) is slightly easier than
target->stubdomain mapping, as a single entry is enough here. This is
because specific (stub)domain have created this IRQ.

On the other hand, having generic mechanism revoking IRQ permissions
during destroy_irq(), regardless of where irq_permit_access() was called
would be nice. A generic mechanism would require a domain list in
irq_desc, not a single entry. Is it worth it?

(*) Regarding dm_domain name, if qemu is running in dom0, then dom0 is
device model domain for this thing.

> > In theory it could be done by looking at the target
> > domain and iterating over its IRQs, but this is getting more and more
> > complex.
> >=20
> > I think the tricky part is unmap_domain_pirq->msi_free_irq, which can be
> > called:
> > 1. from PHYSDEVOP_unmap_pirq, by stubdomain
> > 2. from PHYSDEVOP_unmap_pirq, by dom0 when device model runs there
> > 3. from PHYSDEVOP_unmap_pirq, by dom0 even with device model in
> > stubdomain - normally it shouldn't happen for MSI allocated by
> > stubdomain, but dom0 is allowed to do so, and it shouldn't cause any
> > harm
> > 4. from free_domain_pirqs, during domain destruction
> > 5. various error paths
> >=20
> > If unmap_domain_pirq would know where device model is running, even if
> > not called by it, that would help. What about adding back reference in
> > struct domain to a stubdomain? That would help a lot here. The only
> > problem is a circular dependency stubdom->target->stubdom. This cycle
> > would need to be broken during stubdom teardown. domain_kill(stubdom)
> > looks like a good place to break it. Is it guaranteed to be called, or
> > is there some other path to destroying a stubdomain?
>=20
> A stubdomain AFAICT is handled like others domains from a hypervisor
> PoV, there's no distinction between guests and stubdomains inside the
> hypervisor, so I think domain_kill would be an appropriate place.

As Jan said in the other message, this also could be solved by storing
domain id, not a pointer, because it's easy to detect if that domain id
is stale.

> > Can one HVM domain have multiple stubdomains? If so, it should a be
> > list, not a single field.
>=20
> Yes, I think that's a supported setup. You can register multiple ioreq
> servers handling accesses for a single domain, and there's no
> restriction that forces running all those ioreq servers in the same
> control domain.

I was looking at it, and adding a list of struct domain pointers would
be easy, but would require breaking circular dependency during teardown
(in domain_kill). And will add yet another struct list_head into
struct domain. On the other hand, having list of domain ids would
require a wrapper structure or such - I don't see any API in Xen for
storing list of just ints (domid_t specifically). Using an array for
something that should really be a list looks clumsy - all the searching
for first available space, ignoring empty slots etc. Maybe rangeset
could be used for that?

> Similarly you could have a single domain that has control permissions
> over multiple domains, ie: like the hardware domain. domain->target
> should likely be a list also in order to support this use case, but I
> guess no one has yet required such use-case.

DOMCTL_set_target currently returns -EINVAL if you try assign a second
stubdomain to a HVM.

> But maybe I'm just overdesigning this when there's no use-case of a
> domain having multiple stubdomains, or a stubdomain serving multiple
> domains.
>=20
> Maybe it's enough to have a clear statement of the scope of this
> mechanism and it's current limitations:
>=20
>  - A domain different that the hardware domain can only have control
>    permissions over a single other domain.
>=20
>  - When a domain with passed through devices that have mediators
>    running in a domain different than the hardware domain is destroyed
>    the domain running those mediators must have been destroyed
>    beforehand.

Yes, both of those are true, even without my patches.

> With those limitations in mind I think you could then use
> get_dm_domain in destroy_irq. IMO I think this is fragile, but would
> be enough to solve the issue you are currently facing.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--/SgVJVxFudH2R+XP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlyCnSYACgkQ24/THMrX
1yyiuQf/RU+osFl1jl4r7Z9luQ2AAySvy3gL7oawDPNS3H2SoeYXCQ4PMt9kCYEp
0n/4LlXi+6EQJCLZyXjWtDJHAqXbWF0InNO9AkltAAlyXMKvouCCnq5ThXrFjZD9
4MI7o/luL9qzC11d0dxW/dXmQGBMJwnmGftMEElfZ3u7ysopqatjPYkh3OpaQwUD
41wKWJez8+ESZ3YjgH+PdY2QHRCHh209J0IVx4q91xQPS4aw1drKm21euEejfvA5
hodEttKxtnGHiEE2zxZd/jmWHxJqIEdbMsnnNQ0ntecoAGrizL/cOSg69A7F4pod
89oEssq0espbQHZ2g3FzOtlsz6psUQ==
=EzaT
-----END PGP SIGNATURE-----

--/SgVJVxFudH2R+XP--


--===============3831327701054263313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3831327701054263313==--
