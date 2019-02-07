From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Thu, 7 Feb 2019 18:51:57 +0100
Message-ID: <20190207175157.GZ21228@mail-itl>
References: <cover.0268d8ad929f422d7e0142099f5b84dd205f0c2e.1549498018.git-series.marmarek@invisiblethingslab.com>
 <f5bf6b245f91398e0235a7b603ebc08ef64135ab.1549498018.git-series.marmarek@invisiblethingslab.com>
 <20190207095719.7r6mikq5ahdbw34p@mac>
 <20190207132124.GW21228@mail-itl> <20190207145238.GX21228@mail-itl>
 <20190207145754.t2pr4mlqjb2ohpqi@mac>
 <20190207154138.GY21228@mail-itl>
 <20190207174016.gij6u5wqhrhckt3a@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1104296392807452262=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OOdV=QO=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1grnqK-0002ao-1j
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 17:52:08 +0000
In-Reply-To: <20190207174016.gij6u5wqhrhckt3a@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1104296392807452262==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eu12+zRL7gQwOC+E"
Content-Disposition: inline


--eu12+zRL7gQwOC+E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2019 at 06:40:16PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 07, 2019 at 04:41:38PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Feb 07, 2019 at 03:57:54PM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Thu, Feb 07, 2019 at 03:52:38PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Hmm, looking at the code, wouldn't it make sense to give device mod=
el
> > > > domain access to the IRQ _instead of_ hardware domain? If stubdomai=
n is
> > > > in use, I don't see why dom0 would need access to that irq. Simply
> > > > provide what the device model domain is as parameter - either
> > > > hardware_domain, or stubdomain. Something like:
> > > >=20
> > > >     create_irq(..., current->domain->target =3D=3D d ? current->dom=
ain : hardware_domain);
> > >=20
> > > Isn't there some cleanup that likely needs to be done by dom0 if it's
> > > not done by the stubdom, or in case the stubdom crashes for some
> > > reason?
> >=20
> > I don't think toolstack know anything about IRQs allocated by device
> > model, looks like it does cleanup only for INTx interrupts.
> >=20
> > > Or maybe that's already done on domain destruction by Xen itself, in
> > > which case not giving permissions to dom0 would be fine.
> >=20
> > There is free_domain_pirqs() call in arch_domain_destroy(). But I don't
> > have device model reference there. Is there a way to get target ->
> > stubdomain mapping (other than iterating over all the domains)? I see
> > also domain->target field, which is the other way around.
> > The only thing needed is irq_deny_access() call there (in case of domain
> > ID reuse). Since such IRQs are not mapped to stubdomain itself,
> > free_domain_pirqs() for stubdomain will not clean this up.
> > Or maybe, _if stubdomain is guaranteed to be destroyed before its
> > target_, we can iterate over target domain's IRQs during stubdomain
> > destruction for this purpose?
>=20
> The list of allowed irqs is stored inside of the domain struct,
> which means that it goes away when the domain is destroyed, there's no
> need to do any specific cleanup when the stubdomain is destroyed
> AFAICT. Now if the target domain is destroyed, those permissions over
> the irqs must be removed from the stubdomain, because the irqs will be
> freed and likely reused. The current model assumes that the hardware
> domain is always the controlling owner of such irqs, but if we allow
> stubdomains to also be the controlling owner then we need to keep some
> track of this, or else Xen could be leaking permissions.

This looks to be not a problem, because stubdomain keeps reference to
its target domain (and there is corresponding put_domain(d->target) on
domain destroy), so to answer my own question "if stubdomain is
guaranteed to be destroyed before its target" - yes, it is.

So, if domain destruction also implicitly revoke all _its_ irq
permissions (because of where they are stored), there is no additional
cleanup needed here.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--eu12+zRL7gQwOC+E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxccD4ACgkQ24/THMrX
1yxZTAf/cCZj1qYa8Tw4iAsFCgSRWGCpROaFpFG77kinwtsIv4rplG3Nx/fpg7Dy
pdtwecEfL285yuGfzkTcBgifEUOgi5IecSg7aePDGzOE1+hLYrX/9dCeE89mW0bk
AFWLfyt+NKu0F/ywJMCbtj9RrZ3OvTrzhGwDPALfG9bRo6JEOcu7aB0zo9+saml7
KQY90EVrY8T+bstRGlBXht0FW8+aIXptYGUWqN2eNIk01jFE9fO+wvpUcTeYL+Vb
vWar1bvyB/nSLoPPEuEcRJbZGIfX1pqwzhx2rTZkuE0YI1O3HAU/XN/RvMx/gCjP
K5EMSLEoXHGcT/KEF0riNBVMXppRfQ==
=qnC0
-----END PGP SIGNATURE-----

--eu12+zRL7gQwOC+E--


--===============1104296392807452262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1104296392807452262==--
