From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to
 irq created for msi.
Date: Wed, 27 Feb 2019 16:18:51 +0100
Message-ID: <20190227151851.GF19265@mail-itl>
References: <20190208101559.GA21228@mail-itl>
 <20190208101705.31790-1-marmarek@invisiblethingslab.com>
 <5C766F8A020000780021AA64@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8690499268110774848=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zlFm=RC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gz0z7-0008TB-3Y
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 15:19:01 +0000
In-Reply-To: <5C766F8A020000780021AA64@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8690499268110774848==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tmoQ0UElFV5VgXgH"
Content-Disposition: inline


--tmoQ0UElFV5VgXgH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to irq created
 for msi.

On Wed, Feb 27, 2019 at 04:07:54AM -0700, Jan Beulich wrote:
> >>> On 08.02.19 at 11:17, <marmarek@invisiblethingslab.com> wrote:
> > There is one code path where I haven't managed to properly extract
> > possible stubdomain in use:
> > pci_remove_device()
> >  -> pci_cleanup_msi()
> >    -> msi_free_irqs()
> >      -> msi_free_irq()
> >        -> destroy_irq()
> >=20
> > For now I've hardcoded hardware_domain there (in msi_free_irqs). Can it=
 happen
> > when device is still assigned to some domU?
>=20
> In case this question is still open: No, it can't with current code,
> and provided Dom0 behaves correctly.

Thanks for confirmation.

> > @@ -368,13 +369,13 @@ static int __init hpet_assign_irq(struct hpet_eve=
nt_channel *ch)
> >  {
> >      int irq;
> > =20
> > -    if ( (irq =3D create_irq(NUMA_NO_NODE)) < 0 )
> > +    if ( (irq =3D create_irq(NUMA_NO_NODE, hardware_domain)) < 0 )
> >          return irq;
> > =20
> >      ch->msi.irq =3D irq;
> >      if ( hpet_setup_msi_irq(ch) )
> >      {
> > -        destroy_irq(irq);
> > +        destroy_irq(irq, hardware_domain);
> >          return -EINVAL;
> >      }
>=20
> Why don't you take the opportunity here (and elsewhere) and properly
> remove hwdom access to such internal-to-Xen IRQs? Simply pass NULL
> here, and skip permission granting in this case (create_irq() already
> checks for NULL anyway).

Already queued for v5, per Roger's review.

> > @@ -190,19 +190,19 @@ int create_irq(nodeid_t node)
> >          desc->arch.used =3D IRQ_UNUSED;
> >          irq =3D ret;
> >      }
> > -    else if ( hardware_domain )
> > +    else if ( dm_domain )
> >      {
> > -        ret =3D irq_permit_access(hardware_domain, irq);
> > +        ret =3D irq_permit_access(dm_domain, irq);
>=20
> Doesn't this imply that Dom0 has no way of cleaning up after the
> guest/stubdom pair? IOW I wonder whether both dm and hwdom
> should be granted access.

See discussion with Roger on this very patch.
In short: since permissions are stored in domain struct, not irq, there
is not much to cleanup after domain destruction. Also, toolstack in dom0
has no idea about IRQs allocated by stubdomain, so it couldn't do such
cleanup anyway.

> > @@ -2095,7 +2099,9 @@ int map_domain_pirq(
> >                  irq =3D info->arch.irq;
> >              }
> >              msi_desc->irq =3D -1;
> > -            msi_free_irq(msi_desc);
> > +            msi_free_irq(msi_desc,
> > +                         current->domain->target =3D=3D d ? current->d=
omain
> > +                                                      : hardware_domai=
n);
>=20
> Note how ->irq gets set to -1 prior to the call (and also in at least
> one other instance), which will lead to skipping of the destroy_irq()
> call, and hence skipping of the permission removal. Or wait, that's
> going to be taken care of in the caller as it seems. If this is also
> your understanding, then please add a sentence to the description
> pointing this out. The split logic isn't really helpful here (I know it
> was me who wrote it, in an attempt to avoid re-writing everything
> basically from scratch).

Yes, that matches my understanding - the caller will call on error
destroy_irq(), if it called create_irq() before (which may not always be
the case - and I think this is why it isn't destroyed here).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--tmoQ0UElFV5VgXgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlx2qlsACgkQ24/THMrX
1yyVqQf/cRycL+h2csGRlslcmV0jTV1ZaZd5ZWxX+F4RYKItzQ2QMAPeRHYVcPSu
4tlRhywETY4paKaHrtvZVc+hfE/k2R25N0Q2GOPqQ/jgqFKWZPgtyYphiXPMb24f
jgSo8pLMwZMp3yHXagufpF73my9jmE6gO59gVtSlXDsCoJBh5lMh6Hj1awMMEj5t
LWxfS1zn7akEy6viSpmUGu8f+wRGMCDL2B+VJAe9RWfqOQylmXpdPXExN3zr6xpt
Qyclb1ZsvhCpt4YJ3FoJdw3mCBmsrzlgmEyc1Y13mQa6SzJ80TapGbBK+++uk5qF
Y72hn0uP90g8OCUCo9hzjGK8kUod+w==
=FfSy
-----END PGP SIGNATURE-----

--tmoQ0UElFV5VgXgH--


--===============8690499268110774848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8690499268110774848==--
