From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 5/6] xen-pt: Hide MSI-X from xen stubdoms
Date: Tue, 12 Mar 2019 15:29:55 +0100
Message-ID: <20190312142955.GA1835@mail-itl>
References: <20190311180216.18811-1-jandryuk@gmail.com>
 <20190311180216.18811-6-jandryuk@gmail.com>
 <20190312120419.2fdqh3atomnafvby@Air-de-Roger>
 <20190312123808.GG1208@mail-itl>
 <CAKf6xpvVBDGCmbcgU0u39Sh5NjFRf95O3UQ=_DmD6uVb-vx-sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5104105321553298399=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VpTG=RP=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1h3iPx-0000d3-ES
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 14:30:09 +0000
In-Reply-To: <CAKf6xpvVBDGCmbcgU0u39Sh5NjFRf95O3UQ=_DmD6uVb-vx-sA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5104105321553298399==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2019 at 09:58:56AM -0400, Jason Andryuk wrote:
> On Tue, Mar 12, 2019 at 8:38 AM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Tue, Mar 12, 2019 at 01:04:19PM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Mon, Mar 11, 2019 at 02:02:15PM -0400, Jason Andryuk wrote:
> > > > MSI-X is not supported in Xen stubdoms, so it must be disabled.  Us=
e the
> > > > existing xen_pt_hide_dev_cap to hide when running under -xen-stubdo=
m.
> > >
> > > I'm afraid this requires some more context. What's the actual issue
> > > that prevents MSI-X from working?
> >
> > At least missing "Fix PCI passthrough for HVM with stubdomain" series,
> > but that's mostly on Xen side (+ one change how QEMU enable MSI-X in
> > config space).
> > Some of it can be worked around by enabling permissive mode. Jason, did
> > you had a chance to test it with any MSI-X device?
> > I'm not aware of anything thing particular that breaks MSI-X but not
> > MSI. Besides much less devices lying around to test MSI-X...
>=20
> OpenXT and Qubes have used a compile time patch that disabled MSI-X
> for a long time.  The OpenXT patch description doesn't help:
> """
> Currently we do not support MSI-X setup for PCI devices passed through.
>=20
> Although the specification mentions that PCI-e devices might implement on=
ly
> MSI-X there is not a lot of those and mostly none that we have encountere=
d yet.
> Considering that, we force devices to use MSI by hiding the MSI-X capabil=
ity.
> """
>=20
> To be honest, I didn't question the reasoning and just made the
> compile-time disabling into a runtime disabling.
>=20
> I tested with a NEC uPD720200 XHCI controller supporting MSI-X.  There
> was an error related to setting up MSI-X when I failed to pass the
> "-xen-stubdom" flag.  I can pull that log when I get back to the
> machine.  With this patch, MSI-X was hidden in the guest, but dom0
> showed MSI-X present but unused.
>=20
> Marek, is "Use xc_physdev_msi_set_enable for enabling MSI..." the QEMU
> patch you are refer to?  Do you think permissive mode would allow
> MSI-X to work without that patch?  I could test that out.

Yes, this one. Permissive mode should work around it.
There is also another patch about IRQ permission, but I believe you
already have it in OpenXT.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlyHwmMACgkQ24/THMrX
1ywlAwf+JJK/gwzzZHne8lu20T/YB8NazL8XtD5RQooIlAIwWmHsL14RfQ8bPzhP
qrmKLzK4mWjAZ/hIoSFgCkWnF6OT8o4VJLxf+X5qTe8wHok5fgd8F99MmQzmG66h
HHFTJRHta4bpr5wsNDqFSRhYeNijP6u4zqm7VDsQQx0UjtFzcDYepBf5rTRuy9xT
g0ZB6tHsX2NSfrRFemxX/jGJ3XehRlWL4+8n4nf4zGPIiCwusXvzA41TGMssN849
4Hc74aRDRWmddWozVpJzxL+VAu0XEoBJB85izX3hb3jOQJQLQiKZb6Usn6AwpsS1
KhJOs2zel1O2WN/cP4llmaHV5uY3jA==
=ojjb
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--


--===============5104105321553298399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5104105321553298399==--
